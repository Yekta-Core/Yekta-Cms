var Create = {
	
	send: function()
	{
		var content = $("#pm_editor").html();
		var username = $("#pm_username").val();
		var title = $("#pm_title").val();

		if(content.length <= 3)
		{
			UI.alert(lang("message_limit", "messages"));
		}
		else if(title.length <= 0 || title.length > 50)
		{
			UI.alert(lang("title_limit", "messages"));
		}
		else if(username.length <= 0)
		{
			UI.alert(lang("recipient_empty", "messages"));
		}
		else if(!/accept\.png/.test($("#pm_username_error").html()))
		{
			UI.alert(lang("invalid_recipient", "messages"));
		}
		else
		{
			var spot = $("#pm_spot");

			spot.html('<div style="text-align:center;padding:10px;"><img src="' + Config.image_path + 'ajax.gif" /></div>');

			$.post(Config.URL + "messages/create/submit/" + username, {title:title, content:content, csrf_token_name: Config.CSRF}, function(data)
			{
				if(data == "sent")
				{
					setTimeout(function()
					{
						window.location = Config.URL + "messages";
					}, 1000);

					spot.html('<div style="text-align:center;padding:10px;">' + lang("sent", "messages") + ' <a href="' + Config.URL + 'messages">' + lang("the_inbox", "messages") + '</a>...</div>');
				}
				else
				{
					spot.html('<div style="text-align:center;padding:10px;">' + lang("error", "messages") + '</div>');
				}
			});
		}
	},

	autoComplete: function(element)
	{
		var id = $(element).attr("id");

		if(element.value.length == 0 || !/^[A-Za-z0-9]*$/.test(element.value))
		{
			$("#" + id + "_autocomplete").html('').hide();
			$("#" + id + "_error").html('<img src="' + Config.URL + 'application/images/icons/exclamation.png" data-tip="' + lang("invalid_recipient", "messages") + '"/>');
			Tooltip.refresh();
		}
		else
		{
			this.getUserList(element.value, id, function(exists, users)
			{
				$("#" + id + "_autocomplete").html('').hide();

				if(exists == 0)
				{
					$("#" + id + "_error").html('<img src="' + Config.URL + 'application/images/icons/exclamation.png" data-tip="' + lang("invalid_recipient", "messages") + '"/>');
					Tooltip.refresh();
				}
				else
				{
					if(users.length > 0)
					{
						for(i in users)
						{
							$("#" + id + "_autocomplete").append("<a href='javascript:void(0)' onClick='document.getElementById(\"pm_username\").value = \"" + users[i] + "\";Create.autoComplete(document.getElementById(\"pm_username\"))'>" + users[i].replace(new RegExp("(" + element.value + ")", "i"), "<b>$1</b>") + "</a>");
						}

						$("#" + id + "_autocomplete").show();
					}

					if(exists == 1)
					{
						$("#" + id + "_error").html('<img src="' + Config.URL + 'application/images/icons/accept.png"/>');
					}
					else
					{
						$("#" + id + "_error").html('');
					}
				}
			});
		}
	},

	getUserList: function(value, id, callback)
	{

		$.get(Config.URL + "messages/create/check/" + value, function(data)
		{
			data = JSON.parse(data);

			if(data.status == 1)
			{
				if(data.exact)
				{
					callback(1, []);
				}
				else
				{
					callback(2, data.users);
				}
			}
			else
			{
				callback(0, []);
			}
		});
	},

	validateTitle: function(element)
	{
		var error = $(element).attr("id");

		if(element.value.length == 0)
		{
			$("#" + error + "_error").html('<img src="' + Config.URL + 'application/images/icons/exclamation.png" data-tip="' + lang("title_cant_be_empty", "messages") + '"/>');
			Tooltip.refresh();
		}
		else
		{
			$("#" + error + "_error").html('<img src="' + Config.URL + 'application/images/icons/accept.png"/>');
		}
	}
};