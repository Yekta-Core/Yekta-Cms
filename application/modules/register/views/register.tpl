{form_open('register', 'class="page_form"')}
	<table style="width:80%">
		<tr>
			<td><label for="register_username">{lang("username", "register")}</label></td>
			<td>
				<input type="text" name="register_username" id="register_username" value="{set_value('register_username')}" onChange="Validate.checkUsername()" />
				<span id="username_error">{$username_error}</span>
			</td>
		</tr>
		<tr>
			<td><label for="register_password">{lang("password", "register")}</label></td>
			<td>
				<input type="password" name="register_password" id="register_password" value="{set_value('register_password')}" onChange="Validate.checkPassword()" />
				<span id="password_error">{$password_error}</span>
			</td>
		</tr>
		<tr>
			<td><label for="register_password_confirm">{lang("confirm", "register")}</label></td>
			<td>
				<input type="password" name="register_password_confirm" id="register_password_confirm" value="{set_value('register_password_confirm')}" onChange="Validate.checkPasswordConfirm()" />
				<span id="password_confirm_error">{$password_confirm_error}</span>
			</td>
		</tr>
		<tr>
			<td><label for="register_email">{lang("email", "register")}</label></td>
			<td>
				<input type="email" name="register_email" id="register_email" value="{set_value('register_email')}" onChange="Validate.checkEmail()" />
				<span id="email_error">{$email_error}</span>
			</td>
		</tr>

		{if $tell_mobile}
			<tr>
				<td><label for="register_tell">{lang("tell_number", "register")}</label></td>
				<td>
					<input type="text" name="register_tell" id="register_tell" maxlength="11" value="{set_value('register_tell')}" onChange="Validate.checkTell()" onkeydown="return !isNaN(event.which || event.keyCode)" />
					<span id="tell_error">{$tell_error}</span>
				</td>
			</tr>
		{/if}

		{if $birthday}
			<tr>
				<td><label for="register_birthdayday">{lang("birthday", "register")}</label></td>
				<td>
					<select name="register_birthdayday" id="register_birthdayday">
						{foreach from=$days item=day}
							<option value="{$day}" {set_select('register_birthdayday', $day)}>{$day}</option>
						{/foreach}
					</select>

					<select name="register_birthdaymonth" id="register_birthdaymonth">
						{foreach from=$months key=month item=name}
							<option value="{$month}" {set_select('register_birthdaymonth', $month)}>{lang("cal_{$name}", "calendar_lang")}</option>
						{/foreach}
					</select>

					<select name="register_birthdayyear" id="register_birthdayyear">
						{foreach from=$years item=year}
							<option value="{$year}" {set_select('register_birthdayyear', $year)}>{$year}</option>
						{/foreach}
					</select>

					<!-- <span id="birthdayyear_error">{$birthdayyear_error}</span>
					<span id="birthdaymonth_error">{$birthdaymonth_error}</span>
					<span id="birthdayday_error">{$birthdayday_error}</span> -->
				</td>
			</tr>
		{/if}

		{if $location}
			<tr>
				<td><label for="register_location">{lang("location", "register")}</label></td>
				<td>
					<select name="register_location" class="country-select" id="register_location">
						<option disabled>{lang("msg_select_option", "register")}</option>
						{foreach from=$countries key=country item=data}
							<option value="{$country}" {set_select('register_location', $country)}>{$data.name}</option>
						{/foreach}
					</select>
				</td>
			</tr>
		{/if}

		{if $secret_question}
			<tr>
				<td><label for="register_secret_question">{lang("secret_question", "register")}</label></td>
				<td>
					<select name="register_secret_question" id="register_secret_question">
						<option disabled>{lang("msg_select_option", "register")}</option>
						{foreach from=$secret_questions item=question}
							<option value="{$question}" {set_select('register_secret_question', $question)}>{lang($question, "register")}</option>
						{/foreach}
					</select>
				</td>
			</tr>
			<tr>
				<td><label for="register_secret_answer">{lang("secret_answer", "register")}</label></td>
				<td>
					<input type="text" name="register_secret_answer" id="register_secret_answer" value="{set_value('register_secret_answer')}" onChange="Validate.checkQuest()" />
					<span id="answer_error">{$secret_answer_error}</span>
				</td>
			</tr>
		{/if}

		<tr>
			<td><label for="register_expansion">{lang("expansion", "register")}</label></td>
			<td>
				<select id="register_expansion" name="register_expansion">
					{foreach from=$expansions key=id item=expansion}
						<option value="{$id}" {set_select('register_expansion', $id)}>{$expansion}</option>
					{/foreach}
				</select>
			</td>
		</tr>

		{if $use_captcha}
			<tr>
				<td><label for="captcha"><img src="{$url}application/modules/register/controllers/getCaptcha.php?{uniqid()}" /></label></td>
				<td>
					<input type="text" name="register_captcha" id="register_captcha" />
					<span id="captcha_error">{$captcha_error}</span>
				</td>
			</tr>
		{/if}
	</table>

	<center style="margin-bottom:10px;">
		<input type="submit" name="login_submit" value="{lang("submit", "register")}" />
	</center>
{form_close()}