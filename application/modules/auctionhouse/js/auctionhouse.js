var Auctionhouse = {
	
	RealmID: 1,
	CurrentPage: 0,
	CurrentFaction: 0,
	SearchText: 'null',
	CurrentSort: 0,
	loadedIcons: [],
	
	Initialize: function(RealmID, Page, Faction, Search, Sort)
	{
		Auctionhouse.RealmID = RealmID;
		Auctionhouse.CurrentPage = Page;
		Auctionhouse.CurrentFaction = Faction;
		Auctionhouse.SearchText = Search;
		Auctionhouse.CurrentSort = Sort;
		
		// Sortable links crap
		$('#ah-sortable td a').each(function(i, e)
		{
			// Check if this element is sorting link
			var sortType = $(e).attr('data-sort-id');
			
			if (sortType.length > 0)
			{
				// Bind the sort handler
				$(e).bind('click', function()
				{
					return Auctionhouse.Sort(parseInt(sortType));
				});
				
				// Check if it's the active sorting type
				if (parseInt(sortType) == Auctionhouse.CurrentSort || (parseInt(sortType) + 1) == Auctionhouse.CurrentSort)
				{
					$(e).addClass('ah-active-sorting');
					
					// Set a little tooltip
					if (parseInt(sortType) == Auctionhouse.CurrentSort)
					{
						$(e).html('&darr;&nbsp;' + $(e).html());
					}
					else
					{
						$(e).html('&uarr;&nbsp;' + $(e).html());
					}
				}
			}
		});
		
		// Fix tabels hover
		$('.nice_table_mod tr').hover(function()
		{
			$(this).addClass('tr-hover');
		},function()
		{
			$(this).removeClass('tr-hover');
		});
	},
	
	/**
	* Performs an ajax call to get the display name
	* This should only be called if the icon cache was empty
	* @param Int id
	*/
	getIcon: function(id, realm)
	{
		if($.inArray(id, this.loadedIcons) == -1)
		{
			this.loadedIcons.push(id);
		
			$.get(Config.URL + "icon/get/" + realm + "/" + id, function(data)
			{
				$(".get_icon_" + id).each(function()
				{
					$(this).html(	"<div class='item'>" +
										"<a href='" + Config.URL + "item/" + realm + "/" + id + "' rel='item=" + id + "' data-realm='" + realm + "'></a>" +
										"<img src='https://wow.zamimg.com/images/wow/icons/large/" + data + ".jpg' />" +
									"</div>");
					Tooltip.refresh();
				});
			});
		}
	},
	
	UpdateURI: function()
	{
		var path = document.location.pathname;
		
		// Check if we need to add the index crap
		if (path.indexOf('/index') == -1)
		{
			path += '/index';
		}
		else
		{
			path = path.substr(0, path.indexOf('index/') + 5)
		}
		
		// Add the variables
		path += '/' + String(Auctionhouse.RealmID);
		path += '/' + String(Auctionhouse.CurrentFaction);
		path += '/' + String(Auctionhouse.SearchText);
		path += '/' + String(Auctionhouse.CurrentSort);
		path += '/' + String(Auctionhouse.CurrentPage);
		
		// Redirect
		document.location.pathname = path;
	},
	
	ChangeRealm: function()
	{
		var element = document.getElementById('realm-changer');
		var sel = element.options[element.selectedIndex];
		
		if (typeof sel != 'undefined' && sel.value > 0)
		{
			// Set to the first page
			Auctionhouse.CurrentPage = 0;
			// Set the realm
			Auctionhouse.RealmID = sel.value;
			// Update the URI and redirect
			Auctionhouse.UpdateURI();
		}
		
		return true;
	},
	
	ChangeFaction: function()
	{
		var element = document.getElementById('faction-changer');
		var sel = element.options[element.selectedIndex];
		
		if (typeof sel != 'undefined' && sel.value)
		{
			// Set to the first page
			Auctionhouse.CurrentPage = 0;
			// Set the realm
			Auctionhouse.CurrentFaction = sel.value;
			// Update the URI and redirect
			Auctionhouse.UpdateURI();
		}
		
		return true;
	},
	
	Search: function()
	{
		var input = $('#search_field');
		
		// Check if we want to null the search
		if (!input.val() || input.val().length == 0)
		{
			// Set to the first page
			Auctionhouse.CurrentPage = 0;
			// Set the search text
			Auctionhouse.SearchText = 'null';
			// Update the URI and redirect
			Auctionhouse.UpdateURI();
			return;
		}
		
		if (input.val() && input.val().length > 0)
		{
			var text = input.val();
			
			// Check the length of the search
			if (text.length < 3)
			{
				UI.alert('The search is too short, minimum length 3.', 3000);
				return;
			}
			
			// Check for allowed characters
			var pattern = /^[0-9a-zA-Z-' ]+$/;
			 
			if (!text.match(pattern))
			{
				UI.alert('Some of the characters in the search text are not allowed!', 3000);
				return;
			}

			// Set to the first page
			Auctionhouse.CurrentPage = 0;
			// Set the search text
			Auctionhouse.SearchText = escape(text);
			// Update the URI and redirect
			Auctionhouse.UpdateURI();
		}
	},
	
	Sort: function(id)
	{
		// Check if we want to switch to ascending
		if (Auctionhouse.CurrentSort == id)
		{
			Auctionhouse.CurrentSort = id + 1;
		}
		// else we want to switch back to descending or diferent type of sorting
		else 
		{
			Auctionhouse.CurrentSort = id;
		}
		
		// Set to the first page
		Auctionhouse.CurrentPage = 0;
		// Update the URI and redirect
		Auctionhouse.UpdateURI();
		
		return false;
	}
}