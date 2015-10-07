<?php

class Settings_model extends CI_Model
{
	public function saveSettings($values)
	{
		$this->db->update('account_data', $values, array('id' => $this->user->getId()));
	}


	public function UnLocked_Account()
	{
		$auth = $this->external_account_model->getConnection();
		$query = "UPDATE account SET locked = 0 WHERE id = ".$this->user->getId();
		$auth->query($query);
		return true;
	}

   

    public function mobileNumber($check) {
        	$pattern = '/^[- .\(\)]?((98)|(\+98)|(0098)|0){1}[- \
                .\(\)]{0,3}((91)|(93)){1}[0-9]{8}$/';
		return preg_match($pattern, $check);
	}


	public function check_code_melli($code_melli)
{


    if(!preg_match('/^[0-9]{10}$/',$code_melli))
        return false;
    

    for($i=0;$i<10;$i++)
        if(preg_match('/^'.$i.'{10}$/',$code_melli))
        return false;

    for($i=0,$sum=0;$i<9;$i++)
        $sum+=((10-$i)*intval(substr($code_melli, $i,1)));

    $ret=$sum%11;
    $parity=intval(substr($code_melli, 9,1));
if(($ret<2 && $ret==$parity) || ($ret>=2 && $ret==11-$parity))
        return true;
    return false;

}     


}