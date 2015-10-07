{$head}
	<script type="text/javascript" src="{$url}application/themes/rtk/js/responsive-nav.js"></script>
	<meta name="viewport" content="width=device-width" />
	<link href="{$url}application/themes/rtk/css/responsive.css" type="text/css" rel="stylesheet" />
	<body>
		<section id="wrapper">
			{$modals}
			
			<div id="top-logo"></div>
			<ul id="top_menu">
				{foreach from=$menu_top item=menu_1}
					<li><a {$menu_1.link}>{$menu_1.name}</a></li>
				{/foreach}
			</ul>
			
			<section id="slider_bg" {if !$show_slider}style="display:none;"{/if}>
				<div id="slider">
					{foreach from=$slider item=image}
						<a href="{$image.link}"><img src="{$image.image}" title="{$image.text}"/></a>
					{/foreach}
				</div>
			</section>
			
			<div id="main">
			<nav class="clearfix" style="display: none;">
				<ul class="clearfix">
					{foreach from=$menu_side item=menu_2}
						<li>
							<a class="navtab" {$menu_2.link}>
							{$menu_2.name}
							</a>
						</li>  
					{/foreach}
				</ul>
				<a href="#" id="pull">منو خدمات سایت</a>
			</nav>

				<aside id="right">
					{$page}
					
					<div class="mainbox-footer">
						<img src="{$image_path}ice-sidebar3.png" style="position:absolute;" />
					</div>
				</aside>
				
				<aside id="left">
					<article>
						<img src="{$image_path}ice-sidebar2.png" style="position:absolute;" />
						<h1 class="top"><p class="sideboxname">Main Menu</p></h1>
						<ul id="left_menu">
							{foreach from=$menu_side item=menu_2}
								<li><a {$menu_2.link}><img src="{$image_path}bullet.png">{$menu_2.name}</a></li>
							{/foreach}
						</ul>
					</article>
					
					{foreach from=$sideboxes item=sidebox}
						<article>
							<h1 class="top"><p class="sideboxname">{$sidebox.name}</p></h1>
							<section class="body">
								{$sidebox.data}
							</section>
						</article>
					{/foreach}
					
					<div class="sidebox-footer">
						<img src="{$image_path}ice-sidebar.png" style="position:absolute;" />
					</div>
					
				</aside>
				
				<div class="clear"></div>
			</div>
			
			<center>
				<footer>
					<table cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td width="410px" style="padding:30px 0 0 15px;"> All rights reserved &reg; {$serverName} <br> This website and its content was created for {$serverName}.<br> Design by <a target="_blank" href="http://kjanko.com/">Kjanko</a>, Coded by Darksider, Powered by <a target="_blank" href="http://www.yekta-core.ir" title="">Yekta-Core</a> </td>
								<td valign="top" class="f_menu" width="550px">
									<a href="#">Home</a><span>|</span>
									<a href="#">Community</a><span>|</span>
									<a href="#">Support</a><span>|</span>
									<a href="#">team</a><span>|</span>
									<a href="#">Bug tracker</a>
								</td>
							</tr>
						</tbody>
					</table>
				</footer>
			</center>
			
		</section>
	</body>
</html>