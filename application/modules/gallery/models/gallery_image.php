<?php

class Gallery_image extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function add($data) {
        $this->db->insert('gallery_images', array_merge($data, array(
            'created' => date('Y-m-d H:i:s'),
        )));
        return $this->db->insert_id();
    }

    function hit($id) {
        $this->db->where('id', $id);
        $this->db->set('hits', 'hits+1', false);
        $this->db->update('gallery_images');
    }

    function get($id) {
        $this->db->where('id', $id);
        $q = $this->db->get('gallery_images');
        return $q->row();
    }

    function delete ($id) {
        $this->db->delete('gallery_images', array('id' => $id));
    }

}
