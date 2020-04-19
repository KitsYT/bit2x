{include file="logo.tpl"}


<div id="contentWrapper" class="map">



</div>    

<div id="contentWrapper" class="img-4">
	<div id="content">
  

    	<div class="content-box left">
            <div class="big-title white">Support center</div>  
    		<div class="contacts-box radius3">
               <div class="text-block">You can have a look at our F.A.Q page to solve your problem without outside assistance using the button below. If you do not find an answer for your question, please contact us.
               </div>
               <a href="?a=faq" class="blue-btn show-faq-btn radius3"><span>Show Frequently Asked Questions</a>
               <div class="contacts-tr first"><div class="left"><span>E-mail:</span></div><div class="right"><a href="mailto:support@{$settings.site_name}">support@{$settings.site_name}</a></div></div>
               <div class="contacts-tr"><br></div>
               <div class="contacts-tr"><br></div>
               <div class="contacts-tr"><br></div>
               <div class="contacts-tr"><br><br></div>
            </div>
        </div>  
        
    	<div class="content-box right">
            <div class="big-title white">Support Form</div>


{if $say eq 'send'}
Message has been successfully sent. We will back to you in next 24 hours. Thank you.<br><br>
{else}

<script language=javascript>
{if $userinfo.logged == 1}
{literal}
function checkform() { 
  if (document.mainform.message.value == '') {
    alert("Please type your message!");
    document.mainform.message.focus();
    return false;
  }
  return true;
}
{/literal}
{else}
{literal}
function checkform() {
  if (document.mainform.name.value == '') {
    alert("Please type your full name!");
    document.mainform.name.focus();
    return false;
  }
  if (document.mainform.email.value == '') {
    alert("Please enter your e-mail address!");
    document.mainform.email.focus();
    return false;
  }
  if (document.mainform.message.value == '') {
    alert("Please type your message!");
    document.mainform.message.focus();
    return false;
  }
  return true;
}
{/literal}
{/if}
</script>
 
<form method=post name=mainform onsubmit="return checkform()" class="easy_form radius3">
<input type=hidden name=a value=support>
<input type=hidden name=action value=send>

<div class="form-field">
	<label>Your Name: <span class="star">*</span></label>
		<input type="text" name="name" value="" size=30 class=inpts>
	</div>
<div class="form-field">
	<label>Your E-mail: <span class="star">*</span></label>
	 	<input type="text" name="email" value="" size=30 class=inpts>
	</div>
<div class="form-field">
	<label>Message: <span class="star">*</span></label>
    <textarea name=message class="inpts mail-inpts" cols=45 rows=4></textarea>
</div>
<div class="form-field">
	<input type=submit value="Send Message" class=sbmt>
</div>
</form> {/if}



        </div>

	</div> 
</div>
{include file="footer.tpl"}