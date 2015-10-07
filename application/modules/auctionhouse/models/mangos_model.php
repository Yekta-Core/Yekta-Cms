<?php

class Mangos_model extends CI_Model
{
	public $realm;
	private $realmId;
	private $connection = false;
	private $WorldConnection = false;
	private $autoIndexStore = array();
	private $runtimeCache;
	
	const AH_SORT_TIME_DESC		= 0;
	const AH_SORT_TIME_ASC		= 1;
	const AH_SORT_SELLER_DESC	= 2;
	const AH_SORT_SELLER_ASC	= 3;
	const AH_SORT_PRICE_DESC	= 4;
	const AH_SORT_PRICE_ASC		= 5;
	
	public function __construct()
	{
		parent::__construct();
	}
	/**
	 * Assign the realm object to the model
	 */
	public function setRealm($id)
	{
		$this->realmId = $id;
		$this->realm = $this->realms->getRealm($id);
	}

	/**
	 * Connect to the character database
	 */
	public function connect()
	{
		if ($this->connection)
			return true;
			
		$this->realm->getCharacters()->connect();
		$this->connection = $this->realm->getCharacters()->getConnection();
	}
	
	/**
	 * Connect to the world database
	 */
	public function WorldConnect()
	{
		if ($this->WorldConnection)
			return true;
			
		$this->realm->getWorld()->connect();
		$this->WorldConnection = $this->realm->getWorld()->getConnection();
	}
	
	public function GetAuctionsCount($faction = 0, $search = false)
	{
		$this->connect();
		
		$where = 'WHERE `item_template` > 0';
		
		// Check for special occasions
		if ($faction > 0 || $search !== false)
		{
			// Check if we're looking into specific faction
			if ($faction > 0)
			{
				// Get the auctioneer guids list
				$list = $this->GetHousesByFaction($faction);
				
				// Add to the where clause
				$where .= ' AND `houseid` IN(' . ($list ? $list : '0') . ')';
				
				unset($list);
			}
			
			// Check if we're looking into specific item name
			if ($search !== false)
			{
				// Get possible item entries
				$Entries = $this->GetPossibleItemEntriesList($search);
				
				// Add to the where clause
				$where .= ' AND `item_template` IN(' . ($Entries ? $Entries : '0') . ')';
				
				unset($Entries);
			}
		}
		
		$query = $this->connection->query("SELECT COUNT(*) AS num FROM `auction` ".$where.";");
		
		if ($this->connection->_error_message())
		{
			die("function GetAuctionsCount() returned SQL error: " . $this->connection->_error_message());
		}
		
		if ($query && $query->num_rows() > 0)
		{
			$results = $query->result_array();
			
			return (int)$results[0]['num'];
		}
		
		return 0;
	}
	
	public function GetAuctions($faction = 0, $search = false, $sort = 0, $limit = "0,15")
	{
		$this->connect();
		
		$where = 'WHERE `auction`.`item_template` > 0';
		
		// Check for special occasions
		if ($faction > 0 || $search !== false)
		{
			// Check if we're looking into specific faction
			if ($faction > 0)
			{
				// Get the auctioneer guids list
				$list = $this->GetHousesByFaction($faction);
				
				// Add to the where clause
				$where .= ' AND `auction`.`houseid` IN(' . ($list ? $list : '0') . ')';
				
				unset($list);
			}
			
			// Check if we're looking into specific item name
			if ($search !== false)
			{
				// Get possible item entries
				$Entries = $this->GetPossibleItemEntriesList($search);
				
				// Add to the where clause
				$where .= ' AND `auction`.`item_template` IN(' . ($Entries ? $Entries : '0') . ')';
				
				unset($Entries);
			}
		}
		
		// Prepare the sorting
		$SortString = $this->GetSorting($sort);
		
		$query = $this->connection->query("	SELECT 
												`auction`.`id`, 
												`auction`.`houseid`, 
												`auction`.`itemguid`, 
												`auction`.`itemowner`, 
												`auction`.`buyoutprice`, 
												`auction`.`time`, 
												`auction`.`buyguid`, 
												`auction`.`lastbid`, 
												`auction`.`startbid`, 
												`auction`.`deposit`, 
												`auction`.`item_template` AS itemEntry, 
												`auction`.`item_count` AS stack, 
												`characters`.`name` AS owner 
											FROM `auction` 
											LEFT JOIN `characters` ON `auction`.`itemowner` = `characters`.`guid` 
											".$where." 
											ORDER BY ".$SortString." 
											LIMIT ".$limit.";");
		
		if ($this->connection->_error_message())
		{
			die("function GetAuctions() returned SQL error: " . $this->connection->_error_message());
		}
		
		if ($query && $query->num_rows() > 0)
		{
			$results = $query->result_array();
			
			return $results;
		}
		
		return array();
	}
	
	private function GetSorting($id)
	{
		switch ((int)$id)
		{
			case self::AH_SORT_TIME_DESC:	return '`auction`.`time` DESC';
			case self::AH_SORT_TIME_ASC:	return '`auction`.`time` ASC';
			case self::AH_SORT_SELLER_DESC:	return '`auction`.`itemowner` DESC';
			case self::AH_SORT_SELLER_ASC:	return '`auction`.`itemowner` ASC';
			case self::AH_SORT_PRICE_DESC:	return '`auction`.`buyoutprice` DESC, `auction`.`startbid` DESC';
			case self::AH_SORT_PRICE_ASC:	return '`auction`.`buyoutprice` ASC, `auction`.`startbid` ASC';
		}
		
		return '`auctionhouse`.`id` DESC';
	}
	
	private function GetPossibleItemEntriesList($name)
	{
		$EntryCache = $this->cache->get("auctionhouse/search_item_entries_" . ($this->realmId ? $this->realmId : 0) . "_" . rawurlencode($name));
		
		if ($EntryCache !== false)
		{
			return $EntryCache;
		}
		else
		{
			$this->WorldConnect();
	
			$query = $this->WorldConnection->query("SELECT `entry` FROM `item_template` WHERE `name` LIKE CONCAT('%', ?, '%');", array($name));
			
			if ($query && $query->num_rows() > 0)
			{
				$result = $query->result_array();
			}
	
			// If we have the db results
			if (isset($result))
			{
				//temp list
				$list = '';
				
				//merge into single dementional array
				foreach ($result as $key => $item)
				{
					$list .= $item['entry'] . ',';
				}
				$list = rtrim($list, ',');
				
				unset($result, $key, $item);
				
				// Save it forever
				$this->cache->save("auctionhouse/search_item_entries_" . ($this->realmId ? $this->realmId : 0) . "_" . rawurlencode($name), $list);
				
				return $list;
			}
		}
		
		return false;
	}
	
	private function GetAutoIndex($search)
	{
		// Look for our search in the autoindex store
		foreach ($this->autoIndexStore as $index => $str)
		{
			if ($str == $search)
				return $index;
		}
		
		// We have no record for this search
		$this->autoIndexStore[] = $search;
		
		return count($this->autoIndexStore) - 1;
	}
	
	public function ResolveAuctionHouse($id)
	{
		switch ((int)$id)
		{
			case 1:
			case 2:
			case 3:
				return 1;
			case 4:
			case 5:
			case 6:
				return 2;
			case 7:
			default:
				return 3; // neutral
		}
	}
	
	private function GetHousesByFaction($faction)
	{
		switch ((int)$faction)
		{
			case 1: return '1,2,3';
			case 2: return '4,5,6';
			case 3: return '7';
		}
	}
}