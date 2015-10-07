<p dir="rtl" align="right">لینک معرفی نامه شما  <input type="text" class="" value="{$ref_url}" onclick="this.focus(); this.select();" readonly/></p>
{if $accounts}
<table class="nice_table" style="width:100%;">
	<tr>
		<td>نام کاربری</td><td>وضعیت</td>
	</tr>
	<br>
	{foreach from=$accounts item=num}
	<tr>
	<td><a href="{$base_url}profile/{$num['id']}">{$num['username']}</a></td><td>
	{if $num['canClaim'] == 1}
		<a style="color:green; text-decoration:none;" href="{$base_url}recruitafriend/claim/{$num['id']}">همین الان دوستات رو معرفی کن</a></td>
	{elseif $num['canClaim'] == 0}
		<span style="color:red">فعال نیست</span></td>
	{elseif $num['canClaim'] == 2}
		<span style="color:red">معرفی نامه شما انجام شد</span></td>
	{elseif $num['canClaim'] == 3}
		<span style="color:red"></span></td>
	{elseif $num['canClaim'] == 4}
		<span style="color:red">خطا : لطفا با مدیران تماس بگیرید/span></td>
	{/if}
	</tr>
	{/foreach}
</table>
{else}
<br/>
<p dir="rtl" align="right">شما هیچ دوستی معرفی نکرده اید</p>
{/if}