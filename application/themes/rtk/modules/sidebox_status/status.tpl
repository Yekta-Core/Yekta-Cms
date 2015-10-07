{foreach from=$realms item=realm}
	<div class="realm">
		<div class="realm_online">
			Status:
			<font color="#93bb79">
				{if $realm->isOnline()}
					Online {$realm->getOnline()} / {$realm->getCap()}
				{else}
					<font color="red">
						Offline
					</font>
				{/if}
			</font>
		</div>
		<img src="{$image_path}wotlk.png" /> {$realm->getName()}
		
		<div class="realm_bar">
			{if $realm->isOnline()}
				<div class="realm_bar_fill" style="width:{$realm->getPercentage()}%"></div>
			{/if}
		</div>
		
		<p style="
					font: 11px Tahoma;
					color: #687570;
					margin-top: 20px;
					text-align: center;
					text-shadow: 0px 0px 1px #000000;"
		>
			Instant 80 private realm with alot of custom things.
		</p>
		
		<!--
			Other values, for designers:

			$realm->getOnline("horde")
			$realm->getPercentage("horde")

			$realm->getOnline("alliance")
			$realm->getPercentage("alliance")

		-->

	</div>

	<div class="side_divider"></div>
{/foreach}
<div id="realmlist">set realmlist {$realmlist}</div>