<section class="box big">
	<h2>{lang("edit", "changelog")}</h2>

	<form onSubmit="Changelog.save(this, {$changelog.change_id}); return false" id="submit_form">
		
		<label for="text">{lang("pm", "changelog")}</label>
		<textarea id="text" name="text" rows="4">{$changelog.changelog}</textarea>
	
		<input type="submit" value="{lang("save", "changelog")}" />
	</form>
</section>