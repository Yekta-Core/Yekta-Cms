{if $graph}
<div class="statistics">
	<span>بازدید های منحصر بفرد</span>
	<div class="image">
		<img src="https://chart.googleapis.com/chart?chf=bg,s,FFFFFF&chxl=0:|{$graph.first_date}|{$graph.last_date}&chxp=0,12,87&chxr=1,0,{$graph.top+20}&chxs=1,676767,11.5,0,lt,676767&chxt=x,y&chs=667x190&cht=lc&chco=095a9d&chds=0,{$graph.top+20}&chd=t:{$graph.stack}&chdlp=l&chls=2&chma=5,5,5,5" />
	</div>
</div>
{/if}

{if $pendingUpdate}
	<section id="content" style="border-top:none;">
		<section class="box big shouldHaveAlert">
		<h1>آپدیت جدید موجود است</h1>
		<span style="text-align:center;padding:15px;">
		بروزرسانی جدید نسخه <b>{$pendingUpdate}</b> در دسترس است 
			<a class="nice_button" href="{$url}update" data-hasevent="1">برو به نصب به روز رسانی</a>
		</span>
		</section>
	</section>
{/if}

<div class="info_box">
	<aside>
		<h2><img src="{$url}application/themes/admin/images/icons/black16x16/ic_pin.png"/> وبسایت</h2>
		<table>
			<tr>
			
				<td  align="right">{$unique.today}</td>
				<td  align="right">آخرین بازدید منحصر به فرد امروز</td>
			</tr>
			<tr>
				
				<td>{$unique.month}</td>
				<td>آخرین بازدید منحصر به فرد این ماه</td>
			</tr>
			<tr>
				
				<td>{$views.today}</td>
				<td>بازدید های صفحه امروز</td>
			</tr>
			<tr>
				
				<td>{$views.month}</td>
				<td>بازدید های صفحه این ماه</td>
			</tr>
		</table>
	</aside>
	<aside>
		<h2><img src="{$url}application/themes/admin/images/icons/black16x16/ic_graph.png"/> فروشگاه</h2>
		<table>
			<tr>
				
				<td>$ {$income.this}</td>
				<td>درآمد این ماه</td>
			</tr>
			<tr>
				
				<td>$ {$income.last}</td>
				<td>درآمد ماه گذشته</td>
			</tr>
			<tr>
				
				<td>{$votes.this}</td>
				<td>رای این ماه</td>
			</tr>
			<tr>
				
				<td>{$votes.last}</td>
				<td>رأی ماه گذشته</td>
			</tr>
		</table>
	</aside>
	<aside>
		<h2><img src="{$url}application/themes/admin/images/icons/black16x16/ic_users.png"/> کاربران</h2>
		<table>
			<tr>
				
				<td>{$signups.today}</td>
				<td>ثبت نام کنندگان امروز</td>
			</tr>
			<tr>
				
				<td>{$signups.this}</td>
				<td>ثبت نام کنندگان این ماه</td>
			</tr>
			<tr>
				
				<td>{$signups.last}</td>
				<td>ثبت نام کنندگان ماه گذشته</td>
			</tr>
			<tr>
				
				<td>{$signups.total}</td>
				<td>مجموع اکانت ها</td>
			</tr>
		</table>
	</aside>
	<div class="clear"></div>
</div>

<aside class="side_left">
	<section class="box">
		<h2><img src="{$url}application/themes/admin/images/icons/black16x16/ic_grid.png"/> ماژول های نصب شده (<div style="display:inline;" id="enabled_count">{count($enabled_modules)}</div>)</h2>
		<ul id="enabled_modules">
			{foreach from=$enabled_modules item=module key=key}
				<li>
					{if hasPermission("toggleModules")}
						{if $module.enabled}<a href="javascript:void(0)" onClick="Admin.disableModule('{$key}', this);" class="button">غیر فعال</a>{else}<a href="javascript:void(0)" onClick="Admin.enableModule('{$key}', this);" class="button">فعال</a>{/if}
					{/if}
					{if $module.has_configs && hasPermission("editModuleConfigs")}<a href="{$url}admin/edit/{$key}" class="button">ویرایش تنظیمات</a>{/if}
					<span style="display:inline !important;padding:0px !important;" data-tip="{$module.description}"><b>{ucfirst($module.name)}</b> by <a href="{$module.author.website}" target="_blank">{$module.author.name}</a></span>
				</li>
			{/foreach}
		</ul>
	</section>

	<section class="box">
		<h2><img src="{$url}application/themes/admin/images/icons/black16x16/ic_grid.png"/> ماژول های غیر فعال (<div style="display:inline;" id="disabled_count">{count($disabled_modules)}</div>)</h2>
		<ul id="disabled_modules">
			{foreach from=$disabled_modules item=module key=key}
				<li>
					{if hasPermission("toggleModules")}
						{if $module.enabled}<a href="javascript:void(0)" onClick="Admin.disableModule('{$key}', this);" class="button">غیر فعال</a>{else}<a href="javascript:void(0)" onClick="Admin.enableModule('{$key}', this);" class="button">فعال</a>{/if}
					{/if}
					{if $module.has_configs && hasPermission("editModuleConfigs")}<a href="{$url}admin/edit/{$key}" class="button">ویرایش تنظیمات</a>{/if}
					<span style="display:inline !important;padding:0px !important;" data-tip="{$module.description}"><b>{ucfirst($module.name)}</b> by <a href="{$module.author.website}" target="_blank">{$module.author.name}</a></span>
				</li>
			{/foreach}
		</ul>
	</section>
</aside>

<aside class="side_right">
	<section class="box" id="system_box">
		<h2><img src="{$url}application/themes/admin/images/icons/black16x16/ic_settings.png"/> اطلاعات سیستم</h2>
		
		<table width="90%" align="center" style="margin-top:5px;margin-bottom:5px;">
			<tr>
				
				<td style="text-align:left;">{$php_version}</td>
				<td style="text-align:right;">PHP ورژن</td>
			</tr>
			<tr>
				
				<td style="text-align:left;">{$version}</td>
				<td style="text-align:right;">CMS ورژن</td>
			</tr>
		</table>
		<div id="update" style="display:none;">
			<div class="divider"></div>
			<a href="http://www.yekta-cms.ir" class="button">به روز رسانی در دسترس است</a>
		</div>
	</section>

	<section class="box">
		<h2><img src="{$url}application/themes/admin/images/icons/black16x16/ic_picture.png"/> اطلاعات قالب</h2>
		
		<table width="90%" align="center" style="margin-top:5px;margin-bottom:5px;">
			<tr>
				
				<td>{$theme.name}</td>
				<td style="text-align:right;">نام</td>
			</tr>
			<tr>
				
				<td><a href="{$theme.website}" target="_blank">{$theme.author}</a></td>
				<td style="text-align:right;">طراح</td>
			</tr>
			{if hasPermission("changeThemeHeader")}
				<tr>
					
					<td><b style="font-weight:normal;" id="header_field">{if !$header_url}Default{else}Custom{/if} {if $theme.blank_header}</b> (<a href="javascript:void(0)" onClick="Admin.changeHeader('{$header_url}', '{$theme.blank_header}', '{$theme_value}')">change</a>){/if}</td>
					<td style="text-align:right;">سربرگ</td>
				</tr>
			{/if}
		</table>
		{if hasPermission("changeTheme")}
			<div class="divider"></div>
			<a href="{$url}admin/theme" class="button">تغییر قالب</a>
		{/if}
	</section>
</aside>

<div class="clear"></div>