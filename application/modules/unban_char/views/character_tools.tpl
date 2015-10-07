
<head>
<style type="text/css">
.style1 {
    color: #FF0000;
}
.style2 {
    color: #00FF00;
}
.style4 {
    color: #FFFF00;
    font-size: medium;
}
.style5 {
    text-align: center;
}
.style6 {
    color: #FFFFFF;
}
.style7 {
    color: #FFFF00;
}
</style>
</head>

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
<section id="character_tools" dir="dir">
    <section id="select_character">
        <div class="online_realm_button"> انتخاب هیرو</div>
        
        {if $total}
            {foreach from=$characters item=realm}
               
                   
                {foreach from=$realm.characters item=character}
                  
                  {foreach from=$char_unban item=ban}

                  {if {$ban['guid']} ==$character.guid}

                    <div class="select_character">
                 
                        <div class="character store_item" dir="rtl">
                                

                            <div class="style5">
                                

                           {if {$ban['bandate']} <= {$ban['unbandate']}}
                         
                          
                            <section class="character_buttons">
                           
                                <a href="javascript:void(0)" class="nice_button" onClick="CharacterTools.selectCharacter(this, {$realm.realmId}, {$character.guid}, '{$character.name}')">

                                   select
                                </a>
                               
                            </section>
                             {/if}    

                            <img class="item_icon" width="36" height="36" src="{$url}application/images/avatars/{$character.avatar}.gif" align="absmiddle" data-tip="<img src='{$url}application/images/stats/{$character.class}.gif' align='absbottom'/> {$character.name} (Lv{$character.level})">
            
                            <a class="character_name" data-tip="<img src='{$url}application/images/stats/{$character.class}.gif' align='absbottom'/> {$character.name} (Lv{$character.level})  
                            

                            <br />Ban Date : {date("Y.m.d H:m:s",{$ban['bandate']})}
                            <br />UnBan date : {date("Y.m.d H:m:s",{$ban['unbandate']})}"><span class="style1"><strong>{$character.name}</strong></span></a><strong><span class="style1">
                            Level {$character.level}
                           
                           </span>
                           
                           <br/> </strong><span lang="fa" class="style4"><strong>وضعیت آزاد سازی</strong></span><strong><span class="style4"> : 
                            </span>{if {$ban['bandate']} > {$ban['unbandate']}}
                            </strong>
                            <span class="style1"><strong>Forever</strong></span><strong> 
                            
                            {else}
                            </strong>
                            <span class="style2"><strong>{{$ban['unbandate'] - $ban['bandate']} / 24 / 3600}</strong></span><strong>
                            <span class="style2" lang="fa">روز</span>
                            
                            {/if} </strong>

                            </div>

                            <div class="clear"></div>
                         
                        </div>

                    </div>
                  {/if} 
                   {/foreach}
                {/foreach}
            {/foreach}
        
    </section>
    
   

    <section id="select_tool" >
        <div class="online_realm_button">آزاد سازی هیرو</div>
        
        <div class="select_tools">

            
             <!-- Unban -->
            <div class="select_tool" >
                <div class="tool store_item" >
                    <div class="style5">
                    <section class="tool_buttons" >
                 
                        <a href="javascript:void(0)" class="nice_button" 
                         onClick="CharacterTools.Purchase(this, 6, {$config->item('unban_price')})">
                            آزادسازی
                        </a>
           
        

                      </section>
                    <td>
                    <img class="item_icon"  src="{$url}application/modules/unban_char/css/images/time.jpg" width="36" height="36" src="" align="absmiddle">
    </td>
                   
                    <br />
                        <strong>{if $config->item('unban_price') > 0}<span class="style7">هزینه&nbsp; {$config->item('unban_price')} امتیاز ویژه</span> {else}<span class="style6">رایگان می باشد</span>{/if}
                        </strong>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>

            <div class="clear"></div>
        </div>
        <div class="clear"></div>
        
        <div class="ucp_divider"></div>
        
    </section>

    <div class="clear"></div>
</section>
{else}
            <center style="padding-top:10px;"><b>{lang("no_chars", "teleport")}</b></center>
        {/if}