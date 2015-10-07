<?php

class Auctionhouse extends MX_Controller
{
	private $cacheTime 			= '1 minutes';
	private $canCache			= true;
	private $runtimeCache;
	
	private $js;
	private $css;
	
	private $realmId;
	private $realmName;
	private $page;
	private $faction;
	private $search;
	private $sort;
	private $auctions 			= array();
	private $auctionPerPage 	= 15;
	private $PaginationHTML;
	
	private $EmulatorSimpleString = '';
	
	const FACTION_ALL 			= 0;
	const FACTION_ALLIANCE 		= 1;
	const FACTION_HORDE			= 2;
	const FACTION_NEUTRAL 		= 3;
	
	const AH_SORT_TIME_DESC		= 0;
	const AH_SORT_TIME_ASC		= 1;
	const AH_SORT_SELLER_DESC	= 2;
	const AH_SORT_SELLER_ASC	= 3;
	const AH_SORT_PRICE_DESC	= 4;
	const AH_SORT_PRICE_ASC		= 5;
	
	const MODULE_PATH 			= "modules/auctionhouse/";
	
	function __construct()
	{
		parent::__construct();
		
		// Set JS and CSS paths
		$this->js = "modules/auctionhouse/js/auctionhouse.js";
		$this->css = "modules/auctionhouse/css/auctionhouse.css";
		
		$this->load->model("auctionhouse_model");
		$this->load->config('auctionhouse/auctionhouse_config');
		$this->load->library('pagination');
		
		if (!file_exists("application/cache/data/auctionhouse"))
		{
			mkdir("application/cache/data/auctionhouse");
			fopen("application/cache/data/auctionhouse/index.html", "w");
		}
		
		// Load the config variables
		$this->auctionPerPage = $this->config->item("auctions_per_page");
		$this->cacheTime = $this->config->item("ah_cache_time");
	}
	
	/**
	 * Initialize
	 */
	public function index($realm = false, $faction = 0, $search = false, $sort = self::AH_SORT_TIME_DESC, $page = 0)
	{
		$this->setRealm($realm);
		$this->setFaction($faction);
		$this->setSearch($search);
		$this->setSort($sort);
		$this->setPage($page);
		
		if ($this->realmId !== false)
		{
			$this->getAuctionPage();
		}
		else
		{
			$this->getError();
		}
	}
	
	/**
	 * Determinate which Id to assign
	 */
	public function setRealm($realmId)
	{
		// Get the first realm if we have no realm
		if ($realmId === false)
		{
			$realms = $this->realms->getRealms();
			
			foreach ($realms as $realmData)
			{
				if ($this->ModelExists($this->FormatEmulatorString($realmData->getConfig('emulator')) . '_model'))
				{
					$realmId = $realmData->getId();
					break;
				}
			}
			unset($realms, $realmData);
		}
		
		// Check if the realm is supported
		if (!$this->ModelExists($this->FormatEmulatorString($this->realms->getRealm($realmId)->getConfig('emulator')) . '_model'))
		{
			$this->realmId = false;
			return;
		}
		
		// Check if valid X-Y format
		if ($realmId !== false && is_numeric($realmId) && $this->realms->realmExists($realmId))
		{
			$this->realmId = $realmId;
			$this->EmulatorSimpleString = $this->FormatEmulatorString($this->realms->getRealm($realmId)->getConfig('emulator'));
			$this->LoadEmulatorModel();
			$this->GetEmulatorModel()->setRealm($realmId);
			$this->auctionhouse_model->setRealm($realmId);
		}
		else
		{
			$this->realmId = false;
		}
	}
	
	public function setFaction($id)
	{
		if (is_numeric($id) && ((int)$id >= self::FACTION_ALL && (int)$id <= self::FACTION_NEUTRAL))
		{
			$this->faction = (int)$id;
		}
		else
		{
			$this->faction = 0;
		}
	}
	
	public function setSearch($str)
	{
		// Decode the string
		$str = rawurldecode($str);
		
		if ($str == 'null')
		{
			$this->search = false;
			return;
		}
		
		$str = preg_replace("/[^A-Za-z0-9-' ]/i", "", $str); 
		
		// Check the length
		if (strlen($str) < 3)
		{
			$this->search = false;
			return;
		}
		
		$this->search = $str;
	}
	
	public function setSort($id)
	{
		if (is_numeric($id) && (int)$id >= self::AH_SORT_TIME_DESC && (int)$id <= self::AH_SORT_PRICE_ASC)
		{
			$this->sort = (int)$id;
		}
		else
		{
			$this->sort = self::AH_SORT_TIME_DESC;
		}
	}
	
	public function setPage($page)
	{
		if (is_numeric($page))
		{
			$this->page = (int)$page;
		}
		else
		{
			$this->page = 0;
		}
	}
	
	private function GetMyCharacterGUIDsList()
	{
		if ($this->user->isOnline())
		{
			$CacheKey = "auctionhouse/auctionhouse_usercharacters_" . $this->realmId . "_" . $this->user->getId();
		
			// Check for cache
			if (($cache = $this->cache->get($CacheKey)) === false)
			{
				$CharObj = $this->realms->getRealm($this->realmId)->getCharacters();
				
				//Open the connection to the databases
				$CharObj->connect();
				
				// Get our characters in this realm
				$MyCharacters = $CharObj->getCharactersByAccount($this->user->getId());
				
				$MyCharacterGUIDs = array();
				// Put the character guids in a single demensional array
				if ($MyCharacters)
				{
					foreach ($MyCharacters as $i => $char)
					{
						$MyCharacterGUIDs[] = (int)$char['guid'];
					}
				}
				
				unset($CharObj, $MyCharacters);
				
				// Cache the results
				$this->cache->save($CacheKey, $MyCharacterGUIDs, strtotime('10 minutes', 0));
				
				return $MyCharacterGUIDs;
			}
			else
			{
				return $cache;
			}
		}
		
		return false;
	}
	
	/**
	 * Get character info
	 */
	private function getInfo()
	{
		$MyCharacterGUIDs = $this->GetMyCharacterGUIDsList();
		
		// Get the realm name
		$this->realmName = $this->auctionhouse_model->realm->getName();
		
		// Get the Auctions count and Auctions for the current page
		$TotalAuctions = $this->GetEmulatorModel()->GetAuctionsCount($this->faction, $this->search);
		$AuctionsLimit = $this->page . ',' . $this->auctionPerPage;
		$this->auctions = $this->GetEmulatorModel()->GetAuctions($this->faction, $this->search, $this->sort, $AuctionsLimit);
		
		// Generate pagination
		$PaginationConfig['base_url'] = $this->template->page_url . 'auctionhouse/index/' . $this->realmId . '/' . $this->faction . '/' . ($this->search ? $this->search : 'null') . '/' . $this->sort . '/';
		$PaginationConfig['total_rows'] = $TotalAuctions;
		$PaginationConfig['per_page'] = $this->auctionPerPage; 
		$PaginationConfig['uri_segment'] = 7;
    	$PaginationConfig["num_links"] = 5;

		$this->pagination->initialize($PaginationConfig); 
		$this->PaginationHTML = $this->pagination->create_links();
		
		// Free some mem
		unset($PaginationConfig, $AuctionsLimit, $TotalAuctions);
		
		// Prepare the auctions
		foreach ($this->auctions as $i => $auction)
		{
			if ((int)$auction['itemEntry'] > 0)
			{
				// Get the item icon
				$this->auctions[$i]['itemIcon'] = $this->getItem((int)$auction['itemEntry']);
				// Check for stack
				$this->auctions[$i]['stack'] = (isset($auction['stack']) && (int)$auction['stack'] > 1) ? $auction['stack'] : false;
				
				// Get some item info
				if ($ItemInfo = $this->getItemInfo((int)$auction['itemEntry']))
				{
					$this->auctions[$i]['itemName']  = $ItemInfo['name'];
					$this->auctions[$i]['itemQuality']  = $ItemInfo['Quality'];
				}
				else
				{
					$this->auctions[$i]['itemName']  = 'Unknown';
					$this->auctions[$i]['itemQuality']  = 0;
				}
				unset($ItemInfo);
				
				// Prepare the time
				$this->auctions[$i]['timeLeft'] = $this->getTimeRemaining($auction['time']);
				
				// Prepare the prices
				// Check for people bids
				if ((int)$auction['lastbid'] > 0)
				{
					$this->auctions[$i]['bidPrice'] = $this->getGoldString($auction['lastbid']);
				}
				else
				{
					$this->auctions[$i]['bidPrice'] = $this->getGoldString($auction['startbid']);
				}
				// Check for buyout
				$this->auctions[$i]['buyPrice'] = ((int)$auction['buyoutprice'] > 0) ? $this->getGoldString($auction['buyoutprice']) : false;
				
				// Resolve the Auctioneer faction
				// Mangos handles the houses diferrently
				if ($this->EmulatorSimpleString == 'mangos')
				{
					$this->auctions[$i]['auctioneer'] = $this->auctionhouse_model->ResolveAuctioneerFaction($this->GetEmulatorModel()->ResolveAuctionHouse($auction['houseid']));
				}
				else
				{
					$this->auctions[$i]['auctioneer'] = $this->ResolveAuctioneer($auction['auctioneerguid']);
				}
				
				// Check if we own the auction
				// By default we dont
				$this->auctions[$i]['UserOwned'] = false;
				
				if (isset($MyCharacterGUIDs) && !empty($MyCharacterGUIDs))
				{
					if (in_array((int)$auction['itemowner'], $MyCharacterGUIDs))
						$this->auctions[$i]['UserOwned'] = true;
				}
			}
			else
			{
				unset($this->auctions[$i]);
			}
		}
	}
	
	/**
	 * Load the auction house
	 * @return String
	 */
	private function getAuctionPage()
	{
		$PageCacheKey = "auctionhouse/auctionhouse_" . $this->realmId . "_" . $this->faction . ($this->search ? '_search_' . rawurlencode($this->search) : '') . "_sort_" . $this->sort . "_page_" . $this->page;
		
		// Check for cache
		$cache = $this->cache->get($PageCacheKey);

		if ($cache !== false)
		{
			$this->template->setTitle('Auction House - Page ' . (((int)$this->page + (int)$this->auctionPerPage) / (int)$this->auctionPerPage));
			$this->template->setDescription($cache['description']);
			$this->template->setKeywords($cache['keywords']);
			
			$page = $cache['page'];
		}
		else
		{
			// Load all items and info
			$this->getInfo();
			
			$this->template->setTitle('Auction House - Page ' . (((int)$this->page + (int)$this->auctionPerPage) / (int)$this->auctionPerPage));
			
			// Prepare the compitable realms
			$CompitableRealms = array();
			foreach ($this->realms->getRealms() as $realmData)
			{
				if ($this->ModelExists($this->FormatEmulatorString($realmData->getConfig('emulator')) . '_model'))
				{
					$CompitableRealms[] = array('id' => $realmData->getId(), 'name' => $realmData->getName());
				}
			}
			unset($realmData);
			
			$pageData = array(
				"url" 					=> $this->template->page_url,
				"realmId" 				=> $this->realmId,
				"realmName" 			=> $this->realmName,
				"realms" 				=> $CompitableRealms,
				"CurrentPage"			=> $this->page,
				"CurrentFaction"		=> $this->faction,
				"CurrentSearch" 		=> $this->search,
				"CurrentSearch_Encoded" => rawurlencode($this->search),
				"CurrentSort"			=> $this->sort,
				"auctions" 				=> $this->auctions,
				"pagination" 			=> $this->PaginationHTML,
				"fcms_tooltip" 			=> $this->config->item("use_fcms_tooltip")
			);
			
			unset($CompitableRealms);
			
			$pageTpl = $this->template->loadPage("auctionhouse.tpl", $pageData);

			$data = array(
				"module" => "default", 
				"headline" => $this->realmName . " &rarr; Auction House",
				"content" => $pageTpl
			);

			$page = $this->template->loadPage("page.tpl", $data);
			
			$keywords = "auction,house,auctionhouse,".$pageData['realmName'].",page".($this->search ? ',search,'.str_replace(' ', ',', $this->search) : '');
			$description = $pageData['realmName'] . '\'s Auction House';
			
			$this->template->setDescription($description);
			$this->template->setKeywords($keywords);
			
			if ($this->canCache)
			{
				// Cache for 5 min
				$this->cache->save($PageCacheKey, array('page' => $page, 'keywords' => $keywords, 'description' => $description), strtotime($this->cacheTime, 0));
			}
		}

		$this->template->view($page, $this->css, $this->js);
	}

	/**
	 * Show "character doesn't exist" error
	 */
	private function getError($get = false)
	{
		$this->template->setTitle("خطایی رخ داده است!");

		$data = array(
			"module" => "default", 
			"headline" => 'ریلم یافت نشد', 
			"content" => "<center style='margin:10px;font-weight:bold;'>ریلم انتخاب شده وجود ندارد و یا پشتیبانی نمی شود.</center>"
		);

		$page = $this->template->loadPage("page.tpl", $data);

		if ($get)
		{
			return $page;
		}
		else
		{
			$this->template->view($page);
		}
	}
	
	private function getGoldString($int)
	{
		// Get the values
		$copper = (int)$int % 100;
		$silver = floor((int)$int / 100) % 100;
		$gold = floor((int)$int / 10000);
		
		return (($gold > 0) ? $gold . ' <span class="ah-gold"></span>' : '') . (($gold > 0 || $silver > 0) ? $silver . ' <span class="ah-silver"></span>' : '') . $copper . ' <span class="ah-copper"></span>';
	}
	
	public function percent($num_amount, $num_total)
	{
		$count1 = $num_amount / $num_total;
		$count2 = $count1 * 100;
		$count = number_format($count2, 0);
		
		return $count;
	}
	
	/*
	* get the remaining time by given date/time
	*
	* return string
	*/
	public function getTimeRemaining($end)
	{
		$start = time();
		$span = ($end-$start);
		
		if ($span < 0)
		{
			return 'Expired';
		}
		
		$oneHour = (60 * 60);
		$hours = floor($span / $oneHour); 
		$span = $span % $oneHour;
		
		if ($hours > 0)
		{
			return $hours . ' hour' . ($hours == 1 ? '' : 's');
		}
		
		$minutes = floor($span / 60);
		
		if ($minutes > 0)
		{
			return $minutes . ' minute' . ($minutes == 1 ? '' : 's');
		}
		
		if ($minutes == 0)
		{
			return '1 minute';
		}
		
		return 'Unknown';
	}
	
	private function FormatEmulatorString($str)
	{
		return str_replace(array('_ra', '_soap', '_rbac'), '', $str);
	}
	
	private function getEmulatorString()
	{
		return $this->EmulatorSimpleString;
	}
	
	private function ModelExists($model)
	{
		if (file_exists(APPPATH.self::MODULE_PATH."models/".$model.".php"))
		{
		   return true;
		}
		
		return false;
	}
	
	private function LoadEmulatorModel()
	{
		return $this->load->model($this->EmulatorSimpleString . "_model");
	}
	
	private function GetEmulatorModel()
	{
		$ModelName = $this->EmulatorSimpleString . "_model";
		return $this->$ModelName;
	}
	
	public function getItem($id = false)
	{
		if ($id != false)
		{
			$DisplayIdCache = $this->cache->get("items/item_displayid_".$this->realmId."_".$id);
			
			if ($DisplayIdCache !== false)
			{
				$IconCache = $this->cache->get("items/display_".$DisplayIdCache);

				if ($IconCache != false)
				{
					return "<a 	href='" . $this->template->page_url . "item/" . $this->realmId . "/" . $id . "' 
								rel='item=".$id."' 
								data-realm='".$this->realmId."'>
							</a><img src='https://wow.zamimg.com/images/wow/icons/large/".$IconCache.".jpg' />";
				}
				else
				{
					return "<a 	href='" . $this->template->page_url . "item/" . $this->realmId . "/" . $id . "' 
								rel='item=".$id."' 
								data-realm='".$this->realmId."'>
							</a><img src='https://wow.zamimg.com/images/wow/icons/large/inv_misc_questionmark.jpg' />";
				}
			}
			else
			{
				$this->canCache = false;
				return $this->template->loadPage("icon_ajax.tpl", array('id' => $id, 'realm' => $this->realmId, 'url' => $this->template->page_url));
			}
		}
	}
	
	public function getItemInfo($id = false)
	{
		if ($id != false)
		{
			$ItemCache = $this->cache->get("items/item_".$this->realmId."_".$id);
			
			if ($ItemCache !== false)
			{
				return array('name' => $ItemCache['name'], 'Quality' => $ItemCache['Quality']);
			}
			else
			{
				$item = $this->realms->getRealm($this->realmId)->getWorld()->getItem($id);
				
				return array('name' => $item['name'], 'Quality' => $item['Quality']);
			}
		}
	}
	
	private function ResolveAuctioneer($guid)
	{
		$EntryCache = $this->cache->get("auctionhouse/auctioneer_entry_" . $this->realmId . "_" . $guid);
		
		if ($EntryCache !== false)
		{
			return $this->auctionhouse_model->ResolveAuctioneerFaction($EntryCache);
		}
		else
		{
			// Got to resolve the aunctioneer by the database
			$entry = $this->GetEmulatorModel()->GetAuctioneerEntry((int)$guid);
			
			// Save the auctioneer guid to the faction cache
			$this->auctionhouse_model->SaveAuctioneerByFaction((int)$guid, $entry);
			
			// Save it forever
			$this->cache->save("auctionhouse/auctioneer_entry_" . $this->realmId . "_" . $guid, $entry);
			
			return $this->auctionhouse_model->ResolveAuctioneerFaction($entry);
		}
		
		return false;
	}
}
