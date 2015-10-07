{if hasPermission("toggleMessage")}
<section class="box big">
	<h2>پیغام</h2>
	<span dir="rtl" align="right">
		این قسمت برای خاموش کردن سایت تا زمانی که شما بخواهید میباشد
	</span>

	<form onSubmit="Settings.submitMessage(this);return false">
		
		<label for="message_enabled" dir="rtl" align="right">وضعیت روشن/خاموش بودن سایت</label>
		<select id="message_enabled" name="message_enabled">
			<option value="true" {if $message_enabled}selected{/if}>خاموش شدن سایت</div>
			<option value="false" {if !$message_enabled}selected{/if}>روشن شدن سایت</div>
		</select>

		<label for="message_headline" dir="rtl" align="right">عنوان :</label>
		<input type="text" id="message_headline" name="message_headline" value="{$message_headline}" onKeyUp="Settings.liveUpdate(this, 'headline')"/>
		
		<label for="message_headline_size" dir="rtl" align="right">اندازه عنوان : (پیشفرض 56)</label>
		<input type="text" id="message_headline_size" name="message_headline_size" value="{$message_headline_size}" onKeyUp="Settings.liveUpdate(this, 'headline_size')"/>

		<label for="message_text" dir="rtl" align="right">پیغام :</label>
		<textarea id="message_text" name="message_text" rows="10" onKeyUp="Settings.liveUpdate(this, 'text')">{$message_text}</textarea>

		<input type="submit" value="ذخیره تنظیمات" />
	</form>
</section>
{/if}

<section class="box big">
	<h2>پیش نمایش</h2>
	<span>
		<span class="announcement">
		<h3 id="live_headline" style="font-size:{$message_headline_size}px;">{$message_headline}</h3>
		<p id="live_text">{$message_text}</p>
		</span>
	</span>
</section>