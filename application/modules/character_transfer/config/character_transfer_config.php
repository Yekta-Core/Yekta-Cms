<?php

/* 
*  Character Transfer Price
*/
$config['cta_price'] = 10;

/* 
*  Character Transfer Price Currency
*  Usage:
*   - 'dp'
*   - 'vp'
*/
$config['cta_price_currency'] = 'dp';

/* 
*  Maximum characters per account
*/
$config['cta_characters_limit'] = 5;

/*
*  Language strings
*/
$config['cta_language'] = array(

'TITLE'		  => 'انتقال هیرو به اکانت دیگر',
'DESCRIPTION'	  => 'با استفاده از این سرویس امکان هیرو به اکانت دیگر اماده شده است',

'KEYWORDS'	  => 'character,transfer,charactertransfer,account',
'REALM'		  => 'ریلم',
'CHARACTER'	  => 'هیرو',
'DEST_ACC'	  => 'اکانت مقصد',
'PLS_SELECT'	  => 'انتخاب هیرو',
'TRANSFER'	  => 'انتقال',
'DP'		  => 'امتیاز ویژه',
'VP'		  => 'VP',
'COST_EXPL'	  => ' هژینه انتقال <strong>[PRICE] [CURRENCY]</strong> می باشد',
'SELECT_CHAR'	  => 'لطفا نام هیرو را انتخاب نمائید',
'ENTER_DEST_ACC'  => 'لطفا اکانت مقصد را انتخاب نمائید',
'ERROR_REALM'	  => 'ریلم انتخاب شده معتبر نمی باشد',
'ERROR_CHARACTER' => ' هیرو انتخاب شده معتبر نمی باشد',
'ERROR_BELONGS'	  => 'شخصیت انتخاب شده به حساب شما تعلق ندارد.',
'ERROR_ONLINE'	  => ' هیرو انتخاب شده در سرور  بازی آنلاین میباشد لفطا هیرو را از محیط بازی خروج نمائید و دوباره سعی نمائید',

'ERROR_DEST_ACC'  => 'اکانت مقصد معتبر نمی باشد',
'ERROR_DEST_ME'	  => ' اکانت مبدا نمی تواند با اکانت مقصد یکسان باشد',

'ERROR_CHAR_LIMIT'=> ' حداکثر هیرو در اکانت مقصد  باید ([LIMIT]). باشد',

'ERROR_PRICE_DP'  => 'موجودی امتیاز ویژه شما کافی  نمی باشد',
'ERROR_PRICE_VP'  => 'You don\'t have enough Vote Points.',

'ERROR_WEB_FAIL'  => 'وب سایت موفق به انتقال هیرو نمی باشد. لطفا دوباره تلاش کنید',

'SUCCESS_MSG'	  => 'The character <strong>[CHARACTER]</strong> from realm <strong>[REALM_NAME]</strong> has been successfully transferred to account <strong>[ACCOUNT]</strong>.',

'LINK_GO_UCP'	  => 'برو به کنترل پنل ',

'BANNED_MSG'	=> 'اکانت شما مسدود می باشد'
);













/*******************************************************************/
/******************* DO NOT CHANGE BELOW ***************************/
/*******************************************************************/
$config['force_code_editor'] = true;