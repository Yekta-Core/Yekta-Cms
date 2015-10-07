<script type="text/javascript">
	$(document).ready(function()
	{
		function checkIfLoaded()
		{
			if(typeof Cache != "undefined")
			{
				Cache.load();
			}
			else
			{
				setTimeout(checkIfLoaded, 50);
			}
		}

		checkIfLoaded();
	});
</script>

<section class="box big">
	<h2>کش ها</h2>
	<span dir="rtl" align="right">
		شما میتوانید به صورت دستی کش های سرور را پاک کنید . ما توصیه میکنیم به آن دست نزنید و مهم نیست حجم آن چقدر شده باشد
	</span>

	<ul id="cache_data">
		<li dir="rtl" align="right">در حال بارگزاری وضعیت کش ها ، لطفا صبر کنید<span style="padding:0px;display:inline;" id="loading_dots">...</li>
	</ul>

	{if hasPermission("emptyCache")}
		<span>
			<a class="nice_button" href="javascript:void(0)" onClick="Cache.clear('all_but_item')"><b>پاک کردن تمامی کش های آیتم ها</b></a>&nbsp;
			<a class="nice_button" href="javascript:void(0)" onClick="Cache.clear('website')">پاک کردن تمامی کش سایت</a>&nbsp;
			<a class="nice_button" href="javascript:void(0)" onClick="Cache.clear('message')">پاک کردن تمامی کش های پیام ها</a>&nbsp;
			<a class="nice_button" href="javascript:void(0)" onClick="Cache.clear('all')">پاک کردن همه</a>
		</span>
	{/if}
</section>