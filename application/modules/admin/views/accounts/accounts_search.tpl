<section class="box big" id="account_articles">
	<h2>
		<img src="{$url}application/themes/admin/images/icons/black16x16/ic_users.png"/>
		جستجوی اکانت
	</h2>

	<form style="margin-top:0px;" onSubmit="Accounts.searchAccount(); return false;">
		<input dir="rtl" align="right" type="text" name="search_accounts" {if $auto}value="{$data.username}" {/if}id="search_accounts" placeholder="جستجو بوسیله نام کاربری یا پست الکترونیکی" style="width:90%;margin-right:5px;"/>
		<input type="submit" value="جستجو" style="display:inline;padding:8px;" />
	</form>

	<div id="form_accounts_search">
		{if $auto}
			<script type="text/javascript">
				$(document).ready(function()
				{
					function checkIfLoaded()
					{
						if(typeof Accounts != "undefined")
						{
							Accounts.getAccount({$data.id});
						}
						else
						{
							setTimeout(checkIfLoaded, 50);
						}
					}

					checkIfLoaded();
				});
			</script>
		{else}
			<!-- results -->
		{/if}
	</div>
</section>