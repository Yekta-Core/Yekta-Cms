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
<section id="character_tools">
	<section id="select_character">
		<div class="online_realm_button">{lang("select_char", "teleport")}</div>
		
		{if $total}
			{foreach from=$characters item=realm}
              <div class="teleport_realm_divider"> نام ریلم: {$realm.realmName}</div>
                <div class="teleport_realm_divider">هیرو باید حتما آفلاین باشد</div>
				
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
        
            <!-- Character Rename -->
            <div class="select_tool">
                <div class="tool store_item">
                    <section class="tool_buttons">
                        <a href="javascript:void(0)" class="nice_button" onClick="CharacterTools.Purchase(this, 1, {$config->item('name_change_price')})">
                            انتخاب سرویس
                        </a>
                    </section>
    
                    <img class="item_icon" data-tip="Change your characters’ names" src="{$url}application/modules/character_tools/css/images/inv_misc_note_06.jpg" width="36" height="36" src="" align="absmiddle">
    
                    <a class="tool_name" data-tip="تغییر نام هیروی انتخاب شده">تغییر نام</a>
                    <br />
                    {if $config->item('name_change_price') > 0}هزینه : {$config->item('name_change_price')} امتیاز ویژه{else}Free of charge{/if}
                    <div class="clear"></div>
                </div>
            </div>
            
            <!-- Race Change -->
            <div class="select_tool">
                <div class="tool store_item">
                    <section class="tool_buttons">
                        <a href="javascript:void(0)" class="nice_button" onClick="CharacterTools.Purchase(this, 2, {$config->item('race_change_price')})">
                            انتخاب سرویس
                        </a>
                    </section>
    
                    <img class="item_icon" data-tip="Change a character’s race (within your current faction)" src="{$url}application/modules/character_tools/css/images/race_change.jpg" width="36" height="36" src="" align="absmiddle">
    
                    <a class="tool_name" data-tip="تغییر نژاد هیروی انتخاب شده">تغییر نژاد</a>
                    <br />
                    {if $config->item('race_change_price') > 0}هزینه : {$config->item('race_change_price')} امتیاز ویژه{else}Free of charge{/if}
                    <div class="clear"></div>
                </div>
            </div>
            
            <!-- Faction Change -->
            <div class="select_tool">
                <div class="tool store_item">
                    <section class="tool_buttons">
                        <a href="javascript:void(0)" class="nice_button" onClick="CharacterTools.Purchase(this, 3, {$config->item('faction_change_price')})">
                            انتخاب سرویس
                        </a>
                    </section>
    
                    <img class="item_icon" data-tip="Change a character’s faction (Horde to Alliance or Alliance to Horde)" src="{$url}application/modules/character_tools/css/images/faction_change.jpg" width="36" height="36" src="" align="absmiddle">
    
                    <a class="tool_name" data-tip="تغییر رسته هیرو ( Horde/Alliance )">تغییر رسته</a>
                    <br />
                    {if $config->item('faction_change_price') > 0}هزینه : {$config->item('faction_change_price')} امتیاز ویژه{else}Free of charge{/if}
                    <div class="clear"></div>
                </div>
            </div>
            
            <!-- Appearance Change -->
            <div class="select_tool">
                <div class="tool store_item">
                    <section class="tool_buttons">
                        <a href="javascript:void(0)" class="nice_button" onClick="CharacterTools.Purchase(this, 4, {$config->item('appearance_change_price')})">
                            انتخاب سرویس
                        </a>
                    </section>
    
                    <img class="item_icon" data-tip="Change your characters’ appearance (optional name change included)" src="{$url}application/modules/character_tools/css/images/achievement_character_human_female.jpg" width="36" height="36" src="" align="absmiddle">
    
                    <a class="tool_name" data-tip="تغییر ظاهر و نام هیرو">تغییر ظاهر</a>
                    <br />
                    {if $config->item('appearance_change_price') > 0}هزینه : {$config->item('appearance_change_price')} امتیاز ویژه{else}رایگان{/if}
                    <div class="clear"></div>
                </div>
            </div>
            
  <!-- revive -->
            <div class="select_tool">
                <div class="tool store_item">
                    <section class="tool_buttons">
                        <a href="javascript:void(0)" class="nice_button"
                         onClick="CharacterTools.Purchase(this, 6, {$config->item('revive_change_price')})">
                             انتخاب سرویس
                        </a>
                    </section>
    
                    <img class="item_icon" data-tip="Unstuck is Characters" src="{$url}application/modules/character_tools/css/images/Revive.jpg" width="36" height="36" src="" align="absmiddle">
    
                    <a class="tool_name" data-tip="Unstuck is Characters">زنده کردن هیرو</a>
                    <br />
                    {if $config->item('revive_change_price') > 0}هزینه : {$config->item('revive_change_price')}  امتیاز ویژه{else}رایگان{/if}
                    <div class="clear"></div>
                </div>
            </div>
             
             <div class="select_tool">
                <div class="tool store_item">
                    <section class="tool_buttons">
                        <a href="javascript:void(0)" class="nice_button"
                         onClick="CharacterTools.Purchase(this, 5, {$config->item('revive_change_price')})">
                             انتخاب سرویس
                        </a>
                    </section>
    
                    <img class="item_icon" data-tip="Unstuck is Characters" src="{$url}application/modules/character_tools/css/images/unstuck.jpg" width="36" height="36" src="" align="absmiddle">
    
                    <a class="tool_name" data-tip="Unstuck is Characters">نجات هیرو</a>
                    <br />
                    {if $config->item('unstuck_change_price') > 0}هزینه : {$config->item('unstuck_change_price')}  امتیاز ویژه{else}رایگان{/if}
                    <div class="clear"></div>
                </div>
            </div>

           

        </div>
		<div class="clear"></div>
        
		<div class="ucp_divider"></div>
        
	</section>

	<div class="clear"></div>
</section>