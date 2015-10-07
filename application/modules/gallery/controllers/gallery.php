<?php

/**
 * @package Gallery
 * @version 1.0
 * @author Simion Agavriloaei
 * @link http://simionbaws.ro
 */

class Gallery extends MX_Controller {
    private $css;
    private $js;

    public function __construct() {

        parent::__construct();
        $this->load->config('gallery/comments_and_upload');
        $this->load->model('Gallery_image');
        $this->css = "modules/gallery/assets/css/gallery.css";
        $this->js = "modules/gallery/assets/js/gallery.js";
        $this->load->helper(array('form', 'url'));

    }

    public function delete($id) {
        if (!$this->user->isStaff()) {
            die;
        }
        $image = $this->Gallery_image->get($id);
        if (!isset($image->id)) {
            die;
        }
        $path = $this->config->item('server_upload_path');
        if (is_file($path.$image->file)) {
            unlink($path.$image->file);
        }
        $thumb = $path . $this->getThumb($image->file);
        if (is_file($thumb)) {
            unlink($thumb);
        }
        $this->Gallery_image->delete($id);
        die;
    }

    public function image ($id) {
        return $this->view($id);
    }

    public function index() {

        $co = $this->db->get('gallery_images');
        $total = $co->num_rows();

        $this->load->library('pagination');
        $cfg['base_url'] = $this->template->page_url."gallery?";
        $cfg['total_rows'] = $co->num_rows();
        $cfg['per_page'] = $this->config->item('images_per_page');
        $cfg['page_query_string'] = true;
        $cfg['query_string_segment'] = 'offset';

        $this->pagination->initialize($cfg);

        $this->db->order_by('created', 'desc');
        $this->db->offset((isset($_GET['offset']) ? $_GET['offset'] : 0));
        $this->db->limit($this->config->item('images_per_page'));

        $q = $this->db->get('gallery_images');

        $results = $q->result();
        $parsed_results = array();
        foreach ($results as $r) {
            $parsed_results[] = array(
                'id' => $r->id,
                'title' => $r->title,
                'file' => $r->file,
                'thumb' => $this->getThumb($r->file),
                'created' => $r->created,
            );
        }

        $page = $this->template->loadPage('index.tpl', array(
            'images' => $parsed_results,
            'upload_path' => $this->config->item('url_image_path'),
            "url" => $this->template->page_url,
            'fb_app_id' => $this->config->item('facebook_application_id'),
            'pages'=> $this->pagination->create_links()
        ));
        $this->template->setTitle('Gallery');
        $this->template->view($page, $this->css, $this->js);
    }

    public function upload() {
        Modules::run('login/is_logged_in');
        $page_data = array(
            "url" => $this->template->page_url,
        );
        $this->template->setTitle('Upload - Gallery');
        if (isset($_FILES['userfile'])) {
            $config['upload_path'] = $this->config->item('server_upload_path');
            $config['allowed_types'] = 'gif|jpg|png';
            $config['max_size'] = '100000';
            $config['max_width']  = '3024';
            $config['max_height']  = '2000';

            if (!is_dir($config['upload_path'])) {
                @mkdir($config['upload_path']);
            }

            $this->load->library('upload', $config);

            if ( ! $this->upload->do_upload()) {
                $page_data["upload_error"] = $this->upload->display_errors();
            } else {
                $data = $this->upload->data();
                $this->Gallery_image->add(array(
                    'file' => $data['file_name'],
                    'user_id' => $this->user->getId(),
                    'title' => $_POST['title']
                ));


                // generate thumb
                $config_t['image_library'] = 'gd2';
                $config_t['source_image'] = $data['full_path'];
                $config_t['create_thumb'] = true;
                $config_t['maintain_ratio'] = false;
                $config_t['width'] = 150;
                $config_t['height'] = 100;
                $this->load->library('image_lib', $config_t);
                $this->image_lib->resize();


                $page_data["success"] = true;
            }
        }
        $page = $this->template->loadPage('upload.tpl', $page_data);
        $this->template->view($page, $this->css);
    }

    public function getThumb($filename) {
        $ext = strrchr($filename, '.');
        $name = preg_replace("/\\.[^.\\s]{3,4}$/", "", $filename);
        return "{$name}_thumb{$ext}";
    }

    public function view ($id) {

        $imageObj = $this->Gallery_image->get($id);

        if (!isset($imageObj->id)) {
            header('HTTP/1.0 404 Not Found');
            die('<h2>Image not found</h2>');
        }
        // increment hits
        $this->Gallery_image->hit($id);

        $data = array(
            'image' => $imageObj,
            "url" => $this->template->page_url,
            'upload_path' => $this->config->item('url_image_path'),
            "staff" => $this->user->isStaff()
        );

        $profile_id = $data['image']->user_id;
        $data['nickname'] = $this->user->getNickname($profile_id);
        $data['avatar'] = $this->user->getAvatar($profile_id, 'small');
        $data['own_profile'] = ($profile_id == $this->user->getId()) ? false : true;

        $data['image']->title = strip_tags($data['image']->title);
        $data['image']->created = $this->timeAgo($data['image']->created);

        $page = $this->template->loadPage('view.tpl', $data);

        die($page);
    }

    private function timeAgo($time){

        if (!is_numeric($time)) {
            $time = strtotime($time);
        }

        $periods = array("second", "minute", "hour", "day", "week", "month", "year", "decade");
        $lengths = array("60","60","24","7","4.35","12","10");

        $now = time();

           $difference     = $now - $time;
           $tense         = "ago";

        for($j = 0; $difference >= $lengths[$j] && $j < count($lengths)-1; $j++) {
           $difference /= $lengths[$j];
        }

        $difference = round($difference);

        if($difference != 1) {
           $periods[$j].= "s";
        }

        return "$difference $periods[$j] ago ";
    }

}
