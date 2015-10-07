<section class="box big" id="main_sidebox">
	<h2>
		<img src="{$url}application/themes/admin/images/icons/black16x16/ic_grid.png"/>
		منو های کناری (<div style="display:inline;" id="sidebox_count">{if !$sideboxes}0{else}{count($sideboxes)}{/if}</div>)
	</h2>

	<span>
		<a class="nice_button" href="javascript:void(0)" onClick="Sidebox.add()">ساخت منوی کنار سایت</a>
	</span>

	<ul id="sidebox_list">
		{if $sideboxes}
		{foreach from=$sideboxes item=sidebox}
			<li>
				<table width="100%">
					<tr>
						<td width="10%"><a href="javascript:void(0)" onClick="Sidebox.move('up', {$sidebox.id}, this)" data-tip="انتقال به بالا"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_up.png" /></a>
							<a href="javascript:void(0)" onClick="Sidebox.move('down', {$sidebox.id}, this)" data-tip="انتقال به پایین"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_down.png" /></a></td>
						<td width="20%"><b>{langColumn($sidebox.displayName)}</b></td>
						<td width="30%">{$sidebox.name}</td>
						<td width="30%">{if $sidebox.permission}کنترل شده در هر گروه{else}قابل مشاهده برای همه{/if}</td>
						<td style="text-align:right;">
							<a href="{$url}admin/sidebox/edit/{$sidebox.id}" data-tip="ویرایش"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_edit.png" /></a>&nbsp;
							<a href="javascript:void(0)" onClick="Sidebox.remove({$sidebox.id}, this)" data-tip="حذف"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_minus.png" /></a>
						</td>
					</tr>
				</table>
			</li>
		{/foreach}
		{/if}
	</ul>
</section>

<section class="box big" id="add_sidebox" style="display:none;">
	<h2><a href='javascript:void(0)' onClick="Sidebox.add()" data-tip="بازگشت به منو های کناری">منو های کناری</a> &rarr; منوی کناری جدید</h2>

	<form onSubmit="Sidebox.create(this); return false" id="submit_form">
		<label for="displayName">موضوع</label>
		<input type="text" name="displayName" id="displayName" />

		<label for="type">ماژول های کناری</label>
		<select id="type" name="type" onChange="Sidebox.toggleCustom(this)">
			{foreach from=$sideboxModules item=module key=name}
				<option value="{$name}">{$module.name}</option>
			{/foreach}
		</select>

		<label for="visibility">حالت دید</label>
		<select name="visibility" id="visibility" onChange="if(this.value == 'group'){ $('#groups').fadeIn(300); } else { $('#groups').fadeOut(300); }">
			<option value="everyone" selected>قابل مشاهده برای همه</option>
			<option value="group">کنترل شده در هر گروه</option>
		</select>

		<div style="display:none" id="groups">
			لطفا برای کنترل دید <a href="{$url}admin/aclmanager/groups">گروه </a> برای این لینک کلیک کنید.
		</div>
	</form>

	<span id="custom_field" style="padding-top:0px;padding-bottom:0px;">
		<label for="text">Content</label>
		{$fusionEditor}
	</span>

	<form onSubmit="Sidebox.create(document.getElementById('submit_form')); return false">
		<input type="submit" value="ثبت منو کناری جدید" />
	</form>
</section>

<script>
	require([Config.URL + "application/themes/admin/js/mli.js"], function()
	{
		new MultiLanguageInput($("#displayName"));
	});
</script>