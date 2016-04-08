<?php

class Register extends MX_Controller
{
    private $usernameError;
    private $emailError;

    public function __construct()
    {
        parent::__construct();

        // Make sure that we are not logged in yet
        $this->user->guestArea();

        requirePermission('view');

        $this->load->config('bridge');
        $this->load->config('activation');
        $this->load->config('config');

        $this->load->model('activation_model');

        $this->load->library('calendar');
        $this->load->library('locations');
        $this->load->library('form_validation');
        $this->load->library('captcha', $this->config->item('use_captcha'));

        $this->load->helper(array('form', 'url', 'email_helper'));
    }

    public function index()
    {
        clientLang('username_limit_length', 'register');
        clientLang('username_limit', 'register');
        clientLang('username_not_available', 'register');
        clientLang('email_not_available', 'register');
        clientLang('email_invalid', 'register');
        clientLang('password_short', 'register');
        clientLang('password_match', 'register');
        clientLang('err_phone_invalid', 'register');
        clientLang('err_phone_length', 'register');
        clientLang('err_secret_answer_length', 'register');

        $this->template->setTitle(lang('register', 'register'));

        // Load the form validations for if they tried to sneaky bypass our js system
        $this->form_validation->set_rules('register_username', 'username', 'trim|required|min_length[4]|max_length[14]|xss_clean|alpha_numeric');
        $this->form_validation->set_rules('register_email', 'email', 'trim|required|valid_email|xss_clean');
        $this->form_validation->set_rules('register_password', 'password', 'trim|required|min_length[6]|xss_clean');
        $this->form_validation->set_rules('register_password_confirm', 'password confirmation', 'trim|required|matches[register_password]|xss_clean');
        $this->form_validation->set_rules('register_tell', 'tell', 'trim|required|xss_clean|numeric');
        $this->form_validation->set_rules('register_birthdayday', 'birthday day', 'trim|required|xss_clean|numeric');
        $this->form_validation->set_rules('register_birthdaymonth', 'birthday month', 'trim|required|xss_clean|numeric');
        $this->form_validation->set_rules('register_birthdayyear', 'birthday year', 'trim|required|xss_clean|numeric');
        $this->form_validation->set_rules('register_location', 'location', 'trim|required|xss_clean|alpha_numeric');
        $this->form_validation->set_rules('register_secret_question', 'secret question', 'trim|required|xss_clean|alpha_numeric');
        $this->form_validation->set_rules('register_secret_answer', 'secret answer', 'trim|required|min_length[2]|max_length[50]|xss_clean|alpha_numeric');

        $this->form_validation->set_error_delimiters('<img src="' . pageURL . 'application/images/icons/exclamation.png" data-tip="', '" />');

        // Check if everything went correct
        if($this->form_validation->run() || !count($_POST) || strcasecmp($this->input->post('register_captcha'), $this->captcha->getValue())
        || !$this->email_check($this->input->post('register_email')) || !$this->username_check($this->input->post('register_username')))
        {
            $fields = array('username', 'email', 'password', 'password_confirm', 'tell', 'birthdayday',
                'birthdaymonth', 'birthdayyear', 'location', 'secret_question', 'secret_answer');

            $data = array(
                'days'                  => $this->calendar->getDays(),
                'months'                => $this->calendar->getMonths(),
                'years'                 => $this->calendar->getYears(),
                'countries'             => $this->locations->getCountries(),
                'expansions'            => $this->realms->getExpansions(),
                'secret_questions'      => $this->config->item('secret_questions'),

                'birthday'              => $this->config->item('birthday'),
                'tell_mobile'           => $this->config->item('tell_mobile'),
                'location'              => $this->config->item('location'),
                'secret_question'       => $this->config->item('secret_question'),
                'use_captcha'           => $this->config->item('use_captcha'),

                'username_error'        => $this->usernameError,
                'email_error'           => $this->emailError,
                'password_error'        => '',
                'password_confirm_error'=> '',
                'tell_error'            => '',
                'birthdayday_error'     => '',
                'birthdaymonth_error'   => '',
                'birthdayyear_error'    => '',
                'secret_question_error' => '',
                'secret_answer_error'   => '',
                'captcha_error'         => '',

                'url'                   => pageURL
            );

            if(!empty($_POST))
            {
                // Loop through fields and assign error or success image
                foreach($fields as $field)
                {
                    if(!empty($data[$field . '_error']))
                        continue;

                    $data[$field . '_error'] = strlen(form_error('register_' . $field)) ? form_error('register_' . $field) :
                        '<img src="' . pageURL . 'application/images/icons/accept.png" />';
                }

                if(strcasecmp($this->input->post('register_captcha'), $this->captcha->getValue()))
                    $data['captcha_error'] = '<img src="' . pageURL . 'application/images/icons/exclamation.png" />';
            }

            $page_content = $this->template->loadPage('register.tpl', $data);

            // Load the page
            $page_data = array(
                'headline' => lang('register', 'register'),
                'content'  => $page_content,
                'module'   => 'default',
            );

            $page = $this->template->loadPage('page.tpl', $page_data);

            $this->template->view($page, 'modules/register/css/main.css', 'modules/register/js/validate.js');
        }

        if($this->config->item('use_forum_bridge') && !file_exists('application/modules/register/plugins/' . $this->config->item('forum_bridge') . '.php'))
            show_error('The forum bridge <b>' . $this->config->item('forum_bridge') . '</b> does not exist in <b>application/modules/register/plugins/</b>');

        if($this->input->post('register_expansion') && !array_key_exists($this->input->post('register_expansion'), $this->realms->getExpansions()))
            die('Hey, don\'t modify the expansion value...');

        if(!$this->config->item('location'))
            $_POST['register_location'] = '';
        else
        {
            if(preg_match('%(\w+)-(\w+)%uiD', $this->input->post('register_location'), $matches))
            {
                if(($matches[1] = $this->locations->getCountry($matches[1], true)) === false)
                    die();

                if(($matches[2] = $this->locations->getState($matches[1], $matches[2])) === false)
                    die();

                $_POST['register_location'] = $matches[1] . '-' . $matches[2];
            }
            elseif(($_POST['register_location'] = $this->locations->getCountry($this->input->post('register_location'), true)) === false)
                die();
        }

        if(!$this->config->item('secret_question')) // force the value to empty string and secure the database when things can go wrong
            $_POST['register_secret_question'] = $_POST['register_secret_answer'] = '';
        elseif(!in_array($this->input->post('register_secret_question'), $this->config->item('secret_questions')))
            die();

        if(!$this->config->item('birthday')) // force the value to empty string and secure the database when things can go wrong
        {
            $_POST['register_birthdayday'] = $_POST['register_birthdaymonth'] = $_POST['register_birthdayyear'] = '';
            $_POST['register_birthday'] = 0; // set a default value to prevent conflicts, 1970-01-01
        }
        else
        {
            if(!$this->calendar->getDay($this->input->post('register_birthdayday')))
                die();

            if(!$this->calendar->getMonth($this->input->post('register_birthdaymonth')))
                die();

            if(!$this->calendar->getYear($this->input->post('register_birthdayyear')))
                die();

            // Convert the given year, month and day to unix timestamp. it will able us to format the birthday
            // in any type we want without using hard coded functions. also it's so reliable and secure
            $_POST['register_birthday'] = strtotime($this->input->post('register_birthdayyear') . '-' .
                $this->input->post('register_birthdaymonth') . '-' . $this->input->post('register_birthdayday'));

            if($_POST['register_birthday'] === false || $_POST['register_birthday'] < 0)
                $_POST['register_birthday'] = 0; // 1970-01-01
        }

        if($this->config->item('enable_email_activation'))
        {
            $key = $this->activation_model->add(
                $this->input->post('register_username'),
                $this->input->post('register_password'),
                $this->input->post('register_email'),
                $this->input->post('register_expansion'),
                $this->input->post('register_birthday'),
                $this->input->post('register_tell'),
                $this->input->post('register_location'),
                $this->input->post('register_secret_question'),
                $this->input->post('register_secret_answer')
            );

            $link = base_url() . 'register/activate/' . $key;

            sendMail($this->input->post('register_email'), $this->config->item('activation_sender_mail'), $this->config->item('server_name') . ': activate account',
                'You have created the account ' . $this->input->post('register_username') . ', please go here to activate it: <a href="' . $link . '">' . $link . '</a>');
        }
        else
        {
            // Register our user on external account database
            $this->external_account_model->createAccount(
                $this->input->post('register_username'),
                $this->input->post('register_password'),
                $this->input->post('register_email'),
                $this->input->post('register_expansion')
            );

            // Insert user data into account data, also login the user
            $this->user->setUserDetails($this->input->post('register_username'), $this->user->createHash(
                $this->input->post('register_username'), $this->input->post('register_password')));

            $this->db->where('id', $this->user->getId());
            $this->db->update('account_data', array(
                'birthday'        => $this->input->post('register_birthday'),
                'tell'            => $this->input->post('register_tell'),
                'location'        => $this->input->post('register_location'),
                'secret_question' => $this->input->post('register_secret_question'),
                'secret_answer'   => $this->input->post('register_secret_answer'),
            ));

            !$this->config->item('use_forum_bridge') || $this->plugins->{$this->config->item('forum_bridge')}->register(
                $this->input->post('register_username'), $this->input->post('register_password'), $this->input->post('register_email'));
        }

        // Prepare the values we want to use in the view
        $data = array(
            'account'          => $this->input->post('register_username'),
            'username'         => $this->input->post('register_username'),
            'email'            => $this->input->post('register_email'),
            'password'         => $this->input->post('register_password'),
            'tell'             => $this->input->post('register_tell'),
            'location'         => $this->input->post('register_location'),
            'birthdayday'      => $this->input->post('register_birthdayday'),
            'birthdaymonth'    => $this->input->post('register_birthdaymonth'),
            'birthdayyear'     => $this->input->post('register_birthdayyear'),
            'secret_question'  => $this->input->post('register_secret_question'),
            'secret_answer'    => $this->input->post('register_secret_answer'),
            'bridgeName'       => $this->config->item('forum_bridge'),
            'email_activation' => $this->config->item('enable_email_activation'),
            'url'              => pageURL,
        );

        // And at the end, show success message to user about its registration
        $this->template->view($this->template->box(lang($data['email_activation'] ? 'confirm_account' : 'created', 'register'),
            $this->template->loadPage('register_success.tpl', $data)
        ));
    }

    public function activate($key = false)
    {
        $key || $this->template->box(lang('invalid_key', 'register'), lang('invalid_key_long', 'register'), true);

        $account = $this->activation_model->getAccount($this->security->xss_clean($key));
        $account || $this->template->box(lang('invalid_key', 'register'), lang('invalid_key_long', 'register'), true);

        if($this->config->item('use_forum_bridge') && !file_exists('application/modules/register/plugins/' . $this->config->item('forum_bridge') . '.php'))
            show_error('The forum bridge <b>' . $this->config->item('forum_bridge') . '</b> does not exist in <b>application/modules/register/plugins/</b>');

        $this->activation_model->remove($account['id'], $account['username'], $account['email']);

        $this->external_account_model->createAccount($account['username'], $account['password'], $account['email'], $account['expansion'], true);

        // Insert user data into account data, also login the user
        $this->user->setUserDetails($account['username'], $account['password']);

        // Now edit user data and insert custom account data
        $this->db->where('id', $this->user->getId());
        $this->db->update('account_data', array(
            'tell'            => $account['tell'],
            'birthday'        => $account['birthday'],
            'location'        => $account['location'],
            'secret_question' => $account['secret_question'],
            'secret_answer'   => $account['secret_answer'],
        ));

        !$this->config->item('use_forum_bridge') || $this->plugins->{$this->config->item('forum_bridge')}->register(
            $account['username'], $account['password'], $account['email']);

        // Prepare the values we want use in the view
        $data = array(
            'account'          => $account['username'],
            'username'         => $account['username'],
            'email'            => $account['email'],
            'password'         => $account['password'],
            'bridgeName'       => $this->config->item('forum_bridge'),
            'email_activation' => false,
            'url'              => pageURL,
        );

        // And at the end, show success message to user about its registration
        $this->template->view($this->template->box(lang('created', 'register'),
            $this->template->loadPage('register_success.tpl', $data)
        ));
    }

    public function email_check($email = '')
    {
        if(!$this->external_account_model->emailExists($email))
        {
            $this->emailError = '';

            // The email does not exists so they can register
            return true;
        }

        $this->emailError = '<img src="' . pageURL . 'application/images/icons/exclamation.png" data-tip="This email is not available" />';
        return false;
    }

    public function username_check($username = '')
    {
        if(!$this->external_account_model->usernameExists($username))
        {
            $this->usernameError = '';

            // The user does not exists so they can register
            return true;
        }

        $this->usernameError = '<img src="' . pageURL . 'application/images/icons/exclamation.png" data-tip="This username is not available" />';
        return false;
    }
}