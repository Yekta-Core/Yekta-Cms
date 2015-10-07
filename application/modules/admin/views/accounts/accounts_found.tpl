<form onSubmit="Accounts.save(this, {$external_details.id}); return false" id="submit_form">
	<label dir="rtl" align="right">اکانت ها</label>
	({$external_details.id}) <b>{$external_details.username}</b>

	<label dir="rtl" align="right">آخرین ورود</label>
	<b>{$external_details.last_login}</b> by <b>{$external_details.last_ip}</b>

	<label for="vp" dir="rtl" align="right">مقدار Vote پوینت</label>
	<input type="text" id="vp" name="vp" value="{$internal_details.vp}" {if !hasPermission("editAccounts")}disabled="disabled"{/if}/>

	<label for="dp" dir="rtl" align="right">مقدار اعتبار مالی</label>
	<input type="text" id="dp" name="dp" value="{$internal_details.dp}" {if !hasPermission("editAccounts")}disabled="disabled"{/if}/>

	<label for="nickname" dir="rtl" align="right">نام کوچک</label>
	<input type="text" id="nickname" name="nickname" value="{$internal_details.nickname}" {if !hasPermission("editAccounts")}disabled="disabled"{/if}/>

	<label for="email" dir="rtl" align="right">پست الکترونیکی</label>
	<input type="text" id="email" name="email" value="{$external_details.email}" {if !hasPermission("editAccounts")}disabled="disabled"{/if}/>

	<label for="group" dir="rtl" align="right">کاربر گروه وبسایت</label>
	<div dir="rtl" align="right" style="background-color: #fff;border-radius: 5px;padding: 5px 10px;border: 1px solid #ccc;">لطفا برای مشاهده گروه ها  <a href="{$url}admin/aclmanager/groups">اینجا کلیک کنید</a></div>

	<label for="password" dir="rtl" align="right">تغییر رمز عبور</label>
	<input dir="rtl" align="right" type="text" id="password" name="password" placeholder="رمز عبور جدید را وارد کنید" {if !hasPermission("editAccounts")}disabled="disabled"{/if}/>

	<label for="gm_level" dir="rtl" align="right">رنک مدیریت</label>
	<input type="text" id="gm_level" name="gm_level" value="{if !$access_id.gmlevel}0{else}{$access_id.gmlevel}{/if}" {if !hasPermission("editAccounts")}disabled="disabled"{/if}/>

	<label for="expansion" dir="rtl" align="right">پچ</label>
	<select id="expansion" name="expansion" {if !hasPermission("editAccounts")}disabled="disabled"{/if}>
		{foreach from=$expansions key=id item=expansion}
			<option value="{$id}" {if $external_details.expansion == $id}selected{/if}>{$expansion}</option>
		{/foreach}
	</select>

	{if hasPermission("editAccounts")}
		<input type="submit" value="Save account" />
	{/if}

	{if hasPermission("editPermissions")}
	
		<label dir="rtl" align="right" data-tip="کاربر می تواند به طور خاص اجازه و یا برای انجام یک عمل خاص را تکذیب کرد.<br />
		شما میتوانید با تنظیم دسترسی از ورود کاربران به برخی از مکان های سایت جلوگیری کنید<br />
		به عنوان مثال: گروه کاربر مجاز به ارسال نظر، اما به شما در تنظیم کاربر<br />
		میتوانید ارسال نظر توسط کاربران را غیر فعال کنید<br />
		">دسترسی کاربران <a>(?)</a></label>
		<div id="roles">
				{foreach from=$modules key=name item=module}
					{if $module.manifest}
						<div class="role_module">
							<h3>{ucfirst($module.name)} <span onClick="Accounts.moduleState('arrow_{$module.folderName}', '{$module.folderName}')" style="float: right; padding: 0px;"><div id="arrow_{$module.folderName}" class="arrow" style="cursor: pointer;">&rarr;</div></span></h3>
							<div id="{$module.folderName}" style="display: none;">
								<table width="100%">
									{if $module.manifest}
										{foreach from=$module.manifest key=permissionName item=permission}
											<tr>
												<td width="12%" style="text-align:center;">
													<select name="{$name}-{$permissionName}" id="{$name}-{$permissionName}" {if !hasPermission("editAccounts")}disabled="disabled"{/if}>
														<option value="" selected>-</option>
														<option value="1">مجاز</option>
														<option value="0">غیر مجاز</option>
													</select>
												</td>
												<td width="30%">&nbsp;&nbsp;<label for="{$name}-{$permissionName}" style="display:inline;border:none;font-weight:bold;">{$permissionName}</label></td>
												<td style="font-size:10px;">{$permission.description} (default: {($permission.default) ? "allow" : "deny"})</td>
											</tr>
										{/foreach}
									{/if}
								</table>
							</div>
						</div>
					{/if}
				{/foreach}
				{if hasPermission("editAccounts")}
					<input type="submit" value="ذخیره اکانت" />
				{/if}
			</div>
	{/if}
</form>