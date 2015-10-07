<?php

class Ucp extends MX_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->user->userArea();

		$this->load->config('links');
      $this->load->config('smsconfig');
		

		$this->load->model("settings_model");
	}

	public function index()
	{
		requirePermission("view");
        

		$this->template->setTitle(lang("user_panel", "ucp"));

		$cache = $this->cache->get("profile_characters_".$this->user->getId());

		if($cache !== false)
		{
			$characters = $cache;
		}
		else
		{
			$characters_data = array(
				"characters" => $this->realms->getTotalCharacters(),
				"realms" => $this->realms->getRealms(),
				"url" => $this->template->page_url,
				"realmObj" => $this->realms
			);

			$characters = $this->template->loadPage("ucp_characters.tpl", $characters_data);

			$this->cache->save("profile_characters_".$this->user->getId(), $characters, 60*60);
		}

		$data = array(
			"username" => $this->user->getNickname(),
			"expansion" => $this->realms->getEmulator()->getExpansionName($this->external_account_model->getExpansion()),
			"vp" => $this->internal_user_model->getVp(),
			"dp" => $this->internal_user_model->getDp(),
			"url" => $this->template->page_url,
			"location" => $this->internal_user_model->getLocation(),
			"codemeli" => $this->internal_user_model->getcodemeli(),
			"groups" => $this->acl_model->getGroupsByUser($this->user->getId()),
			"register_date" => $this->user->getRegisterDate(),
			"status" => $this->user->getAccountStatus(),
			"characters" => $characters,
			"avatar" => $this->user->getAvatar($this->user->getId()),
			"id" => $this->user->getId(),

			    "config" => array(
				"vote" => $this->config->item('ucp_vote'),
				"donate" => $this->config->item('ucp_donate'),
				"store" => $this->config->item('ucp_store'),
				"settings" => $this->config->item('ucp_settings'),
				"expansion" => $this->config->item('ucp_expansion'),
				"teleport" => $this->config->item('ucp_teleport'),
				"admin" => $this->config->item('ucp_admin'),
				"gm" => $this->config->item('ucp_gm')
			)
		);


	if (!$this->settings_model->mobileNumber($this->internal_user_model->getLocation()))

 {


$message='';


$data = array(
            
             "message"=>$message,
             "statuscms"=>$this->config->item('send_sms_enable')
        );

$this->template->view($this->template->loadPage("page.tpl", array(
			"module" => "default", 
			"headline" => " امنیت اکانت", 
			"content" => $this->template->loadPage("mysetting.tpl",$data)
		)), "modules/ucp/css/ucp.css");

}


else
{
	$this->template->view($this->template->loadPage("page.tpl", array(
			"module" => "default", 
			"headline" => lang("user_panel", "ucp"), 
			"content" => $this->template->loadPage("ucpuser.tpl", $data)
		)), "modules/ucp/css/ucp.css");
}



		
	}

public function setMobile()



{

if($this->input->post('submit'))
       {



$values['location']=$this->input->post('mobile');
$values['codemeli']=$this->input->post('codemeli');



if (isset($values['codemeli']) And strlen($values['codemeli'])!=10)

{

$message='شماره ملی را صحیح وارد نمائید';
}
else
{

if (!$this->settings_model->check_code_melli($values['codemeli']))

 {


$message='شماره ملی معتبر نمی باشد';
 }
else
{

	if (isset($values['location']) And strlen($values['location'])!=11)

{

$message='شماره همراه را صحیح وارد نمائید';
}
else
{
if (!$this->settings_model->mobileNumber($values['location']))

 {


$message='شماره همراه معتبر نمی باشد';
 }


else
{
if ($this->config->item('send_sms_enable')==false)

{

    $this->settings_model->UnLocked_Account();
    $this->settings_model->saveSettings($values);
    header("location: ".$this->template->page_url."ucp");

}
else
{

$message='';

$values['smsregister']=rand(10000,90000);

$data = array(
            
             "message"=>$message,          
        );

$this->settings_model->saveSettings($values);

$this->template->view($this->template->loadPage("page.tpl", array(
			"module" => "default", 
			"headline" => "فعال سازی اکانت", 
			"content" => $this->template->loadPage("smssetting.tpl",$data)
		)), "modules/ucp/css/ucp.css");	




}

}

}
}	


}	


$data = array(
            
             "message"=>$message,
             "statussms"=>$this->config->item('send_sms_enable')
        );

$this->template->view($this->template->loadPage("page.tpl", array(
			"module" => "default", 
			"headline" => " امنیت اکانت", 
			"content" => $this->template->loadPage("mysetting.tpl",$data)
		)), "modules/ucp/css/ucp.css");


       }

}

public function setsmsMobile()



{
 
 if($this->input->post('submit'))
   {

      $values['smsregister']=$this->input->post('smsregister');
      
       if (empty($values['smsregister']))
          {


          	$message='لطفا کد فعال سازی اکانت را وارد نمائید';

                   $data = array(
            
                  "message"=>$message
                         );

                  $this->template->view($this->template->loadPage("page.tpl", array(
		          "module" => "default", 
			      "headline" => " امنیت اکانت", 
			      "content" => $this->template->loadPage("smssetting.tpl",$data)
		           )), "modules/ucp/css/ucp.css");
          }
        
else

{
       if ($this->internal_user_model->getsmsregister()!=$values['smsregister'] )

            {
            	$message='کد فعال سازی صحیح نمی باشد';

                   $data = array(
            
                  "message"=>$message
                         );

                  $this->template->view($this->template->loadPage("page.tpl", array(
		          "module" => "default", 
			     	"headline" => "فعال سازی اکانت", 
			      "content" => $this->template->loadPage("smssetting.tpl",$data)
		           )), "modules/ucp/css/ucp.css");
            } 
              else
                {
                    $values['smsregister']=0;
	              
	             	$this->settings_model->UnLocked_Account();
                    $this->settings_model->saveSettings($values);
                    header("location: ".$this->template->page_url."ucp");     
                }
}

     

    }


}	

}
