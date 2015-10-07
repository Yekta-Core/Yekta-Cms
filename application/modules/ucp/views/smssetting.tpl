
<head>
<style type="text/css">
<!--
#main {
	direction: rtl;
}
-->

</style>
</head>

<div align="center"> 
{if $message!=''}

<div align="center" id="message"> 


<center>
<div style="padding: 8px 35px 8px 14px; margin-bottom: 20px; text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5); background-color: #ffd8e8; border: 1px solid #FF006A; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px;">
<div style="text-align: right;"><span style="color: #ff0000;"><span style="font-family: tahoma,geneva,sans-serif;"><span style="font-size: 12px;">هشدار :</span></span></span></div>
<div style="text-align: right;"></div>
<div style="text-align: right;">{$message}</div>
</center>

     
     {form_open('ucp')}


	  <tr>
            <td style="width: 126px"></td>
            <td>
          		<strong>
          		<input type="submit" value="بازگشت"  class="button_all" name="submit"  id="submit" class="style2" style="width: 127px"/></strong> 
                  </tr>
	</form>  


{else}


<center>
<div style="padding: 8px 35px 8px 14px; margin-bottom: 20px; text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5); background-color: #ffd8e8; border: 1px solid green; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px;">
<div style="text-align: right;"><span style="color: blue;"><span style="font-family: tahoma,geneva,sans-serif;"><span style="font-size: 13px;">توجه :</span></span></span></div>
<div style="text-align: right;"></div>
<div style="text-align: right;"><span style="color: green;"><span style="font-family: tahoma,geneva,sans-serif;"><span style="font-size: 13px;"> کد فعال سازی به شماره </span></span>  همراه شما ارسال شد</div>
</center> 
{form_open('ucp/setsmsMobile')}
<table dir="rtl" style="width:80%">


        <tr>
			<td  style="width: 149px" >   کد فعال سازی اکانت:</td>
			<td>
				<strong>
				<input type="text" align="left" name="smsregister"  maxlength="5" id="smsregister"  value="" dir="rtl"/></strong>
				
			</td>
		</tr>

      
	</table>

	  <tr>
            <td style="width: 126px"></td>
            <td>
          		<strong>
          		<input type="submit" value="ثبت اطلاعات "  class="button_all" name="submit"  id="submit" class="style2" style="width: 127px"/></strong> 
                  </tr>
	</form>

 {/if}
 

</div>
