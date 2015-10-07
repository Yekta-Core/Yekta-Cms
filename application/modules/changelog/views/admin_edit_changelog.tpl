<section class="box big">
	<h2>ویرایش</h2>

	<form onSubmit="Changelog.save(this, {$changelog.change_id}); return false" id="submit_form">
		
		<label for="text">پیام</label>
		<textarea id="text" name="text" rows="4">{$changelog.changelog}</textarea>
	
		<input type="submit" value="ذخیره" />
	</form>
</section>