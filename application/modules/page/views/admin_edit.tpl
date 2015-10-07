{TinyMCE()}
<section class="box big">
	<h2>ویرایش صفحه</h2>

	<form onSubmit="Pages.send({$page.id}); return false">
		<label for="headline">عنوان</label>
		<input type="text" id="headline" value="{htmlspecialchars($page.name)}"/>
		
		<label for="identifier">لینک صفحه (به این شکل خواهد بود mywebsite.com/page/<b>mypage</b>)</label>
		<input type="text" id="identifier" placeholder="mypage" value="{$page.identifier}" />

		<label for="visibility">شیوه نمایش</label>
		<select name="visibility" id="visibility" onChange="if(this.value == 'group'){ $('#groups').fadeIn(300); } else { $('#groups').fadeOut(300); }">
			<option value="everyone" {if !$page.permission}selected{/if}>نمایش بصورت عمومی</option>
			<option value="group" {if $page.permission}selected{/if}>نمایش برای یک گروه خاص</option>
		</select>

		<div {if !$page.permission}style="display:none"{/if} id="groups">
			لطفاً <a href="{$url}admin/aclmanager/groups">از این قسمت</a> یک گروه در را مدیریت کنید
		</div>

		<label for="Pages_content">
			محتوی
		</label>
	</form>
		<div style="padding:10px;">
			<textarea name="pages_content" class="tinymce" id="pages_content" cols="30" rows="10">{$page.content}</textarea>
		</div>
	<form onSubmit="Pages.send({$page.id}); return false">
		<input type="submit" value="ذخیره" />
	</form>
</section>

<script>
	require([Config.URL + "application/themes/admin/js/mli.js"], function()
	{
		new MultiLanguageInput($("#headline"));
	});
</script>