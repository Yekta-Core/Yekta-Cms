<section class="box big">
	<h2>ویرایش سایت رتبه بندی</h2>

	<form onSubmit="Topsites.save(this, {$topsite.id}); return false" id="submit_form">
		<label for="vote_sitename">نام سایت</label>
		<input type="text" name="vote_sitename" id="vote_sitename" value="{$topsite.vote_sitename}"/>

		<label for="vote_url">آدرس مخصوص شما برای ورود به سایت</label>
		<input type="text" name="vote_url" id="vote_url" placeholder="http://" onChange="Topsites.findImage(this)" value="{$topsite.vote_url}"/>

		<label for="vote_image">تصویر کوچکی از لوگو سایت رتبه بندی</label>
		<input type="text" name="vote_image" id="vote_image" placeholder="(optional)" value="{$topsite.vote_image}"/>

		<div id="vote_image_preview" {if ! $topsite.vote_image}style="display:none"{/if}>
			<small>پیشنمایش:</small><br />
			<img src="{$topsite.vote_image}" alt="درحال بارگذاری" />
		</div>
		
		<label for="hour_interval">مدت زمان گرفتن امتیاز به ساعت</label>
		<input type="text" name="hour_interval" id="hour_interval" value="{$topsite.hour_interval}"/>

		<label for="points_per_vote">تعداد امتیاز</label>
		<input type="text" name="points_per_vote" id="points_per_vote" value="{$topsite.points_per_vote}"/>

		<label for="callback_enabled" data-tip="فعال کردن پست بک (تنها برخی از جدیدترین سایت های رتبه بندی از این امکان پشتیبانی میکنند)">فعال کردن بررسی امتیاز (<a>?</a>)</label>
			<div id="callback_form">
			<div class="not-supported">This topsite is not supported.</div>
			
			<div class="form" style="display:none">
				<select id="callback_enabled" name="callback_enabled" onChange="Topsites.updateLinkFormat()">
					<option value="0" selected>خیر</option>
					<option value="1">بله</option>
				</select>
				
				<div class="dropdown help">
					<h3>چگونگی تنظیم برای تایید امتیاز</h3>
					<div>
						
					</div>
				</div>
			</div>
		</div>
		
		<input type="submit" value="ثبت سایت" />
	</form>
</section>