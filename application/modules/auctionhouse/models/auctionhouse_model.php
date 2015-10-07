<?php

class Auctionhouse_model extends CI_Model
{
	public $realm;
	private $connection;
	private $realmId;
	private $EmulatorSimpleString = '';
	
	const FACTION_ALL 		= 0;
	const FACTION_ALLIANCE 	= 1;
	const FACTION_HORDE		= 2;
	const FACTION_NEUTRAL 	= 3;
	
	private $AuctioneerFactions;
	
	public function __construct()
	{
		parent::__construct();
		// Load the config
		$this->load->config('auctionhouse/auctionhouse_config');
		// Override the variable
		$this->AuctioneerFactions = $this->config->item("auctioneer_entries");
	}
	/**
	 * Assign the realm object to the model
	 */
	public function setRealm($id)
	{
		$this->realmId = $id;
		$this->realm = $this->realms->getRealm($id);
		$this->EmulatorSimpleString = str_replace(array('_ra', '_soap', '_rbac'), '', $this->realm->getConfig('emulator'));
	}
	
	private function getEmulatorString()
	{
		return $this->EmulatorSimpleString;
	}
	
	/**
	 * Connect to the character database
	 */
	public function connect()
	{
		$this->realm->getCharacters()->connect();
		$this->connection = $this->realm->getCharacters()->getConnection();
	}
	
	public function SaveAuctioneerByFaction($guid, $entry)
	{
		$faction = isset($this->AuctioneerFactions[$entry]) ? $this->AuctioneerFactions[$entry] : false;
		
		if ($faction === false)
			return false;
			
		// Check if we have a list for this faction
		$List = $this->cache->get("auctionhouse/auctioneers_by_faction_" . ($this->realmId ? $this->realmId : 0) . "_" . $faction);
		
		if ($List !== false)
		{
			// Check if that GUID is already in the list
			$GUIDs = strstr($List, ',') ? explode(',', $List) : array((string)$List);
			
			if (!in_array((string)$guid, $GUIDs))
			{
				// Add the guid to the list
				$NewList = $List . ',' . $guid;
				
				// Save it forever
				$this->cache->save("auctionhouse/auctioneers_by_faction_" . ($this->realmId ? $this->realmId : 0) . "_" . $faction, $NewList);
				
				unset($NewList);
			}
			unset($GUIDs);
		}
		else
		{
			// Save it forever
			$this->cache->save("auctionhouse/auctioneers_by_faction_" . ($this->realmId ? $this->realmId : 0) . "_" . $faction, $guid);
		}
		unset($faction, $List);
		
		return true;
	}
	
	public function GetAuctioneersByFaction($faction)
	{
		// Check if we have a list for this faction
		$List = $this->cache->get("auctionhouse/auctioneers_by_faction_" . ($this->realmId ? $this->realmId : 0) . "_" . $faction);
		
		if ($List !== false)
		{
			return $List;
		}
		
		return false;
	}
	
	public function ResolveAuctioneerFaction($entry)
	{
		// Handle Mangos
		if ($this->EmulatorSimpleString == 'mangos')
		{
			$faction = (int)$entry;
		}
		else
		{
			$faction = isset($this->AuctioneerFactions[$entry]) ? $this->AuctioneerFactions[$entry] : false;
		}
		
		if (!$faction)
			return 'Unknown';
		
		switch ($faction)
		{
			case self::FACTION_ALLIANCE:	return '<span class="ah-faction-alliance">Alliance</span>';
			case self::FACTION_HORDE:		return '<span class="ah-faction-horde">Horde</span>';
			case self::FACTION_NEUTRAL:		return '<span class="ah-faction-neutral">Neutral</span>';
		}
		
		return 'Unknown';
	}
	
	public function ResolveFactionString($faction)
	{
		switch ($faction)
		{
			case self::FACTION_ALLIANCE:	return 'Alliance';
			case self::FACTION_HORDE:		return 'Horde';
			case self::FACTION_NEUTRAL:		return 'Neutral';
		}
		
		return 'Unknown';
	}
	
	public function ResolveAuctioneerFactionInt($entry)
	{
		return isset($this->AuctioneerFactions[$entry]) ? $this->AuctioneerFactions[$entry] : false;	
	}
	
	public function GetPossibleAuctioneerEntriesList()
	{
		$list = '';
		
		foreach ($this->AuctioneerFactions as $entry => $faction)
		{
			$list .= $entry . ',';
		}
		$list = rtrim($list, ',');
		
		return $list;
	}
}