var Auctionhouse = {

	RunScanner: function()
	{
		UI.alert('Scanning...');
		
		$.get(Config.URL + "auctionhouse/admin/scan", function(data)
		{
			UI.alert('Scan Results: <br />' + data);
		});
	},
	
	submitConfigSource: function()
	{
		var values = {
			csrf_token_name: Config.CSRF,
			source: $("#source").val()
		};

		console.log(values);

		$.post(Config.URL + "auctionhouse/admin/saveConfigSource", values, function(data)
		{
			UI.alert(data);
		});
	}
}