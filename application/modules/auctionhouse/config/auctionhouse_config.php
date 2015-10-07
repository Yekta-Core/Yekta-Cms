<?php

/* 
*  Auctions per page limit
*/
$config['auctions_per_page'] = 15;

/*
*
*  Auctionhouse cache time
*
*  Use string only, keep the quotes around the text.
*  Examples: 
*   '5 minutes'
*   '1 day'
*   '1 hour 30 minutes' 
*
*/
$config['ah_cache_time'] = '1 minutes';

/*
* 
*  Known auctioneer entries and their factions
* 
*  The entries are used to scan the world database for spawned auctioneers
*  also to resolve auctioneer faction
*  
*  Eplonation: entry => faction
*  
*  Factions:
*   1 - Alliance
*   2 - Horde
*   3 - Neutral
* 
*/
$config['auctioneer_entries'] = array(
	8661 	=> 3,
	8669 	=> 1,
	8670 	=> 1,
	8671 	=> 1,
	8672 	=> 2,
	8673 	=> 2,
	8674 	=> 2,
	8719 	=> 1,
	8720 	=> 1,
	8721 	=> 2,
	8722 	=> 2,
	8723 	=> 1,
	8724 	=> 2,
	9856 	=> 2,
	9857 	=> 3,
	9858 	=> 3,
	9859 	=> 1,
	16627 	=> 2,
	16628 	=> 2,
	16629 	=> 2,
	16707 	=> 1,
	17627 	=> 2,
	17628 	=> 2,
	17629 	=> 2,
	18348 	=> 1,
	18349 	=> 1,
	18761 	=> 2,
	35594 	=> 1,
	35607 	=> 2,
	15659 	=> 1,
	15675 	=> 2,
	15676 	=> 2,
	15677 	=> 3,
	15678 	=> 1,
	15679 	=> 1,
	15681 	=> 3,
	15682 	=> 2,
	15683 	=> 2,
	15684 	=> 2,
	15686 	=> 2,
	43690 	=> 1,
	43841 	=> 1,
	43842 	=> 1,
	44787 	=> 2,
	44865 	=> 2,
	44866 	=> 2,
	44867 	=> 2,
	44868 	=> 2,
	45082 	=> 2,
	45659 	=> 2,
	46637 	=> 2,
	46638 	=> 2,
	46639 	=> 2,
	46640 	=> 2
);






/*******************************************************************/
/******************* DO NOT CHANGE BELOW ***************************/
/*******************************************************************/
$config['force_code_editor'] = true;