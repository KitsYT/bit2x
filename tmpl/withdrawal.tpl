{include file="mheader.tpl"}


    	<div class="cabinet-box left">
            <div class="info-block">
                <div class="title"><div class="icon icon-3"></div>Cashout Info:</div>
              

{if $say eq 'processed'}
{if $batch eq ''}Withdrawal request saved.{else} Withdrawal processed. Batch id: {$batch}{/if}
<br><br>
{/if}

{if $fatal}

{if $fatal == 'one_per_month'}
You can withdraw once per month only.
{/if}

{if $fatal == 'times_limit'}
You can withdraw {$settings.limit_withdraw_period_times} per {$settings.limit_withdraw_period_date} only.
{/if}


{if $fatal == 'withdrawal_percent_reached'}
Withdrawl percent has been reached. We have stopped all withdrawals.
{/if}

{else}

{if $say eq 'on_hold'}
Sorry, this amount on hold now.<br><br>
{/if}
{if $say eq 'zero'}
Sorry, you can't request a withdraw smaller than {$currency_sign}0.00 only<br><br>
{/if}
{if $say eq 'less_min'}
Sorry, you can request not less than {$currency_sign}{$settings.min_withdrawal_amount}<br><br>
{/if}
{if $say eq 'less_min_bankwire'}
Sorry, you can request not less than {$currency_sign}1000 for BankWire withdrawal<br><br>
{/if}
{if $say eq 'greater_max'}
Sorry, you can request not greater than {$currency_sign}{$settings.max_withdrawal_amount}<br><br>
{/if}
{if $say eq 'daily_limit'}
Sorry, you have exceeded a daily limit<br><br>
{/if}
{if $say eq 'not_enought'}
Sorry, you have requested the amount larger than the one on your balance.<br><br>
{/if}
{if $say eq 'invalid_transaction_code'}
You have entered the invalid transaction code.<br><br>
{/if}
{if $say eq 'no_deposits'}
You have not done any deposits yet. Withdrawal function will be available after a deposit.
<br><br>
{/if}
{if $say eq 'no_active_deposits'}
You must have active deposit to withdraw.
{/if}


{if $preview}

<form method=post>
<input type=hidden name=a value=withdraw>
<input type=hidden name=action value=withdraw>
<input type=hidden name=amount value={$amount}>
<input type=hidden name=ec value={$ec}>
<input type=hidden name=comment value="{$comment|escape:html}">

<table cellspacing=0 cellpadding=2 border=0>
<tr>
 <td colspan=2>You are withdrawing <b>{$currency_sign}{$amount}</b> of {$currency}. 
{if $settings.withdrawal_fee > 0 || $settings.withdrawal_fee_min > 0} Our fee is 
{if $settings.withdrawal_fee > 0}<b>{$settings.withdrawal_fee}%</b>{/if}
{if $settings.withdrawal_fee > 0 && $settings.withdrawal_fee_min > 0} or {/if}
{if $settings.withdrawal_fee_min > 0} <b>{$currency_sign}{$settings.withdrawal_fee_min}</b>{if $settings.withdrawal_fee > 0} as a minimum{/if}{/if}
.
{else}
We have no fee for this operation. 
{/if}
</td>
</tr>
<tr>
 <td colspan=2>Actually you will acquire the total of <b>{$currency_sign}{$to_withdraw}</b> on your {$currency} account {if $account}{$account}{/if}.</td>
</tr>
{if $comment}
<tr>
 <td colspan=2>Your comments: {$comment|escape:html}</td>
</tr>
{/if}
{if $settings.use_transaction_code && $userinfo.transaction_code}
<tr>
 <td colspna=2>&nbsp;</td>
</tr>
<tr>
 <td width=1% nowrap>Transaction Code:</td>
 <td width=99%><input type="password" name="transaction_code" class=inpts size=15></td>
</tr>
{/if}
<tr>
 <td><br><input type=submit value="Confirm" class=sbmt></td>
</tr></table>
</form>


{else}


<form method=post>
<input type=hidden name=a value=withdraw>
<input type=hidden name=action value=preview>




  <div class="info-tr first">Account Balance:
                     <span class="right">{$currency_sign}<b>{$ab_formated.total}</b>
                     <a class="tooltip bal_tip">
                        <span class="classic_tooltip radius3">
						Account Balance <br>
                                               {section name=p loop=$ps}
   {if $ps[p].balance > 0}{$currency_sign}{$ps[p].balance} of {$ps[p].name}{if $hold[p].amount > 0} / {$currency_sign}{$hold[p].amount} on hold{/if}<br>{/if}
{/section}
                                                </span>
                     </a>
                     </span>                      
                </div>
                <div class="info-tr">Pending Withdrawals: <span class="right">{$currency_sign}<b>{if $ab_formated.withdraw_pending != 0}{$ab_formated.withdraw_pending}{else}0.00{/if}</b></span></div>

{foreach item=ps from=$pay_accounts}
	<div class="info-tr">Your {$ps.name|escape:html} Accoun: <span class="right">{if $ps.account != ''}{$ps.account|escape:html}{else}<a href=?a=edit_account><i>not set</i></a>{/if}</span></div>
	{/foreach}
{foreach item=p from=$mpay_accounts}
	<div class="info-tr">Your {$p.name|escape:html} Account: <span class="right">{foreach item=ps from=$p.accounts}
 {$ps.name|escape:html}: {if $ps.value != ''}{$ps.value|escape:html}{else}<a href=?a=edit_account><i>not set</i></a>{/if}<br>
{/foreach}</span></div>
{/foreach}


{if $withdraw_systems}
<table cellspacing=0 cellpadding=2 border=0 width=200 class="table">
<tr>
 <td colspan=2>&nbsp;</td>
</tr>
<tr>
 <td>Select eCurrency:</td>
 <td><select name=ec class=inpts>
{section name=p loop=$withdraw_systems}
   <option value={$withdraw_systems[p].id}>{$withdraw_systems[p].name}</option>
{/section}
     </select>
 </td>
</tr><tr>
 <td>Withdrawal ({$currency_sign}):</td>
 <td><input type=text name=amount value="10.00" class=inpts size=15></td>
</tr><tr>
 <td colspan=2><textarea name=comment class=inpts cols=45 rows=4>Your comment</textarea>
</tr>
<tr>
 <td>&nbsp;</td>
 <td><input type=submit value="Request" class=sbmt></td>
</tr></table>
{else}
<br><br> <br><br><br><br>
<div align="center">
You have no funds to withdraw.
</div>
{/if}
</form>

{/if}

{/if}
            </div>   
    	</div>


    	<div class="cabinet-box right">  
            <div class="info-block">
                <div class="title"><div class="icon icon-5"></div>Information:</div>
				<div class="info-tr no-line">
                <!------ <div class="messages error">You have no funds to withdraw.</div> ----->
                 <p>Use the opportunities of the "Cashout" section in order to improve the investment interaction with our company, as well as for receiving all the necessary information about your account</p>
                 </div>
            </div>   
    	</div>
		
{include file="mfooter.tpl"}
