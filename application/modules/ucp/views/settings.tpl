<form onSubmit="Settings.submitInfo(); return false" id="settings_info" class="page_form">
	<table style="width:90%">
		<tr>
			<td style="width:25% !important"><label for="nickname_field">{lang("nickname", "ucp")}</label></td>
			<td><input type="text" name="nickname_field" id="nickname_field" value="{$nickname}"/></td>
		</tr>
		<tr>
			<td><label for="location_field">{lang("location", "register")}</label></td>
			<td>
				<select name="location_field" class="country-select" id="location_field">
					<option disabled>{lang("msg_select_option", "register")}</option>
					{foreach from=$countries key=country item=data}
						<option value="{$country}" {set_select('register_location', $country)}>{$data.name}</option>
					{/foreach}
				</select>
			</td>
		</tr>
		{if $show_language_chooser}
			<tr>
				<td style="width:25% !important"><label for="language_field">Website language</label></td>
				<td>
					<select name="language_field" id="language_field">
						{foreach from=$languages item=language}
							<option value="{$language}" {if $userLanguage == $language}selected="selected"{/if}>{ucfirst($language)}</option>
						{/foreach}
					</select>
				</td>
			</tr>
		{/if}
	</table>

	<center style="margin-bottom:10px;">
		<input type="submit" value="{lang("change_information", "ucp")}" />
	</center>

	<div id="settings_info_ajax" style="text-align:center;padding:10px;"></div>
</form>
<div class="ucp_divider"></div>
<form onSubmit="Settings.submit(); return false" id="settings" class="page_form">
	<table style="width:90%">
		<tr>
			<td style="width:25% !important"><label for="old_password">{lang("old_password", "ucp")} :</label></td>
			<td><input type="password" name="old_password" id="old_password"/></td>
		</tr>
		<tr>
			<td><label for="new_password">{lang("new_password", "ucp")} :</label></td>
			<td><input type="password" name="new_password" id="new_password"/></td>
		</tr>
		<tr>
			<td><label for="new_password_confirm">{lang("new_password_confirm", "ucp")} :</label></td>
			<td><input type="password" name="new_password_confirm" id="new_password_confirm"/></td>
		</tr>
	</table>

	<center style="margin-bottom:10px;">
		<input type="submit" value="{lang("new_password_submit", "ucp")}" />
	</center>

	<div id="settings_ajax" style="text-align:center;padding:10px;"></div>
</form>