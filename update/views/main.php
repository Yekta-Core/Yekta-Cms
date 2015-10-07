<!DOCTYPE html>
<html>
	<head>
		<title>بروزرسانی یکتا</title>
		<link rel="shortcut icon" type="image/png" href="static/images/favicon.png">
		<link rel="stylesheet" type="text/css" href="static/css/main.css">
		<!--[if lt IE 9] >
			<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	</head>

	<body>
		<section id="wrapper">
			<header>یکتا سی ام اس</header>

			<div class="info_bar">
				<?php if(isset($tool)) { ?>
					<a href="?">بروزرسانی ها</a> &rarr;
					<span class="tag"><?php echo $tool->version; ?></span>
					<?php echo $tool->name; ?>
				<?php } elseif(isset($_GET['version']) && isset($_GET['action']) && $_GET['action'] == "import") { ?>
					<a href="?">بروزرسانی ها</a> &rarr;
					<span class="tag"><?php echo $_GET['version'] ?></span>
					تغییرات در پایگاه داده
				<?php } else { ?>
					نسخه فعلی شما :
					<span class="tag <?php echo (Update::compareVersions(Update::$currentVersion, Update::$latestVersion)) ? "good" : "" ?>">
						<?php echo Update::$currentVersion; ?>
					</span>
					و نسخه در دسترس :
					<span class="tag good">
						<?php echo Update::$latestVersion; ?>
					</span>
				<?php } ?>
			</div>
			
			<section id="main">
				<?php if(isset($tool)) : ?>
					<?php echo $tool->run(); ?>
					
				<?php elseif(isset($_GET['version']) && isset($_GET['action']) && $_GET['action'] == "install") : ?>
					
					<?php if ( ! isset($error_msg) or empty($error_msg)) : ?>
						تمامی بروزرسانی ها با موفقیت انجام شد <br /><br />
						<a href="../">رفتن به سایت</a>
					<?php else : ?>
						<b>خطا در هنگام نصب رخ داده است:</b><br />
						<?php echo $error_msg; ?>
					<?php endif; ?>
					
				<?php else : ?>
					<?php if ( ! Update::compareVersions(key(Update::$updates), Update::$latestVersion)) { ?>
						<a href="http://www.yekta-cms.ir/account/updates" class="button">برای دانلود ورژن<?php echo Update::$latestVersion; ?>کلیک کنید</a>
					<?php } ?>

					<?php if ( ! count(Update::$updates)) : ?>
						<div class="divider"></div>
						هیچ بسته به روز رسانی دانلود وجود ندارد
					<?php else : ?>
						<?php foreach(Update::$updates as $version => $contents) : ?>
							<div class="divider"></div>
							<article class="update <?php echo (!Update::compareVersions(Update::$currentVersion, $version)) ? "" : "old" ?>">
								<h1><span class="tag <?php echo (!Update::compareVersions(Update::$currentVersion, $version)) ? "good" : "" ?>"><?php echo $version; ?></span></h1>
								<?php if($contents['changelog']) { ?>
									<h2>چه تغییراتی ایجاد شده ؟</h2>
									<div class="changelog">
										<?php echo $contents['changelog']; ?>
									</div>
								<?php } ?>

								<h2>دستورات نصب و راه اندازی :</h2>

								<?php if($contents['instructions']) { ?>
									<div class="instructions">
										<b>دستورات خاص:</b> <?php echo $contents['instructions']; ?>
									</div>
								<?php } ?>
								
								<h3>نصب و راه اندازی خودکار (توصیه شده)</h3>
								<ol>
									<?php if (count($contents['sql']) or count($contents['sql'])) : ?>
										<li><a href="?action=install&version=<?php echo $version; ?>">برای نصب کلیک کنید</a></li>
									<?php endif; ?>

									<?php if(count($contents['tools'])) : ?>
										<?php foreach($contents['tools'] as $tool) : ?>
											<li><a href="?version=<?php echo $version; ?>&action=<?php echo $tool; ?>">برای استفاده از ابزار اینجا را کلیک کنید: <?php echo preg_replace("/_/", " ", $tool);?></a></li>
										<?php endforeach; ?>
										</ul>
									<?php endif; ?>
								</ol>
								
								<h3>نصب و راه اندازی دستی :</h3>
								<t8>اگر به هر دلیل، در نصب خودکار خطا رخ دهد، و یا اگر شما می خواهید تغییرات فایل در این بروز رسانی را پیگیری کنید ، شما می توانید از این دستورات برای نصب به روز رسانی دستی استفاده کنید.</t8>
								<ol>
									<?php if(count($contents['sql'])) : ?>
										<?php foreach($contents['sql'] as $sql) : ?>
											<li>ورود <b><?php echo $sql; ?></b> به دیتابیس شما</b>
										<?php endforeach; ?>
									<?php endif; ?>

									<?php if(count($contents['zip'])) : ?>
										<?php foreach($contents['zip'] as $zip) : ?>
											<li>Extract <b><?php echo $zip; ?></b> into your web folder where your FusionCMS website is located (usually www or htdocs) and override the existing files.</li>
										<?php endforeach; ?>
									<?php endif; ?>

									<?php if(count($contents['tools'])) : ?>
										<?php foreach($contents['tools'] as $tool) : ?>
											<li><a href="?version=<?php echo $version; ?>&action=<?php echo $tool; ?>">برای استفاده از ابزار اینجا را کلیک کنید: <?php echo preg_replace("/_/", " ", $tool);?></a></li>
										<?php endforeach; ?>
									<?php endif; ?>
								</ol>
							</article>
						<?php endforeach; ?>
					<?php endif; ?>
				<?php endif; ?>
			</section>
		</section>
	</body>
</html>