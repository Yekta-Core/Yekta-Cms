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
<div style="padding: 8px 35px 8px 14px; margin-bottom: 20px; text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5); background-color: #FFBA75; border: 1px solid #FF006A; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px;">
<div style="text-align: right;"><span style="color: blue;"><span style="font-family: tahoma,geneva,sans-serif;"><span style="font-size: 12px;"></span></span></span></div>
<div style="text-align: right;"></div>
<div style="text-align: right;">{lang("alert", "levelup")}</div>
</center>


<section id="character_tools">
	<section id="select_character">
		<div class="online_realm_button">{lang("select_char", "teleport")}</div>
		
		{if $total}
			{foreach from=$characters item=realm}
           
			

				{foreach from=$realm.characters item=character}
                 {if $character.online==0}
                 {if $character.level < $config->item('server_max_core')}
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
                    {/if}
				{/foreach}
			{/foreach}
		{else}
			<center style="padding-top:10px;"><b>{lang("no_chars", "teleport")}</b></center>
		{/if}
	</section>
    
	<section id="select_tool">
    	<div class="online_realm_button">{lang("select_s", "levelup")}</div>
        
        <div class="select_tools">
        
            <!-- Character Rename -->
            <div class="select_tool">
                <div class="tool store_item">
                    <section class="tool_buttons">
                        <a href="javascript:void(0)" class="nice_button" onClick="CharacterTools.Purchase(this, 1, {$config->item('lvlup_change')})">
                            {lang("select_s", "levelup")}
                        </a>
                    </section>
    
                    <img class="item_icon" data-tip="Change your characters’ names" src="{$url}application/modules/character_tools/css/images/inv_misc_note_06.jpg" width="36" height="36" src="" align="absmiddle">
    
                    <a class="tool_name" data-tip="{lang("change_n", "levelup")}">{lang("upgrate", "levelup")}</a>                    <br />
                    {if $config->item('lvlup_change') > 0}{lang("hmmm", "levelup")} {$config->item('lvlup_change')} {lang("dp", "levelup")}{else}{lang("free", "levelup")}{/if}
                    <div class="clear"></div>
                </div>
            </div>
            
   
        </div>
		<div class="clear"></div>
        
		<div class="ucp_divider"></div>
        
	</section>

	<div class="clear"></div>
</section>