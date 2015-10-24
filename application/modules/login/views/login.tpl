{form_open('login', $class)}
	<table>
		<tr>
			<td><span id="username_error">{$username_error}</span></td>
			<td>
				{lang("username", "login")}<input type="text" name="login_username" id="login_username" value="{$username}"/>
				
			</td>
		</tr>
		<tr>
			<td><span id="password_error">{$password_error}</span></td>
			<td>
				{lang("password", "login")}<input type="password" name="login_password" id="login_password" value="" AUTOCOMPLETE="off"/>
				
			</td>
		</tr>
	</table>

	<center>
		<div id="remember_me">
			<label for="login_remember" data-tip="{lang("remember_me", "login")}">{lang("remember_me_short", "login")}</label>
			<input type="checkbox" name="login_remember" id="login_remember"/>
		</div>

		<input type="submit" name="login_submit" value="{lang("log_in", "login")}!" />

		{if $has_smtp}
			<section id="forgot"><a href="{$url}password_recovery">{lang("lost_your_password", "login")}</a></section>
		{/if}
	</center>
</form>
