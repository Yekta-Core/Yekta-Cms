<div id="donate">
		<div class="ucp_divider"></div>
		<section id="paypal_area" style="text-align:center" dir="rtl">
		
		<img src="{$url}application/modules/donate/img/jahanpay.png" /></td>
			<form method="post" action="{$url}donate/request" class="page_form">
				<input type="hidden" name="item_name" value="{lang("donation_for", "donate")} {$server_name}" />
				<input type="hidden" name="custom" value="{$user_id}" />
				{foreach from=$donate_jahanpay.values item=value key=key}
					<label for="option_{$key}">
						<input type="radio" name="amount" value="{$key}" id="option_{$key}" {if reset($donate_jahanpay.values) == $value}checked="checked"{/if}/> <b>{$value} {lang("dp", "donate")}</b> {lang("for", "donate")} <b>{$key}{$currency_sign}</b>
					</label>
				{/foreach}

				<input type='submit' value='پرداخت', "donate")}' />
				<div class="clear"></div>
			</form>
		</section>
</div>