<?php class unban extends MX_Controller
{
  public function __construct()
  {
    parent::__construct();
    Modules::run('login/is_logged_in');
       $this->load->model('mymodel');
     $this->load->config('myconfig');
  }

  public function index()
  {

    // Prepare the values we want to use in the view
    $message="";
     
    $this->mymodel->indexfile($message);

  }

  
public function UnbanAccount() 


{

  if($this->input->post('unban'))
       {

if($this->getUnbanAccount())
$username =$this->user->getUsername();
$message = '<span dir="rtl" class="banacc">????? '.$username.'  ?????? ???? ???? ??</span></br>';


$this->mymodel->indexfile ($message);

}
}



 public function getUnbanAccount()


{





$cost=$this->config->item('costponistunban');
$id = $this->user->getId();


$this->connection = $this->external_account_model->getConnection();
 $this->connection->query("UPDATE account_banned SET active=0  WHERE id='$id' and active=1");

$query = $this->db->query("UPDATE account_data SET dp = dp -'$cost' WHERE id = '$id'");

return true;


  }



          
 }
