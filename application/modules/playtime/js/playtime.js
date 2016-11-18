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

			$(this).find(".nice_active").removeClass("nice_active").html("انتخاب سرویس");

		});

		

		$(button).parents(".select_character").removeClass("select_character").addClass("item_group");

		$(button).addClass("nice_active").html("انتخاب سرویس");

	},

	

	IsLoading: false,

	

	GetToolName: function(ToolId)

	{

		switch (ToolId)

		{

			case 1:	return "convert_time";

		    case 2:	return "Backup";

		    case 3:	return "Restore";

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

				UI.alert("امیتز شما کافی نمی باشد");

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

					$(button).html('لطفا منتظر بمانید ...');



			  	}

			});

		

			// Execute the service

			$.post(Config.URL + "playtime/submit", 

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

					UI.alert("تبدیل امتیاز با موفقیت انجام شد" + CharacterTools.Character.name);

				}

				else

				{

					UI.alert(data);

				}

				

				CharacterTools.IsLoading = false;

				$(".active_tool").find('.nice_button').html("انتخاب سرویس");

				$(".active_tool").removeClass("active_tool");

			});

		}

	}

};

