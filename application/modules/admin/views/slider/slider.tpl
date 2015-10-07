{if hasPermission("editSlider")}
<section class="box big">
	<h2><img src="{$url}application/themes/admin/images/icons/black16x16/ic_settings.png"/> تنظیمات اسلاید</h2>

	<form onSubmit="Slider.saveSettings(this); return false">
		<label for="show_slider" dir="rtl" align="right">مکان دید</label>
		<select name="show_slider" id="show_slider">
			<option value="home" {if $slider && $slider_home}selected{/if}>فقط در صفحه خانه</option>
			<option value="always" {if $slider && !$slider_home}selected{/if}>همه جا</option>
			<option value="never" {if !$slider}selected{/if}>هیچ جا</option>
		</select>

		<label for="slider_interval" dir="rtl" align="right">فاصله عوض شدن (در ثانیه)</label>
		<input type="text" name="slider_interval" id="slider_interval" value="{$slider_interval/1000}"/>

		<label for="slider_style" dir="rtl" align="right">سبک حرکت اسلاید</label>
		<select name="slider_style" id="slider_style">
			<option value="" {if !$slider_style}selected{/if}>تصادفی (همه)</option>
			<option value="bars" {if $slider_style == "bars"}selected{/if}>میله ای</option>
			<option value="blinds" {if $slider_style == "blinds"}selected{/if}>پرده</option>
			<option value="blocks" {if $slider_style == "blocks"}selected{/if}>بلوکی</option>
			<option value="blocks2" {if $slider_style == "blocks2"}selected{/if}>بلوکی 2</option>
			<option value="concentric" {if $slider_style == "concentric"}selected{/if}>هم مرکز</option>
			<option value="dissolve" {if $slider_style == "dissolve"}selected{/if}>گداختن</option>
			<option value="slide" {if $slider_style == "slide"}selected{/if}>لغزش</option>
			<option value="warp" {if $slider_style == "warp"}selected{/if}>پیچ و تاب</option>
			<option value="zip" {if $slider_style == "zip"}selected{/if}>زیپ</option>
			<option value="bars3d" {if $slider_style == "bars3d"}selected{/if}>میله ای سه بعدی</option>
			<option value="blinds3d" {if $slider_style == "blinds3d"}selected{/if}>پرده 3 بعدی</option>
			<option value="cube" {if $slider_style == "cube"}selected{/if}>مکعب</option>
			<option value="tiles3d" {if $slider_style == "tiles3d"}selected{/if}>کاشی 3 بعدی</option>
			<option value="turn" {if $slider_style == "turn"}selected{/if}>گردشی</option>
		</select>

		<input type="submit" value="ذخیره تنظیمات" />
	</form>
</section>
{/if}

<section class="box big" id="main_slider">
	<h2>
		<img src="{$url}application/themes/admin/images/icons/black16x16/ic_picture.png"/>
		اسلاید ها (<div style="display:inline;" id="slides_count">{if !$slides}0{else}{count($slides)}{/if}</div>)
	</h2>

	{if hasPermission("addSlider")}
	<span>
		<a class="nice_button" href="javascript:void(0)" onClick="Slider.add()">ساخت اسلاید</a>
	</span>
	{/if}

	<ul id="slider_list">
		{if $slides}
		{foreach from=$slides item=slide}
			<li>
				<table width="100%">
					<tr>
						<td width="10%">
							{if hasPermission("editSlider")}
								<a href="javascript:void(0)" onClick="Slider.move('up', {$slide.id}, this)" data-tip="انتقال به بالا"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_up.png" /></a>
								<a href="javascript:void(0)" onClick="Slider.move('down', {$slide.id}, this)" data-tip="انتقال به پایین"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_down.png" /></a>
							{/if}
						</td>
						<td width="25%"><b>{$slide.image}</b></td>
						<td width="30%">{$slide.text}</td>
						<td width="20%"><a href="{$slide.link}" target="_blank">{$slide.link_short}</a></td>
						<td style="text-align:right;">
							{if hasPermission("editSlider")}
							<a href="{$url}admin/slider/edit/{$slide.id}" data-tip="ویرایش"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_edit.png" /></a>
							{/if}
							&nbsp;
							{if hasPermission("deleteSlider")}
							<a href="javascript:void(0)" onClick="Slider.remove({$slide.id}, this)" data-tip="حذف"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_minus.png" /></a>
							{/if}
						</td>
					</tr>
				</table>
			</li>
		{/foreach}
		{/if}
	</ul>
</section>

<section class="box big" id="add_slider" style="display:none;">
	<h2><a href='javascript:void(0)' onClick="Slider.add()" data-tip="بازگشت به اسلاید ها">اسلاید ها</a> &rarr; اسلاید جدید</h2>

	<form onSubmit="Slider.create(this); return false" id="submit_form">
		<label for="image" dir="rtl" align="right">آدرس تصویر</label>
		<input type="text" name="image" id="image" placeholder="http://"/>

		<label for="link" dir="rtl" align="right">لینک (اختیاری)</label>
		<input type="text" name="link" id="link" placeholder="http://"/>

		<label for="text" dir="rtl" align="right">متن زیر تصویر (اختیاری)</label>
		<input type="text" name="text" id="text"/>

		<input type="submit" value="ثبت اسلاید" />
	</form>
</section>