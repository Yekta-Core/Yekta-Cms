var CharacterTools = {

	User: {

		dp: null,

		initialize: function(dp)
		{
			this.dp = dp;
		}
	},

	Character: {

		name: null,
		guid: null,
		realm: null,

		initialize: function(name, guid, realm)
		{
			this.name = name;
			this.guid = guid;
			this.realm = realm;
		}
	},

	selectCharacter: function(button, realm, guid, name)
	{
		var CharSection = $("#select_character");
		
		CharacterTools.Character.initialize(name, guid, realm);
		
		$(".item_group", CharSection).each(function()
		{
			$(this).removeClass("item_group").addClass("select_character");
			$(this).find(".nice_active").removeClass("nice_active").html("select");
		});
		
		$(button).parents(".select_character").removeClass("select_character").addClass("item_group");
		$(button).addClass("nice_active").html("selected");
	},
	
	IsLoading: false,
	
	GetToolName: function(ToolId)
	{
		switch (ToolId)
		{
			
			case 6: return "آزاد سازی هیرو";
		}
		
		return "Unknown";
	},
	
	Purchase: function(button, ToolId, Price)
	{
		//Check if we're already executing a command
		if (CharacterTools.IsLoading)
			return;
		
      

		//Check if we have selected character
		if (CharacterTools.Character.guid == null)
		{
			UI.alert("لطفا ابتدا یک هیرو را انتخاب کنید.");
			return;
		}
			
		var CanAfford = false;

		if (Price == 0)
		{
			CanAfford = true;
		}
		else
		{
			if (CharacterTools.User.dp < Price)
			{
				UI.alert("اعتبار کافی نمی باشد");
			}
			else
			{
				CanAfford = true;
			}
		}

		if (CanAfford)
		{
			$.ajax({
			  	beforeSend: function(xhr)
				{
					CharacterTools.IsLoading = true;
					$(button).parents(".select_tool").addClass("active_tool");
					$(button).html('...در انجام عملیات');

			  	}
			});
			
			// Execute the service
			$.post(Config.URL + "unban_char/submit", 
			{
				id: ToolId, 
				guid: CharacterTools.Character.guid, 
				realm: CharacterTools.Character.realm, 
				csrf_token_name: Config.CSRF
			},
			function(data)
			{
				if (data == 1)
				{
					
			//	UI.alert("آزادسازی" + " برای (" + CharacterTools.Character.name + ")  با موفقیت انجام شد") ;
UI.alert("با موفقیت آزادسازی شد  "+CharacterTools.Character.name +"  هیرو  ") ;

setTimeout ( "redirect('unban_char')", 5000 );	

//window.location='unban_char'

				}
				else
				{
					UI.alert(data);
				}
				
				CharacterTools.IsLoading = false;
				$(".active_tool").find('.nice_button').html("Purchase");
				$(".active_tool").removeClass("active_tool");
			});
		}
	}
};

function redirect(url) 
{
	
	window.location=url; 
}