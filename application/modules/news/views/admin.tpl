{TinyMCE()}
<section class="box big" id="news_articles">
	<h2>
		<img src="{$url}application/themes/admin/images/icons/black16x16/ic_text_document.png"/>
		اخبار و اطلاعیه (<div style="display:inline;" id="article_count">{if !$news}0{else}{count($news)}{/if}</div>)
	</h2>

	{if hasPermission("canAddArticle")}
		<span>
			<a class="nice_button" href="javascript:void(0)" onClick="News.show()">ایجاد خبر جدید</a>
		</span>
	{/if}

	<ul id="news_list">
		{if $news}
		{foreach from=$news item=article}
			<li>
				<table width="100%">
					<tr>
						<td style="font-family:tahoma,geneva,sans-serif;font-size:11px" width="40%"><b>{$article.headline}</b></td>
						<td style="font-family:tahoma,geneva,sans-serif;font-size:11px" width="15%">{$article.nickname}</td>
						<td style="font-family:tahoma,geneva,sans-serif;font-size:11px" width="20%">{date("Y/m/d", $article.timestamp)}</td>
						<td style="font-family:tahoma,geneva,sans-serif;font-size:11px" width="15%"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_chats.png" align="absbottom"/> &nbsp;{if $article.comments != -1}{$article.comments}{else}خاموش{/if}</td>
						<td style="text-align:right;">
							{if hasPermission("canEditArticle")}
							<a href="{$url}news/admin/edit/{$article.id}" data-tip="ویرایش"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_edit.png" /></a>&nbsp;
							{/if}

							{if hasPermission("canRemoveArticle")}
							<a href="javascript:void(0)" onClick="News.remove({$article.id}, this)" data-tip="حذف"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_minus.png" /></a>
							{/if}
						</td>
					</tr>
				</table>
			</li>
		{/foreach}
		{/if}
	</ul>
</section>

<div id="add_news" style="display:none;">
	<section class="box big">
		<h2><a href='javascript:void(0)' onClick="News.show()" data-tip="Return to articles">اخبار و اطلاعیه ها</a> &rarr; ایجاد خبر جدید</h2>

		<form onSubmit="News.send(); return false">
			<label for="headline">عنوان</label>
			<input type="hidden" id="headline" />
			
			<label for="news_content">
				محتوی
			</label>
		</form>
			<div style="padding:10px;">
				<textarea name="news_content" class="tinymce" id="news_content" cols="30" rows="10"></textarea>
			</div>
		<form onSubmit="News.send(); return false">
			<label>تنظیمات خبر</label>

			<input type="checkbox" id="avatar" checked="yes" value="1"/>
			<label for="avatar" class="inline_label">نمایش آواتار نویسنده</label>

			<input type="checkbox" id="comments" checked="yes" value="1"/>
			<label for="comments" class="inline_label">نظر دهی فعال باشد</label>

			<input type="submit" value="ارسال خبر" />
		</form>
	</section>
</div>

<script>
	require([Config.URL + "application/themes/admin/js/mli.js"], function()
	{
		new MultiLanguageInput($("#headline"));
	});
</script>