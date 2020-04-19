{include file="mheader.tpl"}

    	<div class="cabinet-box left">
            <div class="info-block">
                <div class="title"><div class="icon icon-2"></div>Your Referrals:</div>
                                <div class="info-tr first">Your upline is: <span class="right"><a href=mailto:{$upline.email}>{$upline.name}</a></span></div>
                                <div class="info-tr">Referrals: <span class="right">{$total_ref}</span></div>
                <div class="info-tr">Active referrals: <span class="right">{$active_ref}</span></div>
                <div class="info-tr">Total referral commission: <span class="right">{$currency_sign}{$commissions}</span></div>

            </div>   
    	</div> 

    	<div class="cabinet-box right">
            <div class="info-block">
                <div class="title"><div class="icon icon-5"></div>Information:</div>
                <div class="info-tr first">
                <p>Use your referral link displayed here and the promo materials in order to attract new members to our program, you'll get an opportunity to earn extra 15% from the sum of the deposits made by your referral structure!</p>
                
                <div style="padding-top: 18px;">Use the promotional materials and invite your friends.</div>
                </div>
                <div class="info-tr btn-tr"><a href="?a=referallinks" class="blue-btn-acc">Show Promo Materials</a></div>
            </div>   
    	</div> 



{include file="mfooter.tpl"}