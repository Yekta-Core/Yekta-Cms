<!DOCTYPE html>
<html>
	<head>
		<title>{if $title}{$title}{/if}Yekta-CMS</title>

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 

		<link rel="shortcut icon" href="{$url}application/themes/admin/images/favicon.png" />
		<link rel="stylesheet" href="{$url}application/themes/admin/css/main.css" type="text/css" />
		{if $extra_css}<link rel="stylesheet" href="{$url}application/{$extra_css}" type="text/css" />{/if}

		<script src="{if $cdn}//html5shiv.googlecode.com/svn/trunk/html5.js{else}{$url}application/js/html5shiv.js{/if}"></script>
		<script type="text/javascript" src="{if $cdn}https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js{else}{$url}application/js/jquery.min.js{/if}"></script>

		<script type="text/javascript">
		
			if(!window.console)
			{
				var console = {
				
					log: function()
					{
						// Prevent stupid browsers from doing stupid things
					}
				};
			}

			function getCookie(c_name)
			{
				var i, x, y, ARRcookies = document.cookie.split(";");

				for(i = 0; i < ARRcookies.length;i++)
				{
					x = ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
					y = ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
					x = x.replace(/^\s+|\s+$/g,"");
					
					if(x == c_name)
					{
						return unescape(y);
					}
				}
			}

			var Config = {
				URL: "{$url}",
				CSRF: getCookie('csrf_cookie_name'),
				isACP: true,
				defaultLanguage: "{$defaultLanguage}",
				languages: [ {foreach from=$languages item=language}"{$language}",{/foreach} ]
			};
		</script>

		<script src="{$url}application/themes/admin/js/router.js" type="text/javascript"></script>
		<script src="{$url}application/js/require.js" type="text/javascript" ></script>
		
		<script type="text/javascript">

			var scripts = [
				"{$url}application/js/jquery.placeholder.min.js",
				"{$url}application/js/jquery.transit.min.js",
				"{$url}application/js/ui.js",
				"{$url}application/js/fusioneditor.js"
				{if $extra_js},"{$url}application/{$extra_js}"{/if}
			];

			require(scripts, function()
			{
				$(document).ready(function()
				{
					UI.initialize();

					{if $extra_css}
						Router.loadedCSS.push("{$extra_css}");
					{/if}

					{if $extra_js}
						Router.loadedJS.push("{$extra_js}");
					{/if}
				});
			});

		</script>

		<!--[if IE]>
			<style type="text/css">
			#main .right h2 img {
				position:relative;
			}
			</style>
		<![endif]-->

		<!--[if LTE IE 7]>
			<style type="text/css">
			#main .right .statistics span {
				width:320px;
			}
			</style>
		<![endif]-->
	</head>

	<body>
		<div id="popup_bg"></div>

		<!-- confirm box -->
		<div id="confirm" class="popup">
			<h1 class="popup_question" id="confirm_question"></h1>

			<div class="popup_links">
				<a href="javascript:void(0)" class="popup_button" id="confirm_button"></a>
				<a href="javascript:void(0)" class="popup_hide" id="confirm_hide" onClick="UI.hidePopup()">
					انصراف
				</a>
				<div style="clear:both;"></div>
			</div>
		</div>

		<!-- alert box -->
		<div id="alert" class="popup">
			<h1 class="popup_message" id="alert_message"></h1>

			<div class="popup_links">
				<a href="javascript:void(0)" class="popup_button" id="alert_button">تایید</a>
				<div style="clear:both;"></div>
			</div>
		</div>

		<!-- Top bar -->
		<header>
			<div class="center_1020">
				<a href="http://www.yekta-cms.ir" class="logo"></a>

				<!-- Top menu -->
				<aside class="right">
					<nav>
						<a href="{$url}ucp" data-hasevent="1">
						وبسایت
							
						</a>

						{if hasPermission("editSystemSettings", "admin")}
							<a href="{$url}admin/settings" {if $current_page == "admin/settings"}class="active"{/if}>
							تنظیمات
								
							</a>
						{/if}

						<a href="{$url}admin/" {if $current_page == "admin/"}class="active"{/if}>
						پنل مدیریت
							
						</a>
					</nav>

					<div class="welcome" dir="rtl" align="right">
						خوش آمدید ، <b>{$nickname}</b>
					</div>
				</aside>
			</div>
		</header>

		<!-- Main content -->
		<section id="wrapper">
			<div id="top_spacer"></div>
			<div class="center_1020" id="main">

				<!-- Main Left column -->
				<aside class="left">
					<nav>
						{foreach from=$menu item=group key=text}
							{if count($group.links)}
								<a><div class="icon {$group.icon}"></div> {$text}</a>

								<section class="sub">
									{foreach from=$group.links item=link}
										<a href="{$url}{$link.module}/{$link.controller}" {if isset($link.active)}class="active"{/if}><div class="icon {$link.icon}"></div> {$link.text}</a>
									{/foreach}
								</section>
							{/if}
						{/foreach}
					</nav>

					<article>
						<h1>به یکتا سی ام اس خوش آمدید</h1>
						<b dir="rtl" align="right"><p style="text-align: right;"><span id="custom_field"><span id="custom_field" dir="rtl">توسعه دهنده عزیز  ما خوشحالیم که شما این سی ام اس را برای سایتتون انتخاب کردید . لطفا کپی رایت را حذف نکنید تا به سازنده امکان ارائه نسخه های بعدی را هم به صورت رایگان بدهید.تنها ارائه کننده این سرویس یکتا کر میباشد<br dir="rtl" /><br dir="rtl" />برای اطلاع از آپدیت ها به سایت <a dir="rtl" href="http://www.yekta-cms.ir" target="_blank">یکتا سی ام اس</a> مراجعه کنید<br dir="rtl" /> <br dir="rtl" />برای دریافت قالب ها ، ماژول ها و سوالات و مشکلات به <a dir="rtl" href="http://www.yekta-core.ir" target="_blank">یکتا کر</a> مراجعه کنید


</span></span></p></b>
						<div class="clear"></div>
					</article>
					<div class="spacer"></div>
				</aside>

				<!-- Main right column -->
				<aside class="right">
					{$page}
				</aside>

				<div class="clear"></div>
			</div>
		</section>

		<!-- Footer -->
		<footer>
			<div class="center_1020">
				<div class="divider2"></div>
				<aside id="logo"><a href="http://www.yekta-cms.ir" class="logo"></a></aside>
				<div class="divider"></div>
				<aside id="links">
					<a href="http://www.yekta-core.ir/" target="_blank">یکتا کر</a>
					<a href="http://www.yekta-core.ir/" target="_blank">پشتیبانی</a>
					<a href="http://www.yekta-core.ir/forum20/" target="_blank">ماژول ها</a>
					<a href="http://www.yekta-core.ir/forum19/" target="_blank">تم ها</a>
				</aside>
				<div class="divider"></div>
				<aside id="twitter">
					<h1>انجمن پشتیبانی</h1>
					<div id="twitter_icon"></div>
					<a href="http://www.yekta-core.ir" target="_blank">یکتا کر</a>
				</aside>
				<div class="divider"></div>
				<aside id="html5">
					<a href="http://www.w3.org/html/logo/" data-tip="این وب سایت با استفاده از نسل بعدی فن آوری های وب ساخته شده است">
						<img src="{$url}application/themes/admin/images/html5.png">
					</a>
				</aside>
				<div class="divider"></div>
				<div class="clear"></div>
			</div>
		</footer>
	</body>
</html>