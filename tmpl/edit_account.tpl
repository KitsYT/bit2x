{include file="mheader.tpl"}

{literal}


<script language=javascript>
function IsNumeric(sText) {
  var ValidChars = "0123456789.";
  var IsNumber=true;
  var Char;
  if (sText == '') return false;
  for (i = 0; i < sText.length && IsNumber == true; i++) { 
    Char = sText.charAt(i); 
    if (ValidChars.indexOf(Char) == -1) {
      IsNumber = false;
    }
  }
  return IsNumber;
}

function checkform() {
  if (document.editform.fullname.value == '') {
    alert("Please type your full name!");
    document.editform.fullname.focus();
    return false;
  }
{/literal}
{if $settings.use_user_location == 1}
{literal}
  if (document.editform.address.value == '') {
    alert("Please enter your address!");
    document.editform.address.focus();
    return false;
  }
  if (document.editform.city.value == '') {
    alert("Please enter your city!");
    document.editform.city.focus();
    return false;
  }
  if (document.editform.state.value == '') {
    alert("Please enter your state!");
    document.editform.state.focus();
    return false;
  }
  if (document.editform.zip.value == '') {
    alert("Please enter your ZIP!");
    document.editform.zip.focus();
    return false;
  }
  if (document.editform.country.options[document.editform.country.selectedIndex].text == '--SELECT--') {
    alert("Please choose your country!");
    document.editform.country.focus();
    return false;
  }
{/literal}
{/if}
{literal}
  if (document.editform.password.value != document.editform.password2.value) {
    alert("Please check your password!");
    document.editform.fullname.focus();
    return false;
  }
{/literal}
{if $settings.use_transaction_code}
{literal}
  if (document.editform.transaction_code.value != document.editform.transaction_code2.value) {
    alert("Please check your transaction code!");
    document.editform.transaction_code2.focus();
    return false;
  }
{/literal}
{/if}
{literal}
{/literal}
{if $settings.usercanchangeemail == 1}
{literal}
  if (document.editform.email.value == '') {
    alert("Please enter your e-mail address!");
    document.editform.email.focus();
    return false;
  }
{/literal}
{/if}
{literal}
  return true;
}
</script>
{/literal}


<form action="index.php" method=post onsubmit="return checkform()" name=editform class="account_form">
<input type=hidden name=a value=edit_account>
<input type=hidden name=action value=edit_account>
<div class="title"><div class="icon icon-1"></div>Edit Account Form:</div>
{if $frm.say eq 'changed'}
Your account data has been updated successfully.<br><br>
{/if}
{if $errors}
<ul style="color:red">
{section name=e loop=$errors}
{if $errors[e] eq 'full_name'}
<li>Please enter your Full Name!
{/if}
{if $errors[e] eq 'address'}
<li>Please enter your address!
{/if}
{if $errors[e] eq 'city'}
<li>Please enter your city!
{/if}
{if $errors[e] eq 'state'}
<li>Please enter your state!
{/if}
{if $errors[e] eq 'zip'}
<li>Please enter your zip!
{/if}
{if $errors[e] eq 'country'}
<li>Please choose your country!
{/if}
{if $errors[e] eq 'username'}
<li>Please enter your username!
{/if}
{if $errors[e] eq 'password'}
    <li>Please enter a password!
{/if}
{if $errors[e] eq 'password_confirm'} 
    <li>Please check your password!
{/if}
{if $errors[e] eq 'password_too_small'}
<li>Password is too small, please enter at least {$settings.min_user_password_length} chars!
{/if}
{if $errors[e] eq 'transaction_code'}
    <li>Please enter the Transaction Code! {/if} {if $errors[e] eq 'transaction_code_confirm'} 
    <li>Please check your Transaction Code!
{/if}
{if $errors[e] eq 'transaction_code_too_small'}
<li>Transaction Code is too small, please enter at least {$settings.min_user_password_length} chars!
{/if}
{if $errors[e] eq 'wrong_current_password'}
<li>You entered wrong current password
{/if}
{if $errors[e] eq 'transaction_code_vs_password'}
    <li>Transaction Code should be different then the Password! {/if} {if $errors[e] 
      eq 'invalid_transaction_code'} 
    <li>You have provided invalid Current Transaction Code!
{/if}
{if $errors[e] eq 'email'}
<li>Please enter your e-mail!
{/if}
{if $errors[e] eq 'turing_image'}
<li>Enter the verification code as it is shown in the corresponding box.
{/if} 
<br>
{/section}
</ul>
{/if}

<div class="form-field">
 <label>Account Name:<span class="star">*</span></label>
<div class="inpts grey">{$userinfo.username}</div>
</div><div class="form-field">
 <label>Registration date:<span class="star">*</span></label>
 <div class="inpts grey">{$userinfo.date_register}</div>
</div><div class="form-field">
 <label>Your Full Name:<span class="star">*</span></label>
 <input type=text name=fullname value='{$userinfo.name|escape:"quotes"}' class=inpts size=30>
</div>
{if $settings.use_user_location}
<div class="form-field">
 <label>Your Address:<span class="star">*</span></label>
 <input type=text name=address value="{$userinfo.address|escape:"quotes"}" class=inpts size=30>
</div>
<div class="form-field">
 <label>Your City:<span class="star">*</span></label>
 <input type=text name=city value="{$userinfo.city|escape:"quotes"}" class=inpts size=30>
</div>
<div class="form-field">
 <label>Your State:<span class="star">*</span></label>
 <input type=text name=state value="{$userinfo.state|escape:"quotes"}" class=inpts size=30>
</div>
<div class="form-field">
 <label>Your Zip:<span class="star">*</span></label>
 <input type=text name=zip value="{$userinfo.zip|escape:"quotes"}" class=inpts size=30>
</div>
<div class="form-field">
 <label>Your Country:<span class="star">*</span></label>
 <label>
  <select name='country' class=inpts>
<option value=''>--SELECT--</option>
{section name=c loop=$countries}
<option {if $countries[c].name eq $userinfo.country}selected{/if}>{$countries[c].name|escape:"quotes"}</option>
{/section}
  <span class="star">*</span></label>
</div>
{/if}

{if $settings.license == '4ZQQN55VA2NXBVFUQJE6' }
<div class="form-field">
 <label>Current Password:<span class="star">*</span></label>
 <input type=password name=current_password value="" class=inpts size=30>
</div>
{/if}
<div class="form-field">
<label>New Password:<span class="star">*</span></label>
 <input type=password name=password value="" class=inpts size=30>
</div><div class="form-field">
<label>Retype Password:<span class="star">*</span></label>
 <input type=password name=password2 value="" class=inpts size=30>
</div>
{if $settings.use_transaction_code}
  {if $settings.use_transaction_code_edit_account != 1}
    {if $userinfo.transaction_code != ''}
    <div class="form-field">
   <label>Current Transaction Code:<span class="star">*</span></label>
     <input type=password name=transaction_code_current value="" class=inpts size=30>
    </div>
    {/if}
  {/if}
  <div class="form-field">
  <label>New Transaction Code:<span class="star">*</span></label>
   <input type=password name=transaction_code value="" class=inpts size=30>
  </div>
  <div class="form-field">
  <label>Retype Transaction Code:<span class="star">*</span></label>
   <input type=password name=transaction_code2 value="" class=inpts size=30>
  </div>
{/if}
{foreach item=ps from=$pay_accounts}
<div class="form-field">
 <label>Your {$ps.name} acc no:<span class="star">*</span></label>
 {if $settings.usercanchangeegoldacc == 0 && $ps.account != ''}{$ps.account|escape:html}{else}<input type=text class=inpts size=30 name="pay_account[{$ps.id}]" value="{$ps.account|escape:html}">{/if}
</div>
{/foreach}
{foreach item=p from=$mpay_accounts}
{foreach item=ps from=$p.accounts}
<div class="form-field">
 <label>Your {$p.name} {$ps.name}:<span class="star">*</span></label>
 {if $settings.usercanchangeegoldacc == 0 && $ps.value != ''}{$ps.value|escape:html}{else}<input type=text class=inpts size=30 name="pay_account[{$p.id}][{$ps.name|escape:html}]" value="{$ps.value|escape:html}">{/if}
</div>
{/foreach}
{/foreach}
<div class="form-field">
 <label>Your E-mail address:<span class="star">*</span></label>
 {if $settings.usercanchangeemail == 1}<input type=text name=email value='{$userinfo.email|escape:"quotes"}' class=inpts size=30>{else}{$userinfo.email}{/if}
</div>
{if $userinfo.admin_auto_pay_earning == 1}
<div class="form-field">
 <td colspan=2><input type=checkbox name=user_auto_pay_earning value=1 {if $userinfo.user_auto_pay_earning == 1}checked{/if}> Receive earnings directly to e-currency account
</div>
{/if}
{if $settings.accesswap == 1}
<div class="form-field">
 <label>>Password for WAP access:<span class="star">*</span></label>
 <input type=password name=wappassword class=inpts size=30> {if $userinfo.stat_password ne ''}<a href=?a=deletewappass onclick="return confirm('Are you sure delete this password?');">[delete current]</a>{/if}
</div><div class="form-field">
 <td colspan=2><small>wap access here: {$settings.site_url}/wap.php</small>
</div>
{/if}
{if $settings.use_transaction_code_edit_account == 1}
<div class="form-field">
 <label>Current Transaction Code:<span class="star">*</span></label>
 <input type=password name=transaction_code_current value="" class=inpts size=30>
</div>
{/if}

{if $settings.license == '4ZQQN55VA2NXBVFUQJE6'}
<div class="form-field">
<label><img src="?a=show_validation_image&{$userinfo.session_name}={$userinfo.session_id}&rand={$userinfo.rand}"><span class="star">*</span></label>
 <input type=text name=validation_number class=inpts size=15>
</div>
{/if}

<div class="form-field">
	<input type=submit value="Change Account data" class=sbmt>
</div>
</form>

    	<div class="cabinet-box right">  
            <div class="info-block">
                <div class="title"><div class="icon icon-5"></div>Information:</div> 
                <div class="info-tr no-line"><p>Please, make sure that you`re filling in the correct payment data. 
An example of the correct AdvCash wallet payment data:</p>
                <ul class="list">
                    <li>advwallet@gmail.com</li>
                    <li>adwallet@yahoo.com</li>
                </ul>
                <p>Specify the e-mail that you used in order to register your AdvCash account, not the number of your AdvCash wallet.
If you have already specified incorrect payment data, please contact our Support Team in order to make the corrections and changes.</p></div>
            </div>
        </div>

{include file="mfooter.tpl"}

