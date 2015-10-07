<?php

class Admin extends MX_Controller
{
	private $js;
	private $css;
	
	const MODULE_PATH = "modules/auctionhouse/";
	const CONFIG_PATH = "application/modules/auctionhouse/config/auctionhouse_config.php";
	
	public function __construct()
	{
		// Make sure to load the administrator library!
		$this->load->library('administrator');

		parent::__construct();
		
		$this->load->model("auctionhouse_model");
		
		// Set JS and CSS paths
		$this->js = "modules/auctionhouse/js/admin.js";
		$this->css = false;
		
		requirePermission("viewAdmin");
	}

	public function index()
	{
		// Change the title
		$this->administrator->setTitle("Auction House");
		
		// Prepare little stats
		$stats = array();
		
		// Loop the realms
		foreach ($this->realms->getRealms() as $id => $realm)
		{
			$EmulatorStr = $this->formatEmulatorString($realm->getConfig('emulator'));
			
			// Check if the emulator is supported
			if ($this->ModelExists($EmulatorStr . "_model") && $EmulatorStr != 'mangos')
			{
				// Prepare the realm array
				$stats[$id] = array(
					'name' 	=> $realm->getName(),
					'stats'	=> array()
				);
				
				// Loop the factions
				for ($i = 1; $i <= 3; $i++)
				{
					$count = 0;
					
					// Try getting the cached guids
					if ($list = $this->cache->get("auctionhouse/auctioneers_by_faction_" . $realm->getId() . "_" . $i))
					{
						$count = count((strstr($list, ',') ? explode(',', $list) : array($list)));
					}
					unset($list);
					
					$stats[$id]['stats'][$this->auctionhouse_model->ResolveFactionString($i)] = $count;
					
					unset($count);
				}
			}
		}
		unset($EmulatorStr, $realm, $id);
		
		// Prepare my data
		$data = array(
			'url' 		=> $this->template->page_url,
			'stats'		=> (!empty($stats) ? $stats : false),
			'config'	=> $this->getConfigSource()
		);
		
		unset($stats);
		
		// Load my view
		$output = $this->template->loadPage("admin.tpl", $data);

		// Put my view in the main box with a headline
		$content = $this->administrator->box('Auction House', $output);

		// Output my content. The method accepts the same arguments as template->view
		$this->administrator->view($content, $this->css, $this->js);
	}
	
	public function scan()
	{
		// Get a list with the auctioneer entries
		$AuctioneerEntries = $this->auctionhouse_model->GetPossibleAuctioneerEntriesList();
		
		// Loop the realms
		foreach ($this->realms->getRealms() as $id => $realm)
		{
			$EmulatorStr = $this->formatEmulatorString($realm->getConfig('emulator'));
			
			// Check if the emulator is supported
			if ($this->ModelExists($EmulatorStr . "_model") && $EmulatorStr != 'mangos')
			{
				echo '<br /><strong>', $realm->getName(), ' results:</strong><br />';
				
				// Load the model
				$Model = $this->LoadEmulatorModel($EmulatorStr);
				// Set the realm id
				$Model->setRealm($realm->getId());
				$this->auctionhouse_model->setRealm($realm->getId());
				
				// Get all the spawned auctioneers, array format
				$SpawnedAuctioneers = $Model->GetAllSpawnedAuctioneers($AuctioneerEntries);
				
				// Prepare the factions list
				$FactionLists = array(1 => '', 2 => '', 3 => '');
				
				// Loop the auctioneers and put them into the appropriete faction list
				foreach ($SpawnedAuctioneers as $i => $data)
				{
					if ($faction = $this->auctionhouse_model->ResolveAuctioneerFactionInt((int)$data['entry']))
					{
						// Put the guid in the list
						$FactionLists[$faction] .= $data['guid'] . ',';
					}
				}
				
				echo '<font size="2">Found ';
				// Save each list
				foreach ($FactionLists as $faction => $list)
				{
					// Remove the last ,
					$list = rtrim($list, ',');
					// Save it forever
					$this->cache->save("auctionhouse/auctioneers_by_faction_" . $realm->getId() . "_" . $faction, $list);
					// Print info
					echo (substr_count($list, ',') + 1) . ' ' . $this->auctionhouse_model->ResolveFactionString($faction) . ($faction != 3 ? ', ' : '.</font><br />');
				}
				unset($FactionLists, $faction, $list);
			}
		}
		
		die;
	}
	
	private function formatEmulatorString($str)
	{
		return str_replace(array('_ra', '_soap', '_rbac'), '', $str);
	}

	private function ModelExists($model)
	{
		if (file_exists(APPPATH.self::MODULE_PATH."models/".$model.".php"))
		{
		   return true;
		}
		
		return false;
	}
	
	private function LoadEmulatorModel($str)
	{
		return $this->load->model($str . "_model");
	}
	
	private function getConfigSource()
	{
		$handle = fopen(self::CONFIG_PATH, "r");
		$data = fread($handle, filesize(self::CONFIG_PATH));
		fclose($handle);

		return $data;
	}
	
	public function saveConfigSource()
	{
		if ($this->input->post("source"))
		{
			$file = fopen(self::CONFIG_PATH, "w");
			fwrite($file, $this->input->post("source"));
			fclose($file);

			die("تنظیمات با موفقیت ذخیره شد");
		}
		else
		{
			die("داده ای برای تنظیم وجود ندارد");
		}
	}
}