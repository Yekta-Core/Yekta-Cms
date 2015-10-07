<?php

/*
|--------------------------------------------------------------------------
| General settings
|--------------------------------------------------------------------------
*/

$config['donation_currency'] = ""; // Remember to change the currency ON jahanpay as well!
$config['donation_currency_sign'] = " تومان";

/*
|--------------------------------------------------------------------------
| JahanPay Donation (www.jahanpay.com)
|--------------------------------------------------------------------------
*/

$config['api'] = "gt25766g858";
$config['callback'] = "http://epic-wow.ir/donate/jahanpayreturnback";

$config['donate_jahanpay'] = array(
'use' => true, // true: Feal | false: Gheir Faeal
'postback_url' => "",
'email' => "",
'Mobile' => "",

'values' => array(

	// Format: PRICE => DP
	// Baray Mesal: 15000 => 15 Yani Har Coins 1000 toman va 15 coins 15 hezar toman
	// Hatman Be Toman Vared Shavad

	1000 => 1,
	2000 => 2,
	4000 => 4,
	6000 => 6,
	8000 => 8,
	//1000 => 1
),

);


/*
|--------------------------------------------------------------------------
| JahanPay Donation (www.jahanpay.com)
|--------------------------------------------------------------------------
*/







/*******************************************************************/
/******************* Create By Yekta-CMS ***************************/
/*******************************************************************/

//Dast Nazan Bache :d
$config['force_code_editor'] = true;