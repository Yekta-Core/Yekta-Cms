<section class="box big">
	<h2>ویرایش اسلاید</h2>

	<form onSubmit="Slider.save(this, {$slide.id}); return false" id="submit_form">
		<label for="image" dir="rtl" align="right">آدرس تصویر</label>
		<input type="text" name="image" id="image" placeholder="http://" value="{preg_replace('/{path}/', '', $slide.image)}"/>

		<label for="link" dir="rtl" align="right">لینک (اختیاری)</label>
		<input type="text" name="link" id="link" placeholder="http://"value="{$slide.link}"/>

		<label for="text" dir="rtl" align="right">متن زیر تصویر (اختیاری)</label>
		<input type="text" name="text" id="text"value="{$slide.text}"/>

		<input type="submit" value="ذخیره اسلاید" />
	</form>
</section>