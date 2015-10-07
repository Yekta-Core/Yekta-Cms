<section class="box big">
	<h2>ویرایش آیتم</h2>

	<form>
		<label for="item_type">نوع آیتم</label>
		<select id="item_type" name="item_type" onChange="Items.changeType(this)">
			<option value="item" {if !$item.query && !$item.command}selected{/if}>آیتم</option>
			<option value="command" {if !$item.query && $item.command}selected{/if}>دستور کنسول</option>
			<option value="query" {if !$item.command && $item.query}selected{/if}>Query</option>
		</select>
	</form>

	<script type="text/javascript">
		var formType = {if $item.query}"query"{else if $item.command}"command"{else}"item"{/if};
	</script>
	
	<form onSubmit="Items.save(this, {$item.id}); return false" id="command_form" {if !$item.command}style="display:none;"{/if}>

		<label for="name">نام</label>
		<input type="text" name="name" id="name" value="{$item.name}" />

		<label for="description">توضیحات (خیلی کوتاه باشد)</label>
		<input type="text" name="description" id="description" value="{$item.description}" />

		<label for="quality">کیفیت آیتم</label>
		<select id="quality" name="quality">
			<option value="0" class="q0" {if $item.quality == 0}selected{/if}>Poor</option>
			<option value="1" class="q1" {if $item.quality == 1}selected{/if}>Common</option>
			<option value="2" class="q2" {if $item.quality == 2}selected{/if}>Uncommon</option>
			<option value="3" class="q3" {if $item.quality == 3}selected{/if}>Rare</option>
			<option value="4" class="q4" {if $item.quality == 4}selected{/if}>Epic</option>
			<option value="5" class="q5" {if $item.quality == 5}selected{/if}>Legendary</option>
			<option value="6" class="q6" {if $item.quality == 6}selected{/if}>Artifact</option>
			<option value="7" class="q7" {if $item.quality == 7}selected{/if}>Heirloom</option>
		</select>

		<label>نیازمند شخصیت</label>
		<input type="checkbox" id="command_need_character" name="command_need_character" {if $item.command_need_character}checked="yes"{/if} value="1"/>
		<label for="command_need_character" class="inline_label">یک شخصیت را انتخاب کنید</label>

		<label>نیاز به آفلاین بودن هیرو</label>
		<input type="checkbox" id="require_character_offline" name="require_character_offline" {if $item.require_character_offline}checked="yes"{/if} value="1"/>
		<label for="require_character_offline" class="inline_label">اطمینان حاصل کنید که شخصیت انتخاب شده آنلاین نیست</label>

		<label for="command">دستور (میتوانید با ایجاد خط جدید از چندین دستور استفاده کنید)</label>
		<textarea id="command" name="command">{$item.command}</textarea>
		<span>
			{literal}
				<b>{ACCOUNT}</b> = نام اکانت, 
				<b>{CHARACTER}</b> = نام هیرو
			{/literal}
		</span>

		<label for="realm">ریلم</label>
		<select name="realm" id="realm">
			{foreach from=$realms item=realm}
				<option value="{$realm->getId()}" {if $item.realm == $realm->getId()}selected{/if}>{$realm->getName()}</option>
			{/foreach}
		</select>

		<label for="group">گروه آیتم</label>
		<select name="group" id="group">
			<option value="0"  {if $item.group == "0"}selected{/if}>هیچ کدام</option>
			{foreach from=$groups item=group}
				<option value="{$group.id}" {if $item.group != 0 && $item.group == $group.id}selected{/if}>{$group.title}</option>
			{/foreach}
		</select>

		<div class="vp_price">
			<label for="vpCost"> قیمت VP</label>
			<input type="text" name="vpCost" id="vpCost" value="{$item.vp_price}"/>
		</div>

		<div class="dp_price">
			<label for="dpCost"> قیمت DP</label>
			<input type="text" name="dpCost" id="dpCost" value="{$item.dp_price}"/>
		</div>

		<label for="icon">نام آیکون</label>
		<input type="text" name="icon" id="icon" value="{$item.icon}" />

		<input type="submit" value="ذخیره دستور" />
	</form>

	<form onSubmit="Items.save(this, {$item.id}); return false" id="query_form" {if !$item.query}style="display:none;"{/if}>

		<label for="name">نام</label>
		<input type="text" name="name" id="name" value="{$item.name}" />

		<label for="description">توضیحات (خیلی کوتاه باشد)</label>
		<input type="text" name="description" id="description" value="{$item.description}" />

		<label for="quality">کیفیت آیتم</label>
		<select id="quality" name="quality">
			<option value="0" class="q0" {if $item.quality == 0}selected{/if}>Poor</option>
			<option value="1" class="q1" {if $item.quality == 1}selected{/if}>Common</option>
			<option value="2" class="q2" {if $item.quality == 2}selected{/if}>Uncommon</option>
			<option value="3" class="q3" {if $item.quality == 3}selected{/if}>Rare</option>
			<option value="4" class="q4" {if $item.quality == 4}selected{/if}>Epic</option>
			<option value="5" class="q5" {if $item.quality == 5}selected{/if}>Legendary</option>
			<option value="6" class="q6" {if $item.quality == 6}selected{/if}>Artifact</option>
			<option value="7" class="q7" {if $item.quality == 7}selected{/if}>Heirloom</option>
		</select>

		<label for="query_database">دیتابیس</label>
		<select id="query_database" name="query_database">
			<option value="cms" {if $item.query_database == "cms"}selected{/if}>سی ام اس</option>
			<option value="realm" {if $item.query_database == "realm"}selected{/if}>کاراکتر (characters)</option>
			<option value="realmd" {if $item.query_database == "realmd"}selected{/if}>ریلم (accounts/auth/logon)</option>
		</select>

		<label>نیازمند شخصیت</label>
		<input type="checkbox" id="query_need_character" name="query_need_character" {if $item.query_need_character}checked="yes"{/if} value="1"/>
		<label for="query_need_character" class="inline_label">یک شخصیت را انتخاب کنید</label>

		<label>نیاز به آفلاین بودن هیرو</label>
		<input type="checkbox" id="require_character_offline" name="require_character_offline" {if $item.require_character_offline}checked="yes"{/if} value="1"/>
		<label for="require_character_offline" class="inline_label">اطمینان حاصل کنید که شخصیت انتخاب شده آنلاین نیست</label>

		<label for="query" data-tip="Example query: UPDATE characters SET level = 80 WHERE guid = {literal}{CHARACTER}{/literal}">SQL query <a>(?)</a></label>
		<textarea id="query" name="query">{$item.query}</textarea>
		<span>
			{literal}
				<b>{ACCOUNT}</b> = Account ID, 
				<b>{CHARACTER}</b> = Character ID, 
				<b>{REALM}</b> = Realm ID
			{/literal}
		</span>

		<label for="realm">ریلم</label>
		<select name="realm" id="realm">
			{foreach from=$realms item=realm}
				<option value="{$realm->getId()}" {if $item.realm == $realm->getId()}selected{/if}>{$realm->getName()}</option>
			{/foreach}
		</select>

		<label for="group">گروه آیتم</label>
		<select name="group" id="group">
			<option value="0"  {if $item.group == "0"}selected{/if}>هیچ کدام</option>
			{foreach from=$groups item=group}
				<option value="{$group.id}" {if $item.group != 0 && $item.group == $group.id}selected{/if}>{$group.title}</option>
			{/foreach}
		</select>

		<div class="vp_price">
			<label for="vpCost"> قیمت VP</label>
			<input type="text" name="vpCost" id="vpCost" value="{$item.vp_price}"/>
		</div>

		<div class="dp_price">
			<label for="dpCost"> قیمت DP</label>
			<input type="text" name="dpCost" id="dpCost" value="{$item.dp_price}"/>
		</div>

		<label for="icon">نام آیکون</label>
		<input type="text" name="icon" id="icon" value="{$item.icon}" />

		<input type="submit" value="ذخیره" />
	</form>

	<form onSubmit="Items.save(this, {$item.id}); return false" id="item_form" {if $item.query}style="display:none;"{/if}>

		<label for="name">نام</label>
		<input type="text" name="name" id="name" placeholder="اگر هیچ چیزی وارد نکنید به صورت اتوماتیک مشخص میشود" value="{$item.name}"/>

		<label for="itemid">آی دی آیتم</label>
		<input type="text" name="itemid" id="itemid" placeholder="12345" value="{$item.itemid}" />

		<label for="description">توضیحات (خیلی کوتاه)</label>
		<input type="text" name="description" id="description" placeholder="For example, 'Head (Plate)'" value="{$item.description}"/>

		<label for="realm">ریلم</label>
		<select name="realm" id="realm">
			{foreach from=$realms item=realm}
				<option value="{$realm->getId()}" {if $item.realm == $realm->getId()}selected{/if}>{$realm->getName()}</option>
			{/foreach}
		</select>

		<label for="group">گروه آیتم</label>
		<select name="group" id="group">
			<option value="0" {if $item.group == "0"}selected{/if}>None</option>
			{foreach from=$groups item=group}
				<option value="{$group.id}" {if $item.group != 0 && $item.group == $group.id}selected{/if}>{$group.title}</option>
			{/foreach}
		</select>

		<div class="vp_price">
			<label for="vpCost"> قیمت VP</label>
			<input type="text" name="vpCost" id="vpCost" value="{$item.vp_price}"/>
		</div>

		<div class="dp_price">
			<label for="dpCost"> قیمت DP</label>
			<input type="text" name="dpCost" id="dpCost" value="{$item.dp_price}"/>
		</div>

		<label for="icon">نام آیکون</label>
		<input type="text" name="icon" id="icon" value="{$item.icon}" placeholder="اگر هیچ چیزی وارد نکنید به صورت اتوماتیک مشخص میشود" />

		<input type="submit" value="ذخیره آیتم" />
	</form>
</section>