<div class="divider"></div>

<div class="comments_area" {$comments_id}>
	{$comments}
</div>

{if hasPermission("canAddComment")}
<form {$form}>
	{if $online}
		<textarea spellcheck="false" {$field_id} placeholder="{lang("type_comment", "news")}" onkeyup="UI.limitCharacters(this, 'characters_remaining_{$id}')" maxlength="255"></textarea>
		<p style="text-align:left;">emoticon codes:</p>
		<table>
			<tr>
				<td><img src="{$url}application/images/emoticons/emoticon_evilgrin.png" width="16" height="16" alt="evilgrin" title="evilgrin" style="border:0;" /></td>
				<td><img src="{$url}application/images/emoticons/emoticon_grin.png" width="16" height="16" alt="grin" title="grin" style="border:0;" /></td>
				<td><img src="{$url}application/images/emoticons/emoticon_happy.png" width="16" height="16" alt="happy" title="happy" style="border:0;" /></td>
				<td><img src="{$url}application/images/emoticons/emoticon_smile.png" width="16" height="16" alt="smile" title="smile" style="border:0;" /></td>
				<td><img src="{$url}application/images/emoticons/emoticon_surprised.png" width="16" height="16" alt="surprised" title="surprised" style="border:0;" /></td>
				<td><img src="{$url}application/images/emoticons/emoticon_tongue.png" width="16" height="16" alt="tongue" title="tongue" style="border:0;" /></td>
				<td><img src="{$url}application/images/emoticons/emoticon_unhappy.png" width="16" height="16" alt="unhappy" title="unhappy" style="border:0;" /></td>
				<td><img src="{$url}application/images/emoticons/emoticon_waii.png" width="16" height="16" alt="waii" title="waii" style="border:0;" /></td>
				<td><img src="{$url}application/images/emoticons/emoticon_wink.png" width="16" height="16" alt="wink" title="wink" style="border:0;" /></td>
			</tr>
			<tr>
				<td><p style="text-align:center;">xD</p></td>
				<td><p style="text-align:center;">:-)</p></td>
				<td><p style="text-align:center;">:D</p></td>
				<td><p style="text-align:center;">:)</p></td>
				<td><p style="text-align:center;">:O</p></td>
				<td><p style="text-align:center;">:P</p></td>
				<td><p style="text-align:center;">:(</p></td>
				<td><p style="text-align:center;">:3</p></td>
				<td><p style="text-align:center;">;)</p></td>
			</tr>
		</table>
		<div class="characters_remaining"><span id="characters_remaining_{$id}">0 / 255</span> {lang("characters", "news")}</div>
		<input type="submit" value="{lang("submit", "news")}" id="comment_button_{$id}" />
	{else}
		<textarea disabled placeholder="{lang("log_in", "news")}"></textarea>
		<input type="submit" value="{lang("submit", "news")}"/>
	{/if}
</form>
{/if}

<div class="clear"></div>