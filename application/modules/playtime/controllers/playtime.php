<?php
class playtime extends MX_Controller 
{
	private $characters;
	private $total;
	
	/*
		Define our tools
	*/
	private $tools = array(
		1 => "convert_time",
		
	);

	public function __construct()
	{
		parent::__construct();

		$this->user->userArea();
		
		$this->load->config('character_convert');

		//Init the variables
		$this->init();
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
	//	$this->template->setTitle("Convert Times DP");
			
		//Load the content
		$content_data = array(
			"characters" => $this->characters,
			"url" => $this->template->page_url,
			"total" => $this->total,
			"dp" => $this->user->getDp(),
			"config" => $this->config
		);
		
		$page_content = $this->template->loadPage("playtime.tpl", $content_data);	
                            
                  $PriceCurrency = $this->config->item('cta_price_currency');
		
                         if ($PriceCurrency == 'dp')
	                           	{
			          
			 	                   $headline ="تبدیل زمان بازیکن به امتیاز ویژه";
		                      	}
		                    	elseif ($PriceCurrency == 'vp')
		                      	{
				                   $headline ="تبدیل زمان بازیکن به امتیاز رایگان"  ;  
		                     	} 
		                     	elseif ($PriceCurrency == 'op')
		                      	{
				                   $headline ="تبدیل زمان بازیکن به امتیاز آنلاین"  ;  
		                     	} 
       
       $this->template->setTitle($headline);        
		//Load the page
		$page_data = array(
			"module" => "default", 
			"headline" => $headline, 
			"content" => $page_content
		);
		
		$page = $this->template->loadPage("page.tpl", $page_data);
		
		$this->template->view($page, "modules/playtime/css/playtime.css", "modules/playtime/js/playtime.js");
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
			die("ریلم این سرویس را پشتیبانی نمیکند");
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
				$convert_Price = $this->config->item("convert_reward_amount");
				$PriceCurrency = $this->config->item('cta_price_currency');

			//	$Price = $this->config->item($this->tools[$ToolId] . "_price");
				// Make sure the character exists
				if (!$realmConnection->characterExists($characterGuid))
				{
					die("هیرو انتخاب شده وجود ندارد");
				}

				// Make sure the character belongs to this account
				if (!$realmConnection->characterBelongsToAccount($characterGuid, $this->user->getId()))
				{
					die("شخصیت انتخاب شده به حساب شما تعلق ندارد");
				}
				
				//Get the character name
				$CharacterName = $realmConnection->getNameByGuid($characterGuid);
				
				//Make sure we've got the name
				if (!$CharacterName)
				{
					die("این سایت قادر به نمایش نام هیرو شما نیست");
				}
				
			
					
					if ($this->checktotaltime($CharacterName,$realmId))
                     
                     {
                     	   if ($PriceCurrency == 'dp')
	                           	{
			          
			 	                   $this->user->setDp($this->user->getDp() + $convert_Price);
		                      	}
		                    	else if ($PriceCurrency == 'vp')
		                      	{
				                    $this->user->setVP($this->user->getVp() + $convert_Price);     
		                     	} 
                                elseif ($PriceCurrency == 'op')
	                           	{
			          
			 	                   $this->user->setOp($this->user->getOp() + $convert_Price);
		                      	}
                 

					//Successful
					die("1");
                     }
                     else

                     {
                              die("زمان بازی برای این هیرو کافی نمی باشد");

                     }
				
			}
			else
			{
				die("سرویس انتخاب شده غیر فعال است");
			}
		}
		else
		{
			die("خطایی رخ داده ، لطفا دوباره سعی کنید");
		}
	}


	public function checktotaltime ($name,$realmid)

	{

			$character_database = $this->realms->getRealm($realmid)->getCharacters();
	    	$character_database->connect();
			$query = $character_database->getConnection()->query("SELECT * FROM characters WHERE name = '$name'");  

                 if($query->num_rows() > 0)
		                {
	                    	$row = $query->result_array();

				           	if($row[0]["totaltime"] >= $this->config->item('convert_min_time'))
			            		{

						  if ($this->changetotoaltime($name,$realmid,$this->config->item('convert_min_time')))
					     	return true;
				    	       }
				        	else
				        	{
					          	return false;
				           	}	

	                	}
	            	else
	                 	{
		                	return false;
	                 	}                 
	} 


		public function changetotoaltime ($name,$realmid)

	{
		$convert=$this->config->item('convert_min_time');

			$character_database = $this->realms->getRealm($realmid)->getCharacters();
	    	$character_database->connect();
			  $character_database->getConnection()->query("UPDATE characters SET totaltime = totaltime - '$convert' WHERE name = '$name' and online=0");
 
		return true;
				                  
	} 
}



                            