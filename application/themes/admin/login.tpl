<!DOCTYPE html> 
<html>
	<head>
		<title>Login Admin Panel</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
		
		<link rel="shortcut icon" href="{$url}application/themes/admin/images/favicon.png" />
		<link rel="stylesheet" href="{$url}application/themes/admin/css/login.css" type="text/css" />
		
		<script src="{if $cdn}//html5shiv.googlecode.com/svn/trunk/html5.js{else}{$url}application/js/html5shiv.js{/if}"></script>
		<script type="text/javascript" src="{if $cdn}https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js{else}{$url}application/js/jquery.min.js{/if}"></script>
		
		<script type="text/javascript">
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
			};
		</script>
		<script src="{$url}application/js/require.js" type="text/javascript" ></script>
		<script type="text/javascript">

			var scripts = [
				"{$url}application/js/jquery.placeholder.min.js",
				"{$url}application/js/jquery.transit.min.js",
				"{$url}application/themes/admin/js/login.js"
			];

			require(scripts, function()
			{
				$('input[placeholder], textarea[placeholder]').placeholder();
			});
		</script>
	</head>
	<body class="bg-cyan">
		<div class="body body-s">
		
			<form onSubmit="Login.send(this); return false" class="sky-form">
				<header>Admin Panel</header>
				
				<fieldset>					
					<section>
						<div class="row">
							<label class="label col col-4">Username</label>
							<div class="col col-8">
								<label class="input">
									<i class="icon-append icon-user"></i>
									<input placeholder="نام کاربری" {if $isOnline}disabled value="{$username}"{/if} id="username" type="text">
								</label>
							</div>
						</div>
					</section>
					
					<section>
						<div class="row">
							<label class="label col col-4">Password</label>
							<div class="col col-8">
								<label class="input">
									<i class="icon-append icon-lock"></i>
									<input placeholder="رمز عبور" {if $isOnline}disabled value="Password"{/if} id="password" type="password">
								</label>
								<div class="note"><a href="#">Forgot password?</a></div>
							</div>
						</div>
					</section>
					
					<section>
						<div class="row">
							<label class="label col col-4">Security Code</label>
							<div class="col col-8">
								<label class="input">
									<i class="icon-append icon-lock"></i>
									<input placeholder="کد امنیتی" id="security_code" type="password">
								</label>
							</div>
						</div>
					</section>
					
					<section>
						<div class="row">
							<div class="col col-4"></div>
							<div class="col col-8">
								<label class="checkbox"><input type="checkbox" name="checkbox-inline" checked><i></i>Keep me logged in</label>
							</div>
						</div>
					</section>
				</fieldset>
				<footer>
					<button type="submit" class="button">Log in</button>
				</footer>
			</form>
			
		</div>
	</body>
</html>