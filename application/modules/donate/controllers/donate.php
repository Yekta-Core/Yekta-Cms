<?php
$active_group = "API";
$active_record = TRUE;
// error_reporting(E_ALL);
class Donate extends MX_Controller {
				private $fields = array();
				function __construct()
				{
								// Call the constructor of MX_Controller
								parent::__construct();
								// Make sure that we are logged in
								$this->user->userArea();

								$this->load->config('donate');
				}

				public function index()
				{
								requirePermission("view");

								$this->template->setTitle(lang("donate_title", "donate"));

								$donate_jahanpay = $this->config->item('donate_jahanpay');
								
								$user_id = $this->user->getId();
								$data = array(
												"donate_jahanpay" => $donate_jahanpay,
												"user_id" => $user_id,
												"server_name" => $this->config->item('server_name'),
												"currency" => $this->config->item('donation_currency'),
												"currency_sign" => $this->config->item('donation_currency_sign'),
												"multiplier" => $this->config->item('donation_multiplier'),
												"multiplier_paygol" => $this->config->item('donation_multiplier_paygol'),
												"url" => pageURL
												);

								$output = $this->template->loadPage("donate.tpl", $data);

								$this->template->box("<span style='cursor:pointer;' onClick='window.location=\"" . $this->template->page_url . "ucp\"'>" . lang("ucp") . "</span> &larr; " . lang("donate_panel", "donate"), $output, true, "modules/donate/css/donate.css", "modules/donate/js/donate.js");
				if ($this->config->item('api')=='')

  
  if (!isset ($api))
  {

    $api='';
  }





  if (!empty($api))
{
    
    $data = array(
            
             "api"=>$api
          
        );
				}
				
				
				if ($this->config->item('callback')=='')

  
  if (!isset ($callback))
  {

    $callback='';
  }





  if (!empty($callback))
{
    
    $data = array(
            
             "callback"=>$callback
          
        );
				}
}
        public function jahanpay()
        {
            $this->session->unset_userdata('Amount');
            $Amount = $this->input->post("amount");
            $this->session->set_userdata('Amount', $Amount);
            $Description = $this->input->post("item_name");
			$api=$this->config->item('api');
			$callback=$this->config->item('callback');
            $Client = new SoapClient("http://www.jahanpay.com/webservice?wsdl");
            $Result = $Client->requestpayment($api, $Amount, $callback, 7, $Description);

            header("Location: http://www.jahanpay.com/pay_invoice/$Result");
        }
                
				public function jahanpayreturnback()
				{
								$Amount = $this->session->userdata('Amount');
								$donate_jahanpay = $this->config->item('donate_jahanpay');
								$Authority = $_GET["au"];
								$api=$this->config->item('api');
								$this->session->unset_userdata('Amount');
								if (strlen($Authority) > 4) {
												$Client = new SoapClient("http://www.jahanpay.com/webservice?wsdl");
												$Result = $Client->verification($api, $Amount,$Authority);
												if ($Result == 1) {
																$this->fields['message_id'] = $Authority;
																$this->fields['custom'] = $user_id = $this->user->getId();
																$this->fields['points'] = $this->getDpAmount($Amount);
																$this->fields['timestamp'] = time();
																$this->fields['converted_price'] = $Amount;
																$this->fields['currency'] = $this->config->item('donation_currency_sign');
																$this->fields['price'] = $Amount;
																$this->fields['country'] = 'SE';
																$this->db->query("UPDATE `account_data` SET `dp` = `dp` + ? WHERE `id` = ?", array($this->fields['points'], $this->fields['custom']));
																$this->updateMonthlyIncome($Amount);
																$this->db->insert("paygol_logs", $this->fields);
																redirect($this->template->page_url . "ucp");
																
												} else {
																echo 'خطای شماره : ' . $Result;
																exit;
												}
								} else {
												echo 'تراکنش بوسیله کاربر انصراف داده شد';
												exit;
								}
				}

				private function getDpAmount($Amount)
				{
								$config = $this->config->item('donate_jahanpay');

								$points = $config['values'];
								return $points[$Amount];
				}

				private function updateMonthlyIncome($price)
				{
								$query = $this->db->query("SELECT COUNT(*) AS `total` FROM monthly_income WHERE month=?", array(date("Y-m")));

								$row = $query->result_array();

								if ($row[0]['total']) {
												$this->db->query("UPDATE monthly_income SET amount = amount + " . round($price) . " WHERE month=?", array(date("Y-m")));
								}else {
												$this->db->query("INSERT INTO monthly_income(month, amount) VALUES(?, ?)", array(date("Y-m"), round($price)));
								}
				}
}