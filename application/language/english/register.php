<?php

/**
 * Note to module developers:
 * 	Keeping a module specific language file like this
 *	in this external folder is not a good practise for
 *	portability - I do not advice you to do this for
 *	your own modules since they are non-default.
 *	Instead, simply put your language files in
 *	application/modules/yourModule/language/
 *	You do not need to change any code, the system
 *	will automatically look in that folder too.
 */

$lang['register'] = "Register";
$lang['username_limit_length'] = "Username must be between 4 and 32 characters long";
$lang['username_limit'] = "Username may only contain alphabetical and numerical characters";
$lang['username_not_available'] = "Username is not available";
$lang['email_invalid'] = "Email must be a valid email";
$lang['password_short'] = "Password must be longer than 6 characters";
$lang['password_match'] = "Passwords don't match";
$lang['email_not_available'] = "Email is not available";
$lang['confirm_account'] = "Please confirm your account creation";
$lang['created'] = "Your account has been created!";
$lang['invalid_key'] = "Invalid activation key";
$lang['invalid_key_long'] = "The provided activation key appears to be invalid!";
$lang['the_account'] = "The account";
$lang['has_been_created'] = "has been created. Please check your email to activate your account.";
$lang['creating_account_forum'] = "Creating account on the forum, please wait...";
$lang['has_been_created_redirecting'] = "has been created. You are being redirected to the";
$lang['user_panel'] = "User panel";
$lang['username'] = "Username";
$lang['email'] = "Email";
$lang['password'] = "Password";
$lang['confirm'] = "Confirm password";
$lang['expansion'] = "Expansion";
$lang['submit'] = "Create account!";

// Custom fields' strings
$lang['location'] = "Location (country/state)";
$lang['birthday'] = "Birthday";
$lang['secret_question'] = "Secret Question";
$lang['secret_answer'] = "Secret Answer";
$lang['tell_number'] = "Phone number";

$lang['msg_select_option'] = "Please select an option";
$lang['err_phone_invalid'] = "Entered phone number doesn't have a valid pattern";
$lang['err_phone_length'] = "Phone number must at least have 11 characters";
$lang['err_secret_answer_length'] = "Secret answer must at least have 2 characters long";

// Security questions strings
$lang['question_1'] = "In what city were you born?";
$lang['question_2'] = "In what year was your mother born?";
$lang['question_3'] = "In what year was your father born?";
$lang['question_4'] = "What is your pet’s name?";
$lang['question_5'] = "What was your first car?";
$lang['question_6'] = "What is your favorite?";
$lang['question_7'] = "What was your first WoW character name?";
$lang['question_8'] = "What was your best friend in high school?";
$lang['question_9'] = "What was the name of your first childhood friend?";
$lang['question_10'] = "What was the name of your elementary / primary school?";