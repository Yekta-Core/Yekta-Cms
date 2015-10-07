
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
<div style="padding: 8px 35px 8px 14px; margin-bottom: 20px; text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5); background-color: #ffd8e8; border: 1px solid #FF006A; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px;">
<div style="text-align: right;"><span style="color: #ff0000;"><span style="font-family: tahoma,geneva,sans-serif;"><span style="font-size: 12px;">هشدار :</span></span></span></div>
<div style="text-align: right;"></div>
<div style="text-align: right;">درج شماره همراه بصورت صحیح الزامی میباشد. سرور در قبال اکانت و هیروهایی که شماره همراه آنها بصورت صحیح وارد نشده باشد هیچ گونه مسئولیتی را عهده دار نخواهد بود</div>



</center>

<center>
<div  style="padding: 8px 35px 8px 14px; margin-bottom: 20px; text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5); background-color: #ffd8e8; border: 1px solid green; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px;">
<div style="text-align: right;"><span style="color: green;"><span style="font-family: tahoma,geneva,sans-serif;"><span style="font-size: 13px;"></span></span></span></div>
<div style="text-align: right;"></div>

{if !$statuscms}
<div style="text-align: right;"> بعد از ثبت اطلاعات اکانت شما فعال خواهد شد</div>
{/if}
{if $statuscms}
<div style="text-align: right;">بعد از ثبت اطلاعات کد فعال سازی شماره همراه شما ارسال خواهد شد</div>
{/if}
</center>

   

	
{form_open('ucp/setMobile')}
<table dir="rtl" style="width:80%">


        <tr>
			<td  style="width: 149px" > شماره ملی:</td>
			<td>
				<strong>
				<input type="text" align="left" name="codemeli"  maxlength="10" id="codemeli"  value="" dir="rtl"/></strong>
				
			</td>
		</tr>



    	<tr>
			<td  style="width: 149px" >شماره همراه:</td>
			<td>
				<strong>
				<input type="text" align="left" name="mobile"  maxlength="11" id="mobile"  value="" dir="rtl"/></strong>
				
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
