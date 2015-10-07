<script type="text/javascript">
	$(document).ready(function()
	{
		function initializeCharacterTools()
		{
			if(typeof CharacterTools != "undefined")
			{
				CharacterTools.User.initialize({$dp});
			}
			else
			{
				setTimeout(initializeCharacterTools, 50);
			}
		}

		initializeCharacterTools();
	});
</script>
<center>
<div style="padding: 8px 35px 8px 14px; margin-bottom: 20px; text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5); background-color: #ffd8e8; border: 1px solid #FF006A; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px;">
<div style="text-align: right;"><span style="color: green;"><span style="font-family: tahoma,geneva,sans-serif;"><span style="font-size: 12px;">توجه :</span></span></span></div>
<div style="text-align: right;"></div>
<div style="text-align: right;"> زمان بازی بازیکن هر {$config->item('convert_min_time')/3600} ساعت محاسبه خواهد شد  {if $config->item('cta_price_currency') == "dp"} {$config->item('convert_reward_amount')} امتیاز ویژه{elseif $config->item('cta_price_currency') == "vp"}  {$config->item('convert_reward_amount')} امتیاز رایگان   {elseif $config->item('cta_price_currency') == "op"}  {$config->item('convert_reward_amount')} امتیاز آنلاین{/if} برای شما ارسال خواهد شد</div>
</center>
<section id="character_tools">
	<section id="select_character">
		<div class="online_realm_button">{lang("select_char", "teleport")}</div>
		
		{if $total}
			{foreach from=$characters item=realm}

<center>
<div style="padding: 8px 35px 8px 14px; margin-bottom: 20px; text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5); background-color: #FFBA75; border: 1px solid #FF006A; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px;">
<div style="text-align: right;"><span style="color: blue;"><span style="font-family: tahoma,geneva,sans-serif;"><span style="font-size: 12px;">ریلم : {$realm.realmName}</span></span></span></div>
<div style="text-align: right;"></div>
<div style="text-align: right;">فقط هیرو های آفلاین نمایش خواهد داد</div>
</center>

				
				{foreach from=$realm.characters item=character}
                 {if $character.online==0}

					<div class="select_character">
						<div class="character store_item">
							<section class="character_buttons">
								<a href="javascript:void(0)" class="nice_button" onClick="CharacterTools.selectCharacter(this, {$realm.realmId}, {$character.guid}, '{$character.name}')">
									{lang("select", "teleport")}
								</a>
							</section>
			
							<img class="item_icon" width="36" height="36" src="{$url}application/images/avatars/{$character.avatar}.gif" align="absmiddle" data-tip="<img src='{$url}application/images/stats/{$character.class}.gif' align='absbottom'/> {$character.name} (Lv{$character.level})">
			
							<a class="character_name" data-tip="<img src='{$url}application/images/stats/{$character.class}.gif' align='absbottom'/> {$character.name} (Lv{$character.level})">{$character.name}</a>
							<br />Level {$character.level}

							<div class="clear"></div>
						</div>
					</div>
                    {/if}
				{/foreach}
			{/foreach}
		{else}
			<center style="padding-top:10px;"><b>{lang("no_chars", "teleport")}</b></center>
		{/if}
	</section>
    
	<section id="select_tool">
    	<div class="online_realm_button">انتخاب سرویس</div>
        
        <div class="select_tools">
        
            <!-- Convert Times Character  -->
            <div class="select_tool">
                <div class="tool store_item">
                    <section class="tool_buttons">
                        <a href="javascript:void(0)" class="nice_button" onClick="CharacterTools.Purchase(this, 1, 0)">
                            انتخاب سرویس
                        </a>
                    </section>
    
                    <img class="item_icon" data-tip="تبدیل مدت زمان آنلاین بودن به پوینت" src="{$url}application/modules/playtime/css/images/inv_misc_note_06.jpg" width="36" height="36" src="" align="absmiddle">
    
                    
                    
                    <br />
                    

{if $config->item('cta_price_currency') == "dp"} {$config->item('convert_reward_amount')} امتیاز ویژه{elseif $config->item('cta_price_currency') == "vp"}  {$config->item('convert_reward_amount')} امتیاز رایگان {elseif $config->item('cta_price_currency') == "op"}  {$config->item('convert_reward_amount')} امتیاز آنلاین {/if}

                    <div class="clear"></div>
                </div>
            </div>
            
      
        </div>
		<div class="clear"></div>
        
		<div class="ucp_divider"></div>
        
	</section>

	<div class="clear"></div>
</section>