{include file="visual_header.tpl"}


        <div class="tables-panel">
        	<ul>
            	<li><a href="?a=signup">Registration account</a></li>
                <li><a href="?a=login">Login to account</a></li>
                <li><a href="?a=forgot_password" class="active">Forgot password</a></li>
            </ul>
        </div>
        
        
    	<div class="content-box">
            <div class="big-title white center">Forgot your password</div>



{literal}
<script language=javascript>
function checkform() {
  if (document.forgotform.email.value == '') {
    alert("Please type your username or email!");
    document.forgotform.email.focus();
    return false;
  }
  return true;
}
</script>
{/literal}

{if $found_records == 2}
Your accound was found. Please check your e-mail address and follow confirm URL to reset your password.
<br><br>
{else}

{if $found_records == 0}
No accounts found for provided info.
<br><br>
{elseif $found_records == 1}
Request was confirmed. Login and password was sent to your email address.
<br><br>
{/if}

<form method=post name=forgotform onsubmit="return checkform();" class="login_form radius3">
<input type=hidden name=a value="forgot_password">
<input type=hidden name=action value="forgot_password">

<div class="form-field">
	<label>Type your username or e-mail: <span class="star">*</span></label>
	<input type=text name='email' value="" class=inpts size=30>
</div>    
<div class="form-field">
	<input type=submit value="Forgot password" class=sbmt>
</div>
</form>
{/if}

{include file="visual_footer.tpl"}