<?php

class Activation_model extends CI_Model
{
    public function add($username, $password, $email, $expansion, $birthday = 0, $tell = '', $location = '', $secretQuestion = '', $secretAnswer = '')
    {
        $data = array(
            'username'       => $username,
            'email'          => $email,
            'password'       => $this->user->createHash($username, $password),
            'expansion'      => $expansion,
            'ip'             => $this->input->ip_address(),
            'birthday'       => $birthday,
            'tell'           => $tell,
            'secretQuestion' => $secretQuestion,
            'secretAnswer'   => $secretAnswer,
            'key'            => sha1($username . $email . $password . time()),
            'timestamp'      => time(),
        );

        $this->db->insert("pending_accounts", $data);

        return $data['key'];
    }

    public function getAccount($key)
    {
        $query = $this->db->query('SELECT * FROM `pending_accounts` WHERE `key` = ?', array($key));

        if(!$query->num_rows())
            return false;

        return reset($query->result_array());
    }

    public function remove($id, $username, $email)
    {
        $this->db->query('DELETE FROM `pending_accounts` WHERE `id` = ? OR `username` = ? OR `email` = ?', array($id, $username, $email));
    }
}