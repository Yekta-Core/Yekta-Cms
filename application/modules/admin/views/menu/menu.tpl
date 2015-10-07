<script type="text/javascript">
	var customPages = JSON.parse('{json_encode($pages)}');
</script>

<section class="box big" id="main_link">
	<h2>
		<img src="{$url}application/themes/admin/images/icons/black16x16/ic_list.png"/>
		لینک منو ها (<div style="display:inline;" id="link_count">{if !$links}0{else}{count($links)}{/if}</div>)
	</h2>

	{if hasPermission("addMenuLinks")}
	<span>
		<a class="nice_button" href="javascript:void(0)" onClick="Menu.add()">ساخت لینک</a>
	</span>
	{/if}

	<ul id="link_list">
		{if $links}
		{foreach from=$links item=link}
			<li>
				<table width="100%">
					<tr>
						<td width="10%">
							{if hasPermission("editMenuLinks")}
							<a href="javascript:void(0)" onClick="Menu.move('up', {$link.id}, this)" data-tip="انتقال به بالا"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_up.png" /></a>
							<a href="javascript:void(0)" onClick="Menu.move('down', {$link.id}, this)" data-tip="انتقال به پایین"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_down.png" /></a>
							{/if}
						</td>
						<td width="30%"><span style="font-size:10px;padding:0px;display:inline;">{$link.side}&nbsp;&nbsp;</span> <b>{langColumn($link.name)}</b></td>
						<td width="50%"><a href="{$link.link}" target="_blank">{$link.link_short}</a></td>
						<td style="text-align:right;">
							{if hasPermission("editMenuLinks")}
							<a href="{$url}admin/menu/edit/{$link.id}" data-tip="ویرایش"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_edit.png" /></a>
							{/if}
							&nbsp;
							{if hasPermission("deleteMenuLinks")}
							<a href="javascript:void(0)" onClick="Menu.remove({$link.id}, this)" data-tip="حذف"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_minus.png" /></a>
							{/if}
						</td>
					</tr>
				</table>
			</li>
		{/foreach}
		{/if}
	</ul>
</section>

<section class="box big" id="add_link" style="display:none;">
	<h2><a href='javascript:void(0)' onClick="Menu.add()" data-tip="باگشت به لینک منو ها">لینک منوها</a> &rarr; ساخت لینک</h2>

	<form onSubmit="Menu.create(this); return false" id="submit_form">
		<label for="name" dir="rtl" align="right">موضوع</label>
		<input type="text" name="name" id="name" placeholder="لینک من />

		<label for="type" dir="ltr" align="left">آدرس یا  <a href="javascript:void(0)" onClick="Menu.selectCustom()" dir="rtl" align="right">انتخاب یک برگه دلخواه</a></label>
		<input type="text" name="link" id="link" placeholder="http://"/>

		<label for="side" dir="rtl" align="right">مکان منو</label>
		<select name="side" id="side">
				<option value="top">بالا</option>
				<option value="side">کنار</option>
		</select>

		<label for="visibility" dir="rtl" align="right">حالت دید</label>
		<select name="visibility" id="visibility" onChange="if(this.value == 'group'){ $('#groups').fadeIn(300); } else { $('#groups').fadeOut(300); }">
			<option value="everyone" selected>قابل مشاهده برای همه</option>
			<option value="group">کنترل شده در هر گروه</option>
		</select>

		<div id="groups" style="display:none;" dir="rtl" align="right">
			لطفا برای کنترل دید <a href="{$url}admin/aclmanager/groups">گروه </a> برای این لینک کلیک کنید.
		</div>

<label dir="rtl" align="right" for="direct_link" data-tip="اگر میخواهید لینک به خارج از این سایت برود بله و در غیر این صورت سی ام اس در خود سایت به جستجو آدرس عمل خواهد کرد">لینک مستقیم داخلی <a>(?)</a></label>
		<select name="direct_link" id="direct_link">
				<option value="0">خیر</option>
				<option value="1">بله</option>
		</select>
	
		<input type="submit" value="ثبت لینک" />
	</form>
</section>

<script>
	require([Config.URL + "application/themes/admin/js/mli.js"], function()
	{
		new MultiLanguageInput($("#name"));
	});
</script>