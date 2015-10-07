
<head>
<style type="text/css">
.style1 {
	font-size: large;
}
.style2 {
	font-size: large;
	color: #FFFFFF;
}
.style3 {
	color: #FFFFFF;
}
.style4 {
	color: #FFFFFF;
	font-weight: bold;
	font-size: medium;
}
</style>
</head>
<div align="center">

{if $message!=''}

<div align="center" id="message"> 

	<strong><span class="style3">{$message}</span></strong>
	{form_open('unban')}
	<tr>
            <td style="width: 126px"></td>
            <td>
          		<strong>
          		<input type="submit" value="بازگشت"  name="submit"  id="submit" class="style4" style="width: 90px"/></strong> 
                  </tr>

</form>
</div>
{else}


{if $ban==false}	


	<span dir="rtl" class="banacc">اکانت شما آزاد میباشد</span></br>

 
{else}


	
	<span dir="rtl" class="currency"> هزینه آزادسازی اکانت {$cost} اعتبار میباشد</span>

{foreach from=$infovip item=row}

<span dir="rtl" class="banacc"> تاریخ مسدود شده : {date("H:m Y.m.d",{$row["bandate"]})} <br/>
 تاریخ آزاد سازی : {date("H:m Y.m.d",{$row["unbandate"]})} </span>


{/foreach}	

{if $cost > $dp and $ban!=false}	
<div align="center" id="message"> 

	<span dir="rtl" class="error"> اعتبار کافی نمی باشد لطفا اکانت خود را شارژ نمائید</span></br>

</div>  
{else}

{form_open('unban/UnbanAccount')}


               
	<tr>
            <td style="width: 126px"></td>
            <td>
          		<strong>
          		<input type="submit" value="آزاد سازی"   name="unban"  id="unban" class="style4" style="width: 130px"/></strong> 
          		
    </tr>
          
</form>
{/if}
{/if}
{/if}
</div>
