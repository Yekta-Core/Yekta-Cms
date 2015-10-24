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
              <div class="teleport_realm_divider">{lang("realm_name", "character_tools")} {$realm.realmName}</div>
                <div class="teleport_realm_divider">{lang("teleport_realm_divider", "character_tools")}</div>
				
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
    	<div class="online_realm_button">{lang("select_tool", "character_tools")}</div>
        
        <div class="select_tools">
        
            <!-- Character Rename -->
            <div class="select_tool">
                <div class="tool store_item">
                    <section class="tool_buttons">
                        <a href="javascript:void(0)" class="nice_button" onClick="CharacterTools.Purchase(this, 1, {$config->item('name_change_price')})">
                            {lang("select_tool", "character_tools")}
                        </a>
                    </section>
    
                    <img class="item_icon" data-tip="Change your characters’ names" src="{$url}application/modules/character_tools/css/images/inv_misc_note_06.jpg" width="36" height="36" src="" align="absmiddle">
    
                    <a class="tool_name" data-tip="{lang("c_n_h_s", "character_tools")}">{lang("change_name", "character_tools")}</a>
                    <br />
                    {if $config->item('name_change_price') > 0}{lang("price", "character_tools")} {$config->item('name_change_price')} {lang("vp", "character_tools")}{else}{lang("free", "character_tools")}{/if}
                    <div class="clear"></div>
                </div>
            </div>
            
            <!-- Race Change -->
            <div class="select_tool">
                <div class="tool store_item">
                    <section class="tool_buttons">
                        <a href="javascript:void(0)" class="nice_button" onClick="CharacterTools.Purchase(this, 2, {$config->item('race_change_price')})">
                           {lang("select_tool", "character_tools")}
                        </a>
                    </section>
    
                    <img class="item_icon" data-tip="Change a character’s race (within your current faction)" src="{$url}application/modules/character_tools/css/images/race_change.jpg" width="36" height="36" src="" align="absmiddle">
    
                    <a class="tool_name" data-tip="{lang("race_t", "character_tools")}">{lang("race", "character_tools")}</a>
                    <br />
                    {if $config->item('name_change_price') > 0}{lang("price", "character_tools")} {$config->item('name_change_price')} {lang("vp", "character_tools")}{else}{lang("free", "character_tools")}{/if}
                    <div class="clear"></div>
                </div>
            </div>
            
            <!-- Faction Change -->
            <div class="select_tool">
                <div class="tool store_item">
                    <section class="tool_buttons">
                        <a href="javascript:void(0)" class="nice_button" onClick="CharacterTools.Purchase(this, 3, {$config->item('faction_change_price')})">
                           {lang("select_tool", "character_tools")}
                        </a>
                    </section>
    
                    <img class="item_icon" data-tip="Change a character’s faction (Horde to Alliance or Alliance to Horde)" src="{$url}application/modules/character_tools/css/images/faction_change.jpg" width="36" height="36" src="" align="absmiddle">
    
                    <a class="tool_name" data-tip="{lang("faction_t", "character_tools")}">{lang("faction", "character_tools")}</a>
                    <br />
                    {if $config->item('name_change_price') > 0}{lang("price", "character_tools")} {$config->item('name_change_price')} {lang("vp", "character_tools")}{else}{lang("free", "character_tools")}{/if}
                    <div class="clear"></div>
                </div>
            </div>
            
            <!-- Appearance Change -->
            <div class="select_tool">
                <div class="tool store_item">
                    <section class="tool_buttons">
                        <a href="javascript:void(0)" class="nice_button" onClick="CharacterTools.Purchase(this, 4, {$config->item('appearance_change_price')})">
                            {lang("select_tool", "character_tools")}
                        </a>
                    </section>
    
                    <img class="item_icon" data-tip="Change your characters’ appearance (optional name change included)" src="{$url}application/modules/character_tools/css/images/achievement_character_human_female.jpg" width="36" height="36" src="" align="absmiddle">
    
                    <a class="tool_name" data-tip="{lang("appearance_t", "character_tools")}">{lang("appearance", "character_tools")}</a>
                    <br />
                    {if $config->item('name_change_price') > 0}{lang("price", "character_tools")} {$config->item('name_change_price')} {lang("vp", "character_tools")}{else}{lang("free", "character_tools")}{/if}
                    <div class="clear"></div>
                </div>
            </div>
            
  <!-- revive -->
            <div class="select_tool">
                <div class="tool store_item">
                    <section class="tool_buttons">
                        <a href="javascript:void(0)" class="nice_button"
                         onClick="CharacterTools.Purchase(this, 6, {$config->item('revive_change_price')})">
                             {lang("select_tool", "character_tools")}
                        </a>
                    </section>
    
                    <img class="item_icon" data-tip="Unstuck is Characters" src="{$url}application/modules/character_tools/css/images/Revive.jpg" width="36" height="36" src="" align="absmiddle">
    
                    <a class="tool_name" data-tip="Unstuck is Characters">{lang("revive", "character_tools")}</a>
                    <br />
                    {if $config->item('name_change_price') > 0}{lang("price", "character_tools")} {$config->item('name_change_price')} {lang("vp", "character_tools")}{else}{lang("free", "character_tools")}{/if}
                    <div class="clear"></div>
                </div>
            </div>
             
             <div class="select_tool">
                <div class="tool store_item">
                    <section class="tool_buttons">
                        <a href="javascript:void(0)" class="nice_button"
                         onClick="CharacterTools.Purchase(this, 5, {$config->item('revive_change_price')})">
                             {lang("select_tool", "character_tools")}
                        </a>
                    </section>
    
                    <img class="item_icon" data-tip="Unstuck is Characters" src="{$url}application/modules/character_tools/css/images/unstuck.jpg" width="36" height="36" src="" align="absmiddle">
    
                    <a class="tool_name" data-tip="Unstuck is Characters">{lang("unstuck", "character_tools")}</a>
                    <br />
                    {if $config->item('name_change_price') > 0}{lang("price", "character_tools")} {$config->item('name_change_price')} {lang("vp", "character_tools")}{else}{lang("free", "character_tools")}{/if}
                    <div class="clear"></div>
                </div>
            </div>

           

        </div>
		<div class="clear"></div>
        
		<div class="ucp_divider"></div>
        
	</section>

	<div class="clear"></div>
</section>