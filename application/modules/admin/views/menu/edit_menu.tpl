<section class="box big">
	<h2>ویرایش لینک</h2>

	<form onSubmit="Menu.save(this, {$link.id}); return false" id="submit_form">
		<label for="name" dir="rtl" align="right">موضوع</label>
		<input dir="rtl" align="right" type="text" name="name" id="name" placeholder="لینک من" value="{htmlspecialchars($link.name)}" />

		<label dir="rtl" align="right" for="type" data-tip=" استفاده کنید http:// برای لینک های خروجی از">آدرس <a>(?)</a></label>
		<input type="text" name="link" id="link" placeholder="http://" value="{$link.link}"/>

		<label for="side" dir="rtl" align="right">مکان منو</label>
		<select name="side" id="side">
			<option value="top" {if $link.side == "top"}selected{/if}>بالا</option>
			<option value="side" {if $link.side == "side"}selected{/if}>کنار</option>
		</select>

		<label for="visibility" dir="rtl" align="right">حالت دید</label>
		<select name="visibility" id="visibility" onChange="if(this.value == 'group'){ $('#groups').fadeIn(300); } else { $('#groups').fadeOut(300); }">
			<option value="everyone" {if !$link.permission}selected{/if}>قابل مشاهده برای همه</option>
			<option value="group" {if $link.permission}selected{/if}>کنترل شده در هر گروه</option>
		</select>

		<div {if !$link.permission}style="display:none"{/if} id="groups" dir="rtl" align="right">
			لطفا دید گروه از طریق مدیریت <a href="{$url}admin/aclmanager/groups">تنظیم کنید .</a>
		</div>
		
		<label dir="rtl" align="right" for="direct_link" data-tip="اگر میخواهید لینک به یک پیوند غیر از این دامنه بروید بله و در غیر این صورت سی ام اس در خود سایت جستجو خواهد کرد">لینک مستقیم داخلی <a>(?)</a></label>
		<select name="direct_link" id="direct_link">
				<option value="0" {if $link.direct_link == "0"}selected{/if}>خیر</option>
				<option value="1" {if $link.direct_link == "1"}selected{/if}>بله</option>
		</select>

		<input type="submit" value="ذخیره لینک" />
	</form>
</section>

<script>
	require([Config.URL + "application/themes/admin/js/mli.js"], function()
	{
		new MultiLanguageInput($("#name"));
	});
</script>