<section class="box big">
	<h2>ویرایش منو کناری</h2>

	<form onSubmit="Sidebox.save(this, {$sidebox.id}); return false" id="submit_form">
		<label for="displayName">موضوع</label>
		<input type="text" name="displayName" id="displayName" value="{htmlspecialchars($sidebox.displayName)}"/>

		<label for="type">ماژول منو کناری</label>
		<select id="type" name="type" onChange="Sidebox.toggleCustom(this)">
			{foreach from=$sideboxModules item=module key=name}
				<option value="{$name}" {if $sidebox.type == preg_replace("/sidebox_/", "", $name)}selected{/if}>{$module.name}</option>
			{/foreach}
		</select>

		<label for="visibility">حالت دید</label>
		<select name="visibility" id="visibility" onChange="if(this.value == 'group'){ $('#groups').fadeIn(300); } else { $('#groups').fadeOut(300); }">
			<option value="everyone" {if !$sidebox.permission}selected{/if}>قابل مشاهده برای همه</option>
			<option value="group" {if $sidebox.permission}selected{/if}>کنترل شده در هر گروه</option>
		</select>

		<div {if !$sidebox.permission}style="display:none"{/if} id="groups">
			لطفا دید گروه از طریق مدیریت <a href="{$url}admin/aclmanager/groups">تنظیم کنید .</a>
		</div>
	</form>

	<span id="custom_field" style="padding-top:0px;padding-bottom:0px;{if $sidebox.type != "custom"}display:none{/if}" >
		<label for="text">محتوی</label>
		{$fusionEditor}
	</span>

	<form onSubmit="Sidebox.save(document.getElementById('submit_form'), {$sidebox.id}); return false">
		<input type="submit" value="ذخیره منو کناری" />
	</form>
</section>

<script>
	require([Config.URL + "application/themes/admin/js/mli.js"], function()
	{
		new MultiLanguageInput($("#displayName"));
	});
</script>