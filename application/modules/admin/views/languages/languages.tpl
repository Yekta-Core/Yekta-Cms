<section class="box big" id="main_link">
	<h2>
		<img src="{$url}application/themes/admin/images/icons/black16x16/ic_list.png"/>
		زبان های پشتیبانی شده(<div style="display:inline;" id="logs_count">{if !$languages}0{else}{count($languages)}{/if}</div>)
	</h2>

	<ul id="log_list">
	{if $languages}
		{foreach from=$languages item=language key=flag}
			<li>
				<div style="float:right">
					{if $language == $default}
						<div style="color:green">Default language</div>
					{elseif hasPermission("changeDefaultLanguage")}
						<a class="nice_button" href="javascript:void(0)" onClick="Languages.set('{$language}')">ثبت به عنوان پیشفرض</a>
					{/if}
				</div>

				<img src="{$url}application/images/flags/{$flag}.png" alt="{$flag}"> {ucfirst($language)}
			</li>
		{/foreach}
	{/if}
	</ul>

	
</section>