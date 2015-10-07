<?php

class Skyfire_model extends CI_Model
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
		
		$where = 'WHERE `item_instance`.`itemEntry` > 0';
		
		// Check for special occasions
		if ($faction > 0 || $search !== false)
		{
			// Check if we're looking into specific faction
			if ($faction > 0)
			{
				// Get the auctioneer guids list
				$list = $this->GetAuctioneersByFaction($faction);
				
				// Add to the where clause
				$where .= ' AND `auctionhouse`.`auctioneerguid` IN(' . ($list ? $list : '0') . ')';
				
				unset($list);
			}
			
			// Check if we're looking into specific item name
			if ($search !== false)
			{
				// Get a list with possible item GUID's
				$list = $this->GetItemGUIDsLike($search);
				
				// Add to the where clause
				$where .= ' AND `auctionhouse`.`itemguid` IN(' . ($list ? $list : '0') . ')';
				
				unset($list);
			}
		}
		
		$query = $this->connection->query("	SELECT COUNT(*) AS num 
											FROM `auctionhouse` 
											LEFT JOIN `item_instance` ON `auctionhouse`.`itemguid` = `item_instance`.`guid` 
											".$where.";");
		
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
		
		$where = 'WHERE `item_instance`.`itemEntry` > 0';
		
		// Check for special occasions
		if ($faction > 0 || $search !== false)
		{
			// Check if we're looking into specific faction
			if ($faction > 0)
			{
				// Get the auctioneer guids list
				$list = $this->GetAuctioneersByFaction($faction);
				
				// Add to the where clause
				$where .= ' AND `auctionhouse`.`auctioneerguid` IN(' . ($list ? $list : '0') . ')';
				
				unset($list);
			}
			
			// Check if we're looking into specific item name
			if ($search !== false)
			{
				// Get a list with possible item GUID's
				$list = $this->GetItemGUIDsLike($search);
				
				// Add to the where clause
				$where .= ' AND `auctionhouse`.`itemguid` IN(' . ($list ? $list : '0') . ')';
				
				unset($list);
			}
		}
		
		// Prepare the sorting
		$SortString = $this->GetSorting($sort);
		
		$query = $this->connection->query("	SELECT 
												`auctionhouse`.`id`, 
												`auctionhouse`.`auctioneerguid`, 
												`auctionhouse`.`itemguid`, 
												`auctionhouse`.`itemowner`, 
												`auctionhouse`.`buyoutprice`, 
												`auctionhouse`.`time`, 
												`auctionhouse`.`buyguid`, 
												`auctionhouse`.`lastbid`, 
												`auctionhouse`.`startbid`, 
												`auctionhouse`.`deposit`, 
												`characters`.`name` AS owner, 
												`item_instance`.`itemEntry`, 
												`item_instance`.`count` AS stack 
											FROM `auctionhouse` 
											LEFT JOIN `characters` ON `auctionhouse`.`itemowner` = `characters`.`guid` 
											LEFT JOIN `item_instance` ON `auctionhouse`.`itemguid` = `item_instance`.`guid` 
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
			case self::AH_SORT_TIME_DESC:	return '`auctionhouse`.`time` DESC';
			case self::AH_SORT_TIME_ASC:	return '`auctionhouse`.`time` ASC';
			case self::AH_SORT_SELLER_DESC:	return '`auctionhouse`.`itemowner` DESC';
			case self::AH_SORT_SELLER_ASC:	return '`auctionhouse`.`itemowner` ASC';
			case self::AH_SORT_PRICE_DESC:	return '`auctionhouse`.`buyoutprice` DESC, `auctionhouse`.`startbid` DESC';
			case self::AH_SORT_PRICE_ASC:	return '`auctionhouse`.`buyoutprice` ASC, `auctionhouse`.`startbid` ASC';
		}
		
		return '`auctionhouse`.`id` DESC';
	}
	
	public function GetAuctioneerEntry($guid)
	{
		$this->WorldConnect();
		
		$query = $this->WorldConnection->query("SELECT `id` FROM `creature` WHERE `guid` = ? LIMIT 1;", $guid);
		
		if ($this->WorldConnection->_error_message())
		{
			die("function GetAuctioneerEntry() returned SQL error: " . $this->WorldConnection->_error_message());
		}
		
		if ($query && $query->num_rows() > 0)
		{
			$results = $query->result_array();
			
			return (int)$results[0]['id'];
		}
		
		return false;
	}
	
	private function GetAuctioneersByFaction($faction)
	{
		// Check if we have a list for this faction
		$List = $this->cache->get("auctionhouse/auctioneers_by_faction_" . ($this->realmId ? $this->realmId : 0) . "_" . $faction);
		
		if ($List !== false)
		{
			return $List;
		}
		
		return false;
	}
	
	private function GetItemGUIDsLike($search)
	{
		$this->connect();
		
		// Get the auto index
		$index = $this->GetAutoIndex($search);
		
		// Since we're running the same query twice, we have a little runtime cache
		if (isset($this->runtimeCache['ItemGUIDLists'][$index]))
		{
			return $this->runtimeCache['ItemGUIDLists'][$index];
		}
		
		// Start by getting possible item entries
		$Entries = $this->GetPossibleItemEntriesList($search);
		
		$query = $this->connection->query("	SELECT `item_instance`.`guid` 
											FROM `item_instance` 
											INNER JOIN `auctionhouse` ON `item_instance`.`guid` = `auctionhouse`.`itemguid` 
											WHERE `item_instance`.`itemEntry` IN(".$Entries.");");
		
		if ($this->connection->_error_message())
		{
			die("function GetItemGUIDsLike() returned SQL error: " . $this->connection->_error_message());
		}
		
		if ($query && $query->num_rows() > 0)
		{
			$result = $query->result_array();
			
			//temp list
			$list = '';
			
			//merge into single dementional array
			foreach ($result as $key => $item)
			{
				$list .= $item['guid'] . ',';
			}
			$list = rtrim($list, ',');
			
			unset($result, $key, $item);
			
			// Save to the runtime cache
			$this->runtimeCache['ItemGUIDLists'][$index] = $list;
			
			return $list;
		}
		
		return false;
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
	
	public function GetAllSpawnedAuctioneers($EntryList)
	{
		$this->WorldConnect();
	
		$query = $this->WorldConnection->query("SELECT `guid`, `id` AS entry FROM `creature` WHERE `id` IN(".$EntryList.");");
		
		if ($query && $query->num_rows() > 0)
		{
			return $query->result_array();
		}
		
		return array();
	}
}