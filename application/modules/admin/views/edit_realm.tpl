<section class="box big">
	<h2><img src="{$url}application/themes/admin/images/icons/black16x16/ic_settings.png"/> تنظیمات ریلم</h2>

	<form onSubmit="Settings.saveRealm({$realm->getId()}); return false">
		<label for="realmName" dir="rtl" align="right">نام ریلم</label>
		<input type="text" id="realmName" name="realmName" value="{$realm->getName()}" />

		<label for="realmName" dir="rtl" align="right">آی پی محل سرور</label>
		<input type="text" id="hostname" value="{$realm->getConfig('hostname')}" />

		<label for="override_hostname_char" dir="rtl" align="right">محل دیتابیس Characters</label>
		<input type="text" id="override_hostname_char" value="{$hostname_char}" />

		<label for="override_username_char" dir="rtl" align="right">نام کاربری دیتابیس Characters</label>
		<input type="text" id="override_username_char" value="{$username_char}" />

		<label for="override_password_char" dir="rtl" align="right">رمز عبور دیتابیس Characters</label>
		<input type="password" id="override_password_char" value="{$password_char}" />

		<label for="override_port_char" dir="rtl" align="right">پورت دیتابیس Characters</label>
		<input type="text" id="override_port_char" value="{$port_char}"  />

		<label for="override_hostname_world" dir="rtl" align="right">محل دیتابیس World</label>
		<input type="text" id="override_hostname_world" value="{$hostname_world}" />

		<label for="override_username_world" dir="rtl" align="right">نام کاربری دیتابیس World</label>
		<input type="text" id="override_username_world" value="{$username_world}" />

		<label for="override_password_world" dir="rtl" align="right">رمز عبور دیتابیس World</label>
		<input type="password" id="override_password_world" value="{$password_world}" />

		<label for="override_port_world" dir="rtl" align="right">پورت دیتابیس World</label>
		<input type="text" id="override_port_world" value="{$port_world}"  />

		<label for="characters" dir="rtl" align="right">نام دیتابیس Characters</label>
		<input type="text" id="characters" name="characters" value="{$realm->getConfig('characters_database')}" />

		<label for="world" dir="rtl" align="right">نام دیتابیس World</label>
		<input type="text" id="world" name="world" value="{$realm->getConfig('world_database')}" />

		<label for="cap" dir="rtl" align="right">ظرفیت تعداد پلیر های آنلاین</label>
		<input type="text" id="cap" name="cap" value="{$realm->getCap()}" />

		<label for="port" dir="rtl" align="right">پورت ریلم</label>
		<input type="text" id="port" name="port" value="{$realm->getConfig('realm_port')}" />


		<label for="emulator" dir="rtl" align="right">شبیه ساز</label>
		<select id="emulator" name="emulator">
			{foreach from=$emulators key=emu_id item=emu_name}
			<option value="{$emu_id}" {if $emu_id == $realm->getConfig('emulator')}selected{/if}>{$emu_name}</option>
			{/foreach}
		</select>

		<label for="console_port" dir="rtl" align="right">کنسول پورت : برای دسترسی ریموت معمولا 3443 و سرویس Soap معمولا 7878 میباشد</label>
		<input type="text" id="console_port" name="console_port" value="{$realm->getConfig('console_port')}"/>

		<label for="console_username" dir="rtl" align="right" data-tip="اکانت رنک 4 به بالا در سرور<br />برای ارتباط نیاز است">نام کاربری ادمین با رنک 4 (?)</label>
		<input type="text" id="console_username" name="console_username" value="{$realm->getConfig('console_username')}" />

		<label for="console_password" dir="rtl" align="right" data-tip="اکانت رنک 4 به بالا در سرور<br />برای ارتباط نیاز است">نام کاربری ادمین با رنک 4 (?)</label>
		<input dir="rtl" align="right" type="text" id="console_password" name="console_password" placeholder=" اگر میخواهید رمز عبور را عوض کنید ، رمز جدید را وارد نمایید" />

		<input type="submit" value="ذخیره ریلم" />
	</form>
</section>