{foreach from=$themes item=manifest key=id}
	{if $manifest.folderName == $current_theme}
		<script type="text/javascript">
			
			function checkForTheme()
			{
				if(typeof Theme != "undefined")
				{
					Theme.scroll({$id});
				}
				else
				{
					setTimeout(checkForTheme, 50);
				}
			}

			checkForTheme();
		</script>
	{/if}
{/foreach}

<div class="statistics" id="theme_list">
	<div id="theme_overflow">
		{foreach from=$themes item=manifest key=id}
			<img src="{$url}application/themes/{$manifest.folderName}/{$manifest.screenshot}" onClick="Theme.scroll({$id})"/>
		{/foreach}
		<div class="clear"></div>
	</div>
</div>

<section class="box big" id="theme_list_text">
	<h2><img src="{$url}application/themes/admin/images/icons/black16x16/ic_picture.png"/> قالب ها</h2>
	<ul>
		{foreach from=$themes item=manifest key=id}
			<li style="cursor:pointer;" onClick="Theme.scroll({$id})" id="theme_{$id}">
				<div class="activate_button">
					{if $manifest.folderName == $current_theme}
						 √
					{else}
						<a href="javascript:void(0)" onClick="Theme.select('{strtolower($manifest.folderName)}')" class="nice_button">فعال سازی قالب</a>
					{/if}
				</div>

				<img src="{$url}application/themes/{strtolower($manifest.folderName)}/images/{$manifest.favicon}" />
				<b>{$manifest.name}</b>
				by 
				<a target="_blank" href="{$manifest.website}">{$manifest.author}</a>
			</li>
		{/foreach}
	</ul>

	<span>
		<center><b>آیا قالب های بیشتری میخواهید ؟</b> برای دریافت تم به سایت <a href="http://www.yekta-core.ir/forum19/" target="_blank">یکتا کر</a> مراجعه کنید</center>
	</span>
</section>