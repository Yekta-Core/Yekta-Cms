<!DOCTYPE html>
<html>
	<head>
		<title>یکتا سی ام اس</title>
		<link rel="shortcut icon" type="image/png" href="static/images/favicon.png">
		<link rel="stylesheet" type="text/css" href="static/css/login.css">
		<!--[if lt IE 9]>
			<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	</head>

	<body>
		<section id="wrapper">
			<header>یکتا سی ام اس</header>
			<div class="info_bar">نسخه فعلی شما : <span class="tag"><?php echo Update::$currentVersion; ?></span></div>
			
			<section id="main">
				<form class="login" method="post" action="">
					<input type="password" name="password" placeholder="رمز آپدیت را وارد نمایید" />
					<input type="submit" value="ورود">

					<?php if(isset($wrongPassword) && $wrongPassword) { ?>
						<div class="error">
							رمز عبور اشتباه است
						</div>
					<?php } ?>

					<div class="info">
						رمز عبور به روز رسانی را می توان در فایل <b>update_password.php</b> واقع در پوشه <b>updates</b>  در بر داشت.
					</div>
				</form>
			</section>
		</section>
	</body>
</html>