{include file="visual_header.tpl"}
    


        <div class="tables-panel">
        	<ul>
            	<li><a href="?a=signup">Registration account</a></li>
                <li><a href="?a=login" class="active">Login to account</a></li>
                <li><a href="?a=forgot_password">Forgot password</a></li>
            </ul>
        </div>

        
    	<div class="content-box">
            <div class="big-title white center">Login to account</div>


{literal}
<script language=javascript>
function checkform() {
  if (document.mainform.username.value=='') {
    alert("Please type your username!");
    document.mainform.username.focus();
    return false;
  }
  if (document.mainform.password.value=='') {
    alert("Please type your password!");
    document.mainform.password.focus();
    return false;
  }
  return true;
}
</script>
{/literal}

{if $frm.say eq 'invalid_login'}

<div class="messages error login_form">Login error! Your login or password or turing image code is wrong. Please check this information.</div>

{/if}



<form method=post name=mainform onsubmit="return checkform()" class="login_form radius3">
<input type=hidden name=a value='do_login'>
<input type=hidden name=follow value=''>
<input type=hidden name=follow_id value=''>

<div class="form-field">
	<label>Username: <span class="star">*</span></label>
	<input type=text name=username value='' class=inpts size=30 autofocus="autofocus">
</div>
<div class="form-field">
	<label>Password: <span class="star">*</span></label>
	<input type=password name=password value='' class=inpts size=30>
</div>
{if $userinfo.validation_enabled == 1}
<div class="form-field">
	<label><img src="?a=show_validation_image&{$userinfo.session_name}={$userinfo.session_id}&rand={$userinfo.rand}"> <span class="star">*</span></label>
	<input type=text name=validation_number class=inpts size=30 autofocus="autofocus">
</div>

{/if}

<div class="form-field">
	<input type=submit value="Login to account" class=sbmt>
</div>

</form>

{include file="visual_footer.tpl"}
    