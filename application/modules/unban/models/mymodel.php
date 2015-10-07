<?php


class myModel extends CI_Model
{

public function __construct()
	{
		parent::__construct();
   $this->load->config('myconfig');
		
		
	}



 public function GetUsername()
 {
 
 $name = $this->user->getUsername();
 return $name;

}





public function getBanAccount()
{
$id=$this->user->getId();

  $this->connection = $this->external_account_model->getConnection();
$query = $this->connection->query("SELECT * FROM account_banned where id='$id' and active=1");
	
	if($query->num_rows())
		{
			return true;
		}
		else
		{
			return false;
		}

}


public function indexfile($message)


{

if (!isset($message))

{

$message="";

}


$data = array(

      "ban"=> $this->mymodel->getBanAccount(),
     
       "message"=>$message,
       "dp" => $this->internal_user_model->getDp(),
       "cost"=>$this->config->item('costponistunban'),
      
       "infovip" => $this->mymodel->getunban()
      
      
    );



    // Load the view and pass the data
    $content = $this->template->loadPage("myModule.tpl", $data);

    // Put the view in a nice content box with a headline
    $box = $this->template->box(" وضعیت اکانت", $content);

    // Output the view
    $this->template->view($box,"modules/unban/css/style.css","modules/unban/js/from.js");


}








public function getunban()
{

$id = $this->user->getId();

  $this->connection = $this->external_account_model->getConnection();
$query = $this->connection->query("SELECT * FROM account_banned where id='$id' and active=1");
  
 if($query->num_rows())
    {
      $row = $query->result_array();
      
      return $row;
    }
    else
    {
      return 0;
    }


 

}



}




?>