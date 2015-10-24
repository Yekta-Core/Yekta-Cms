<section class="box big">
	<h2>Auctioneers GUID Lists</h2>

	<p style="padding: 10px 20px;">The Auctioneers GUID List is essential to the faction filter, in order for the filder to work the system must know all the spawned auctioneers. This function will scan the database for all the spawned auctioneers by the entries we have described in the config file. <br />(Not required for Mangos)</p>
    
    <p style="padding: 0px 20px;">Spawned auctioneers we know about:</p>
    <ul id="cache_data">
    	{if $stats}
        	{foreach from=$stats item=realm key=key}
                <li>
                    <table width="100%">
                        <tr>
                            <td width="50%">{$realm.name}</td>
                            <td id="row_item">
                            	{foreach from=$realm.stats item=count key=faction}
                                	{$faction} <strong>{$count}</strong>{if $faction != 'Neutral'},{/if} 
                                {/foreach}
                            </td>
                        </tr>
                    </table>
                </li>
            {/foreach}
      	{else}
        	<li>There is no compirable realm.</li>
        {/if}
    </ul>

	<form onSubmit="Auctionhouse.RunScanner(); return false">
		<input type="submit" value="{lang("s_scan", "auctionhouse")}" />
	</form>
</section>

<section class="box big">
	<h2>{lang("setting", "auctionhouse")}</h2>
    
	<form onSubmit="Auctionhouse.submitConfigSource(); return false" id="advanced">
        <label for="source">{lang("source", "auctionhouse")}</label>

        <textarea id="source" name="source" rows="30" spellcheck="false">{$config}</textarea>

        <input type="submit" value="{lang("save", "auctionhouse")}" />
    </form>
</section>