<?php class unban_char extends MX_Controller 
{
	private $characters;
	private $total;
	
	/*
		Define our tools
	*/
	private $tools = array(
		6 => "unban_price"
	);

	public function __construct()
	{
		parent::__construct();

		$this->user->userArea();
		
		$this->load->config('myconfig');


  $this->init(); 

  

		//Init the variables
		
	}

	/**
	 * Init every variable
	 */
	private function init()
	{
		$this->characters = $this->user->getCharacters($this->user->getId());

		foreach($this->characters as $realm_key => $realm)
		{
			if(is_array($realm['characters']))
			{
				foreach($realm['characters'] as $character_key => $character)
				{
					$this->characters[$realm_key]['characters'][$character_key]['avatar'] = $this->realms->formatAvatarPath($character);
				}
			}
		}

		$this->total = 0;

		foreach($this->characters as $realm)
		{
			if($realm['characters'])
			{
				$this->total += count($realm['characters']);
			}
		}
	}
	
	/**
	 * Load the page
	 */
	public function index()
	{
		requirePermission("view");
		
		clientLang("cant_afford", "teleport");
		clientLang("select", "teleport");
		clientLang("selected", "teleport");
		clientLang("dp", "teleport");
		clientLang("free", "teleport");
		
		//Set the title
		$this->template->setTitle("آزاد سازی هیرو");
			

			$realms = $this->realms->getRealms();
				
				//Get characters, guilds, items for each realm
				foreach($realms as $realm)
				{
					// Assign the realm ID
					$i = $realm->getId();
				}
		//Load the content
		$content_data = array(
			"characters" => $this->characters,
			"url" => $this->template->page_url,
			"total" => $this->total,
			"dp" => $this->user->getDp(),
			"config" => $this->config,
			"char_unban"=>$this->character_banned($i)
		);
		
		$page_content = $this->template->loadPage("character_tools.tpl", $content_data);	
		
		//Load the page
		$page_data = array(
			"module" => "default", 
				"headline" => " آزاد سازی هیرو", 
			"content" => $page_content
		);
		
		$page = $this->template->loadPage("page.tpl", $page_data);
		
		$this->template->view($page, "modules/unban_char/css/character_tools.css", "modules/unban_char/js/character_tools.js");
	}
	
	/**
	 * Submit method
	 */
	public function submit()
	{
		//Get the post variables
		$ToolId = $this->input->post('id'); 
		$characterGuid = $this->input->post('guid'); 
		$realmId = $this->input->post('realm'); 
		
		// Make sure the realm actually supports console commands
		if (!$this->realms->getRealm($realmId)->getEmulator()->hasConsole())
		{
			die("???? ????? ?? ???????? ??? ???");
		}
		
		if ($ToolId && $characterGuid && $realmId)
		{
			//Validate the tool id
			if (isset($this->tools[$ToolId]))
			{
				//The tool is valid
				$realmConnection = $this->realms->getRealm($realmId)->getCharacters();
				$realmConnection->connect();
				
				//Get the price
				$Price = $this->config->item($this->tools[$ToolId] . "_price");
				
				// Make sure the character exists
				if (!$realmConnection->characterExists($characterGuid))
				{
					die("???? ?????? ??? ???? ?????");
				}

				// Make sure the character belongs to this account
				if (!$realmConnection->characterBelongsToAccount($characterGuid, $this->user->getId()))
				{
					die("???? ?????? ??? ?? ????? ??? ???? ?????");
				}
				
				//Get the character name
				$CharacterName = $realmConnection->getNameByGuid($characterGuid);
				
				//Make sure we've got the name
				if (!$CharacterName)
				{
					die("The website was unable to resolve your character's name.");
				}
				
				//Check if the user can afford the service
				if ($this->user->getDp() >= $Price || $Price == 0)
				{
					//Get the command for this emulator
					$command = $this->GetCommand($ToolId, $realmId, $CharacterName);
					
					if (!$command)
					{
						die("???? ????? ?? ???????? ??? ??? ?? ?????? ???? ??????.");
					}
					
					//Execute the command
					$this->realms->getRealm($realmId)->getEmulator()->sendCommand($command);
					
					//Update Donation Points
					if ($Price > 0)
					{
						$this->user->setDp($this->user->getDp() - $Price);
					}
					
					//Successful
					die("1");
				}
				else 
				{
					die("?????? ???? ??? ???? ??? ????");
				}
			}
			else
			{
				die("??? ????? ?????? ??? ??????? ???.");
			}
		}
		else
		{
			die("????? ?? ????? ??????? ????? ???? ???? ?????? ??? ????.");
		}
	}
	
	private function GetCommand($ToolId, $realmId, $CharacterName)
	{
		//Start by switching the tool id
		switch ($this->tools[$ToolId])
		{
			
			case "unban_price": 	return $this->GetUnbanCommand($realmId, $CharacterName);
		}
		
		return false;
	}
	
	
	

	private function GetUnbanCommand($realmId, $CharacterName)
	{
		switch ($this->getEmulatorString($realmId))
		{
			case "trinity":
			case "trinity_cata":
			case "skyfire":
			case "arkcore":
			case "mangos":
			case "mangosr2":
				return ".unban character " . $CharacterName;
		}
		
		return false;
	}
	
	private function getEmulatorString($realmId)
	{
		return str_replace(array('_ra', '_soap', '_rbac'), '', $this->realms->getRealm($realmId)->getConfig('emulator'));
	}



	public function character_banned($realmId =1)
	{
		//Connect to the character database		
		$character_database = $this->realms->getRealm($realmId)->getCharacters();
		$character_database->connect();
	


		//Get the connection and run a query
		$query = $character_database->getConnection()->
		query("SELECT * FROM character_banned WHERE active=1");

		if($query->num_rows() > 0)
		{
		$row = $query->result_array();

			return $row;
		}
		else
		{
			return false;
		}
	  

	}

	
          
 }