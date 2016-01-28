<section id="ucp_top">
		<img src="{$url}application/images/avatars/profile.png"/>

	<section id="ucp_info">
		

		<aside>
			<table width="100%">
				<tr data-tip="قابل دریافت میباشد Vote مجموعه امتیاز شما, امتیاز گیری رایگان بوده و از طریق سیستم">
					<td width="10%"><img src="{$url}application/images/icons/lightning.png" /></td>
					<td width="40%">{lang("voting_points", "ucp")}</td>
					<td width="50%">{$vp} پوینت</td>
				</tr>
				<tr data-tip="اعتباز, موجودی تومانی شما میباشد که به شما این امکان را میدهد تا از امکانات پولی سایت استفاده کنید">
					<td width="10%"><img src="{$url}application/images/icons/coins.png" /></td>
					<td width="40%"><span style="color:#4CFF00">{lang("donation_points", "ucp")}</span></td>
					<td width="50%"><span style="color:#4CFF00">{$dp} تومان</span></td>
				</tr>
				<tr>
					<td width="10%"><img src="{$url}application/images/icons/shield.png" /></td>
					<td width="40%">{lang("account_status", "ucp")}</td>
					<td width="50%">{$status}</td>
				</tr>
				<tr>
					<td width="10%"><img src="{$url}application/images/icons/date.png" /></td>
					<td width="40%">{lang("member_since", "ucp")}</td>
					<td width="50%">{$register_date}</td>
				</tr>
			</table>
		</aside>
		<aside>
			<table width="100%">
				<tr>
					<td width="10%"><img src="{$url}application/images/icons/user.png" /></td>
					<td width="40%">{lang("nickname", "ucp")} :</td>
					<td width="50%">
				
					{$username}
					</td>
				</tr>
				<tr>
					<td width="10%"><img src="{$url}application/images/icons/world.png" /></td>
					<td width="40%">  شماره ملی :</td>
					<td width="50%">{$codemeli}
			
					</td>
				</tr>
				<tr>
					<td width="10%"><img src="{$url}application/images/icons/telephone.png" /></td>
					<td width="40%"> شماره همراه :</td>
					<td width="50%">{$location}
			
					</td>
				</tr>
				
				<tr>
					<td width="10%"><img src="{$url}application/images/icons/plugin.png" /></td>
					<td width="40%">نوع اکانت :</td>
					<td width="50%">
					<a href="{$url}ucp/expansion" data-tip="تغییر نوع اکانت" >{$expansion}</a>
					</td>
				</tr>
				<tr>
					<td width="10%"><img src="{$url}application/images/icons/award_star_bronze_1.png" /></td>
					<td width="40%">{lang("account_rank", "ucp")} :</td>
					<td width="50%">{foreach from=$groups item=group} <span {if $group.color}style="color:{$group.color}"{/if}>{$group.name}</span> {/foreach}</td>
				</tr>
                
			</table>
			
		</aside>
	</section>


	<div class="clear"></div>	
</section>

<div class="ucp_divider"></div>

<section id="ucp_buttons">
	{if hasPermission('view', "vote") && $config['vote']}
		<a href="{$url}{$config.vote}" style="background-image:url({$url}application/modules/ucp/images/vote_panel.jpg)"></a>
	{/if}

	{if hasPermission('view', "donate") && $config['donate']}
	<a href="{$url}{$config.donate}" style="background-image:url({$url}application/modules/ucp/images/donate_panel.jpg)"></a>
	{/if}

	{if hasPermission('view', "store") && $config['store']}
		<a href="{$url}{$config.store}" style="background-image:url({$url}application/modules/ucp/images/item_store.jpg)"></a>
	{/if}

	{if hasPermission('canUpdateAccountSettings', 'ucp') && $config['settings']}
		<a href="{$url}{$config.settings}" style="background-image:url({$url}application/modules/ucp/images/account_settings.jpg)"></a>
	{/if}

	{if hasPermission('canChangeExpansion', "ucp") && $config['expansion']}
        <a href="{$url}{$config.expansion}" style="background-image:url({$url}application/modules/ucp/images/change_expansion.jpg)"></a>
	{/if}

	{if hasPermission('view', "teleport") && $config['teleport']}
		<a href="{$url}{$config.teleport}" style="background-image:url({$url}application/modules/ucp/images/teleport_hub.jpg)"></a>
	{/if}

	{if hasPermission('view', "gm") && $config['gm']}
		<a href="{$url}{$config.gm}" style="background-image:url({$url}application/modules/ucp/images/gm_panel.jpg)"></a>
	{/if}

	{if hasPermission('view', "admin") && $config['admin']}
		<a href="{$url}{$config.admin}" style="background-image:url({$url}application/modules/ucp/images/admin_panel.jpg)"></a>
	{/if}
	
	<div class="clear"></div>
</section>

{$characters}