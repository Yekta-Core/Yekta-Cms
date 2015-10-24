<meta http-equiv="refresh" content="40">
<div align="center">
{form_open('chatbox')}
<input dir="rtl" type="text" name="text" placeholder="{lang("pm", "chatbox")}" style="width:535px; ">
<input type="submit" name="submit" value="{lang("send", "chatbox")}"><br />
</form>
<br />

<div style="text-align:left; height:70px;  width:600px;    word-wrap: break-word; border:1px solid #080e14;  overflow:auto;">

{if $get}
{foreach from=$get  item=row}
[{$row['tarikh']}]  <span style="font-weight:bold;">{$row['esme_user']}</span>: {$row['payam']}<br />
{/foreach}
{/if}
</div>
</div>	
