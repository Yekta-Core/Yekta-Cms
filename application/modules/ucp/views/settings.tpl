<style type="text/css">
<!--
#main {
	direction: rtl;
}
-->

</style>




<div class="ucp_divider"></div>
<form onSubmit="Settings.submit(); return false" id="settings" class="page_form">
	<table style="width:90%">
		<tr>
			<td style="width:25% !important"><label for="old_password">کلمه عبور قدیم : </label></td>
			<td><input dir="ltr" type="password" name="old_password" id="old_password"/></td>
		</tr>
		<tr>
			<td><label for="new_password">کلمه عبور جدید : </label></td>
			<td><input dir="ltr" type="password" name="new_password" id="new_password"/></td>
		</tr>
		<tr>
			<td><label for="new_password_confirm">تکرار کلمه عبور : </label></td>
			<td><input dir="ltr" type="password" name="new_password_confirm" id="new_password_confirm"/></td>
		</tr>
	</table>

	<center style="margin-bottom:10px;">
		<input type="submit" value="تغییر کلمه عبور" />
	</center>

	<div id="settings_ajax" style="text-align:center;padding:10px;"></div>
</form>