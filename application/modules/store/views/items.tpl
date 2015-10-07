<section class="box big" id="main_item">
	<h2>
		<img src="{$url}application/themes/admin/images/icons/black16x16/ic_tag.png"/>
		آیتم (<div style="display:inline;" id="item_count">{if !$items}0{else}{count($items)}{/if}</div>)
	</h2>

	{if hasPermission("canAddItems") || hasPermission("canAddGroups")}
	<span>
		{if hasPermission("canAddItems")}
			<a class="nice_button" href="javascript:void(0)" onClick="Items.add()">افزودن آیتم یا دستور به فروشگاه</a>&nbsp;
		{/if}

		{if hasPermission("canAddGroups")}
			<a class="nice_button" href="javascript:void(0)" onClick="Items.addGroup()">ایجاد گروه جدید</a>
		{/if}
	</span>
	{/if}

	<ul id="item_list">
		{if $items}
		{foreach from=$items item=item}
			<li>
				<table width="100%">
					<tr>
						<td width="5%"><img style="opacity:1;" src="https://wow.zamimg.com/images/wow/icons/small/{$item.icon}.jpg" /></td>
						<td width="30%" data-tip="{$item.description}"><b class="q{$item.quality}">{character_limiter($item.name, 20)}</b></td>
						<td width="20%" {if array_key_exists("title", $item) && $item.title}class="item_group"{/if}>
							{if array_key_exists("title", $item) && array_key_exists("orderNumber", $item) && $item.title}
								<div class="group_actions" style="display:none;">
									{if hasPermission("canEditGroups")}
									<a href="javascript:void(0)" onClick="Items.editGroup({$item.group}, this)" data-tip="Edit group"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_edit.png" /></a>&nbsp;
									{/if}

									{if hasPermission("canRemoveGroups")}
									<a href="javascript:void(0)" onClick="Items.removeGroup({$item.group}, this, true)" data-tip="حذف گروه و تمامی آیتم های آن">
										<img src="{$url}application/themes/admin/images/icons/black16x16/ic_minus.png" />
									</a>
									{/if}
								</div>
								<div class="group_title" style="float: left;">{$item.title}</div>
								<div class="group_order" style="float: right; display: block; margin-right: 10px;">Nr: <abbr class="group_order_number" style="padding: 0px;">{$item.orderNumber}</abbr></div>
							{/if}
						</td>
						<td width="30%">
							{if $item.vp_price}
								<img src="{$url}application/images/icons/lightning.png" style="opacity:1;margin-top:3px;position:absolute;" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$item.vp_price} VP
							{/if}
							{if $item.dp_price}
								<img src="{$url}application/images/icons/coins.png" style="opacity:1;margin-top:3px;position:absolute;"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								{$item.dp_price} DP
							{/if}
						</td>
						<td style="text-align:right;">
							{if hasPermission("canEditItems")}
								<a href="{$url}store/admin_items/edit/{$item.id}" data-tip="ویرایش"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_edit.png" /></a>&nbsp;
							{/if}

							{if hasPermission("canRemoveItems")}
								<a href="javascript:void(0)" onClick="Items.remove({$item.id}, this)" data-tip="حذف"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_minus.png" /></a>
							{/if}
						</td>
					</tr>
				</table>
			</li>
		{/foreach}
		{/if}
	</ul>
</section>

<section class="box big" id="add_item" style="display:none;">
	<h2><a href='javascript:void(0)' onClick="Items.add()" data-tip="بازگشت به آیتم ها">آیتم</a> &rarr; افزودن آیتم جدید</h2>

	<form>
		<label for="item_type">نوع را انتخاب کنید</label>
		<select id="item_type" name="item_type" onChange="Items.changeType(this)">
			<option value="item" selected>آیتم</option>
			<option value="command">دستور</option>
			<option value="query">Query</option>
		</select>
	</form>

	<form onSubmit="Items.create(this); return false" id="command_form" style="display:none;">

		<label for="name">نام</label>
		<input type="text" name="name" id="name" />

		<label for="description">توضیحات کوتاه</label>
		<input type="text" name="description" id="description" />

		<label for="quality">نوع آیتم</label>
		<select id="quality" name="quality">
			<option value="0" class="q0">Poor</option>
			<option value="1" class="q1">Common</option>
			<option value="2" class="q2">Uncommon</option>
			<option value="3" class="q3">Rare</option>
			<option value="4" class="q4">Epic</option>
			<option value="5" class="q5">Legendary</option>
			<option value="6" class="q6">Artifact</option>
			<option value="7" class="q7">Heirloom</option>
		</select>

		<label>نیازمند شخصیت</label>
		<input type="checkbox" id="command_need_character" name="command_need_character" checked="yes" value="1"/>
		<label for="command_need_character" class="inline_label">یک شخصیت را انتخاب کنید</label>

		<label>نیاز به آفلاین بودن هیرو</label>
		<input type="checkbox" id="require_character_offline" name="require_character_offline" value="1"/>
		<label for="require_character_offline" class="inline_label">اطمینان حاصل کنید که شخصیت انتخاب شده آنلاین نیست</label>

		<label for="command">دستور</label>
		<textarea id="command" name="command"></textarea>
		<span>
			{literal}
				<b>{ACCOUNT}</b> = نام کاربری 
				<b>{CHARACTER}</b> = نام هیرو
			{/literal}
		</span>

		<label for="realm">ریلم</label>
		<select name="realm" id="realm">
			{foreach from=$realms item=realm}
				<option value="{$realm->getId()}">{$realm->getName()}</option>
			{/foreach}
		</select>

		<label for="group">گروه آیتم</label>
		<select name="group" id="group">
			<option value="0">هیچ کدام</option>
			{foreach from=$groups item=group}
				<option value="{$group.id}">{$group.title}</option>
			{/foreach}
		</select>

		<div class="vp_price">
			<label for="vpCost"> قیمت VP</label>
			<input type="text" name="vpCost" id="vpCost" value="0"/>
		</div>

		<div class="dp_price">
			<label for="dpCost"> قیمت DP</label>
			<input type="text" name="dpCost" id="dpCost" value="0"/>
		</div>

		<label for="icon">نام آیکن</label>
		<input type="text" name="icon" id="icon" value="" />

		<input type="submit" value="ذخیره دستور" />
	</form>

	<form onSubmit="Items.create(this); return false" id="query_form" style="display:none;">

		<label for="name">نام</label>
		<input type="text" name="name" id="name" />

		<label for="description">توضیحات (خیلی کوتاه باشد)</label>
		<input type="text" name="description" id="description" />

		<label for="quality">نوع آیتم</label>
		<select id="quality" name="quality">
			<option value="0" class="q0">Poor</option>
			<option value="1" class="q1">Common</option>
			<option value="2" class="q2">Uncommon</option>
			<option value="3" class="q3">Rare</option>
			<option value="4" class="q4">Epic</option>
			<option value="5" class="q5">Legendary</option>
			<option value="6" class="q6">Artifact</option>
			<option value="7" class="q7">Heirloom</option>
		</select>

		<label for="query_database">دیتابیس</label>
		<select id="query_database" name="query_database">
			<option value="cms">سی ام اس</option>
			<option value="realm">کاراکتر (characters)</option>
			<option value="realmd">ریلم (accounts/auth/logon)</option>
		</select>

		<label>نیازمند شخصیت</label>
		<input type="checkbox" id="query_need_character" name="query_need_character" checked="yes" value="1"/>
		<label for="query_need_character" class="inline_label">یک شخصیت را انتخاب کنید</label>

		<label>نیاز به آفلاین بودن هیرو</label>
		<input type="checkbox" id="require_character_offline" name="require_character_offline" value="1"/>
		<label for="require_character_offline" class="inline_label">اطمینان حاصل کنید که شخصیت انتخاب شده آنلاین نیست</label>

		<label for="query" data-tip="Example query: UPDATE characters SET level = 80 WHERE guid = {literal}{CHARACTER}{/literal}">SQL query <a>(?)</a></label>
		<textarea id="query" name="query"></textarea>
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
				<option value="{$realm->getId()}">{$realm->getName()}</option>
			{/foreach}
		</select>

		<label for="group">گروه آیتم</label>
		<select name="group" id="group">
			<option value="0">None</option>
			{foreach from=$groups item=group}
				<option value="{$group.id}">{$group.title}</option>
			{/foreach}
		</select>

		<div class="vp_price">
			<label for="vpCost"> قیمت VP</label>
			<input type="text" name="vpCost" id="vpCost" value="0"/>
		</div>

		<div class="dp_price">
			<label for="dpCost"> قیمت DP</label>
			<input type="text" name="dpCost" id="dpCost" value="0"/>
		</div>

		<label for="icon">نام آیکن</label>
		<input type="text" name="icon" id="icon" value="" />

		<input type="submit" value="ذخیره" />
	</form>

	<form onSubmit="Items.create(this); return false" id="item_form">

		<label for="name">نام</label>
		<input type="text" name="name" id="name" placeholder="Will be added automatically if you only specify one item ID" />

		<label for="itemid">آی دی آیتم</label>
		<input type="text" name="itemid" id="itemid" placeholder="12345" />

		<label for="description">توضیحات (خیلی کوتاه)</label>
		<input type="text" name="description" id="description" placeholder="For example, 'Head (Plate)'" />

		<label for="realm">ریلم</label>
		<select name="realm" id="realm">
			{foreach from=$realms item=realm}
				<option value="{$realm->getId()}">{$realm->getName()}</option>
			{/foreach}
		</select>

		<label for="group">گروه آیتم</label>
		<select name="group" id="group">
			<option value="0">None</option>
			{foreach from=$groups item=group}
				<option value="{$group.id}">{$group.title}</option>
			{/foreach}
		</select>

		<div class="vp_price">
			<label for="vpCost"> قیمت VP</label>
			<input type="text" name="vpCost" id="vpCost" value="0"/>
		</div>

		<div class="dp_price">
			<label for="dpCost"> قیمت DP</label>
			<input type="text" name="dpCost" id="dpCost" value="0"/>
		</div>

		<label for="icon">نام آیکن</label>
		<input type="text" name="icon" id="icon" placeholder="Will be added automatically if you leave empty, and only specify one item ID" />

		<input type="submit" value="ذخیره" />
	</form>
</section>

<section class="box big" id="add_group" style="display:none;">
	<h2><a href='javascript:void(0)' onClick="Items.addGroup()" data-tip="Return to items">آیتم</a> &rarr; ایجاد گروه جدید</h2>

	<form onSubmit="Items.create(this, true); return false">
		<label for="title">نام گروه</label>
		<input type="text" name="title" id="title" />
		
		<label for="order" data-tip="Specify an order, it will be sorted ascending by group order">Group order</label>
		<input type="text" name="order" id="order" />

		<input type="submit" value="ایجاد گروه" />
	</form>
</section>