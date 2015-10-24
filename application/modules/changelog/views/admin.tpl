<section class="box big" id="main_changelog">
	<h2>
		<img src="{$url}application/themes/admin/images/icons/black16x16/ic_grid.png"/>
{lang("update", "changelog")} (<div style="display:inline;" id="changelog_count">{if !$changes}0{else}{count($changes)}{/if}</div>)
	</h2>
	
	{if hasPermission("canAddCategory")}
		<span>
			<a class="nice_button" href="javascript:void(0)" onClick="Changelog.add()">{lang("new_category", "changelog")}</a>
		</span>
	{/if}

	{if $categories}
	{foreach from=$categories item=category}
		<ul id="changelog_list">
			<li id="headline_{$category.id}">
				<table width="100%">
					<tr>
						{if hasPermission("canAddChange")}
							<td style="font-family:tahoma,geneva,sans-serif;font-size:11px" width="5%"><a href="javascript:void(0)" onClick="Changelog.addChange({$category.id})" data-tip="افزودن آپدیت جدید"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_plus.png" /></a></td>
						{/if}
						<td style="font-family:tahoma,geneva,sans-serif;font-size:11px"><b>{$category.typeName}</b></td>
						
						<td style="text-align:right;" width="10%">
							
							{if hasPermission("canEditCategory")}
								<a href="javascript:void(0)" onClick="Changelog.renameCategory({$category.id}, this)" data-tip="{lang("c_n_c", "changelog")}"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_edit.png" /></a>&nbsp;
							{/if}
							
							{if hasPermission("canRemoveCategory")}
								<a href="javascript:void(0)" onClick="Changelog.removeCategory({$category.id}, this)" data-tip="{lang("r_c_u", "changelog")}"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_minus.png" /></a>
							{/if}
						</td>
					</tr>
				</table>
			</li>
			{foreach from=$changes item=change}
				{if $category.id == $change.type}
					<li>
						<table width="100%">
							<tr>
								<td style="font-family:tahoma,geneva,sans-serif;font-size:11px" width="40%">{$change.changelog}</td>
								<td style="font-family:tahoma,geneva,sans-serif;font-size:11px" width="20%">{$change.author}</td>
								<td style="font-family:tahoma,geneva,sans-serif;font-size:11px" width="20%">{date('Y/m/d', $change.time)}</td>
								
								<td style="text-align:right;" width="10%">
									{if hasPermission("canEditChange")}
										<a href="{$url}changelog/admin/edit/{$change.change_id}" data-tip="Edit"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_edit.png" /></a>&nbsp;
									{/if}

									{if hasPermission("canRemoveChange")}
										<a href="javascript:void(0)" onClick="Changelog.remove({$change.change_id}, this)" data-tip="Delete"><img src="{$url}application/themes/admin/images/icons/black16x16/ic_minus.png" /></a>
									{/if}
								</td>
							</tr>
						</table>
					</li>
				{/if}
			{/foreach}
		</ul>
	{/foreach}
	{/if}
</section>

<section class="box big" id="add_changelog" style="display:none;">
	<h2><a href='javascript:void(0)' onClick="Changelog.add()" >{lang("update", "changelog")}</a>{lang("new_category2", "changelog")}</h2>

	<form onSubmit="Changelog.create(this); return false" id="submit_form">
		<label for="name">{lang("category_name", "changelog")}</label>
		<input type="text" name="typeName" id="typeName" />
	
		<input type="submit" value="{lang("save", "changelog")}" />
	</form>
</section>