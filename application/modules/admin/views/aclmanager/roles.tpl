<section class="box big" id="main_roles">
	<h2>
		<img src="{$url}application/themes/admin/images/icons/black16x16/ic_lock.png"/>
		Roles
	</h2>

	<!-- later...
	{if hasPermission("addPermissions")}
		<span dir="rtl" align="right">
			<a class="nice_button" href="javascript:void(0)" onClick="Roles.add()">ساخت وظیفه</a>
		</span>
	{/if}
	-->

	<ul id="roles_list">
		{foreach from=$modules key=name item=module}
			{if $module.db || $module.manifest}
				{if $module.db}
					{foreach from=$module.db item=role}
						<li>
							<table width="100%">
								<tr>
									<td width="30%"><b>{$role.name}</b></td>
									<td width="30%">{ucfirst($module.name)}</td>
									<td dir="rtl" align="right" width="30%">وضیفه دلخواه</td>
									<td style="text-align:right;">
										{if hasPermission("editPermissions")}
											<a href="{$url}admin/aclmanager/editRole/{$role.id}" data-tip="Edit"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_edit.png" /></a>&nbsp;
										{/if}

										{if hasPermission("deletePermissions")}
											<a href="javascript:void(0)" onClick="Roles.remove({$role.id}, this)" data-tip="Delete"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_minus.png" /></a>
										{/if}
									</td>
									<td style="text-align:right;font-size:12px;">
										<div class="arrow">&rarr;</div>
									</td>
								</tr>
							</table>
						</li>
						<li class="expanded">
							<div class="description">{$role.description}</div>
							{foreach from=$role.permissions key=name item=value}
								<div class="permission">
									<div class="value"><img src="{$url}application/images/icons/{($value) ? 'accept' : 'exclamation'}.png" /></div>
									{$name}
								</div>
							{/foreach}
						</li>
					{/foreach}
				{/if}
				
				{if $module.manifest}
					{foreach from=$module.manifest key=roleName item=role}
						<li>
							<table width="100%">
								<tr>
									<td width="30%"><b>{$roleName}</b></td>
									<td width="30%">{ucfirst($module.name)}</td>
									<td dir="rtl" align="right" width="30%" data-tip="ماژول ارائه نقش نمی تواند تغییر کند">ماژول ارائه نقش <a>(?)</a></td>
									<td style="text-align:right;font-size:12px;">
										<div class="arrow">&rarr;</div>
									</td>
								</tr>
							</table>
						</li>
						<li class="expanded">
							<div class="description">{$role.description}</div>
							{foreach from=$role.permissions key=name item=value}
								<div class="permission">
									<div class="value"><img src="{$url}application/images/icons/{($value) ? 'accept' : 'exclamation'}.png" /></div>
									{$name}
								</div>
							{/foreach}
						</li>
					{/foreach}
				{/if}
			{/if}
		{/foreach}
	</ul>
</section>

<!-- later...
<section class="box big" id="add_roles" style="display:none;">
	<h2><a href='javascript:void(0)' onClick="Roles.add()" data-tip="بازگشت به وظایف">وظایف</a> &rarr; وضیفه جدید</h2>

	<form onSubmit="Roles.create(this); return false" id="submit_form">

		<label for="name">نام وظیفه</label>
		<input type="text" name="name" id="name"/>

		<label for="description">توضیحات</label>
		<input type="text" name="description" id="description"/>

		<input type="submit" value="ثبت وضیفه" />
	</form>
</section>
-->