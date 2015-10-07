{form_open('login')}
	<center id="sidebox_login">
		<input type="text" name="login_username" id="login_username" value="Account Name" placeholder="{lang("username", "sidebox_info")}">
		<input type="password" name="login_password" id="login_password" value="Password" placeholder="{lang("password", "sidebox_info")}">
		<table cellpadding="2" cellspacing="2">
			<tbody>
				<tr>
					<td valign="top">
						<div id="log-b">
							<input type="submit" name="login_submit" value="{lang("log_in", "sidebox_info")}">
						</div>
					</td>
					<td valign="top" id="links">
						<a href="{$url}password_recovery">Forgot password?</a>
						<a href="{$url}register">Create new Account</a>
					</td>
				</tr>
			</tbody>
		</table>
	</center>
</form>