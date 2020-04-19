{include file="mheader.tpl"}



    	<div class="cabinet-box left">
            <div class="info-block">
                <div class="title"><div class="icon icon-1"></div>Account Info:</div>
            	<div class="info-tr first">User: <span class="right">{$userinfo.username}</span></div>
                <div class="info-tr">Account Balance:
                     <span class="right">{$currency_sign}<b>{$ab_formated.total}</b>
                     <a class="tooltip bal_tip">
                        <span class="classic_tooltip radius3">
						Account Balance <br>
						{section name=p loop=$ps}
   {if $ps[p].balance > 0}{$currency_sign}{$ps[p].balance} of {$ps[p].name}<br>{/if}
{/section}
                                                
                                                </span>
                     </a>
                     </span>                      
                </div>
                <div class="info-tr">Registration Date: <span class="right">Aug-31-2016</span></div>
                <div class="info-tr">Last Access: <span class="right">{$userinfo.create_account_date}</span></div>
            </div>   
    	</div> 
        
    	<div class="cabinet-box right">  
            <div class="info-block">
                <div class="title"><div class="icon icon-2"></div>Deposits Info:</div> 
                <div class="info-tr first">Active Deposit: <span class="right">{$currency_sign}<b>{$ab_formated.active_deposit}</b></span></div>
                                <div class="info-tr">Last Deposit: <span class="right">{$currency_sign}<b>{$last_deposit}</b></span></div>
                                                <div class="info-tr">Total Deposit: <span class="right">{$currency_sign}<b>{$ab_formated.deposit}</b></span></div>
                                <div class="info-tr btn-tr"><a href="?a=deposit" class="blue-btn-acc">Add Deposit And Start Earning Now</a></div>
            </div>
        </div>      
  
     	<div class="cabinet-box left second">  
            <div class="info-block">
                <div class="title"><div class="icon icon-3"></div>Withdrew Info:</div> 
                <div class="info-tr first">Earned Total: <span class="right">{$currency_sign}<b>{$ab_formated.earning}</b></span></div>
                <div class="info-tr">Pending Withdrawal: <span class="right">{$currency_sign}<b>{$ab_formated.withdraw_pending}</b></span></div>
                <div class="info-tr">Withdrew Total: <span class="right">{$currency_sign}<b>{$ab_formated.withdrawal}</b></span></div>
                                <div class="info-tr">Last Withdrawal: <span class="right">{$currency_sign}<b>{$last_withdrawal}</b></span></div>
            </div>
        </div>
        
    	<div class="cabinet-box right second">  
            <div class="info-block">
                <div class="title"><div class="icon icon-4"></div>Referrals Info:</div> 
                <div class="info-tr first">Your referral link: <span class="right">{$settings.site_url}/?ref={$userinfo.username}</span></div>
				<div class="info-tr btn-tr" style="padding-top:16px;">
                Use your referral link displayed here and the promo materials in order to attract new members to our program, you'll get an opportunity to earn extra 15% from the sum of the deposits made by your referral structure!
                <a href="?a=referallinks" class="blue-btn-acc promo">Show Promo Materials</a></div>
            </div>
        </div>  
             

      {include file="footer.tpl"}
  