<?php

class myModel extends CI_Model{


 public function insert()
 {
 
 $name = $this->user->getUsername();

 $text = htmlspecialchars($this->input->post('text'));

 $data = date("Y-m-d, H:i");

  if(empty($text)){

         	 echo "<script>alert('شما نمیتوانید پیام خالی بفرستید.')</script>";

     


 
         }else{

 
 $query = $this->db->query("INSERT INTO chatbox(payam,esme_user,tarikh) VALUES(N'$text','$name','$data')"); 


}

}

public function chat()
{

 $query = $this->db->query("SELECT payam,esme_user,tarikh FROM chatbox ORDER BY id DESC");

 if($query->num_rows())
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




?>