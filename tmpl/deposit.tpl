{include file="mheader.tpl"}

{if $fatal}

{if $fatal == 'one_per_month'}
You can deposit once a month only.
{/if}

{else}

{literal}
<script language="javascript"><!--
function openCalculator(id)
{

  w = 225; h = 400;
  t = (screen.height-h-30)/2;
  l = (screen.width-w-30)/2;
  window.open('?a=calendar&type=' + id, 'calculator' + id, "top="+t+",left="+l+",width="+w+",height="+h+",resizable=1,scrollbars=0");

{/literal}
  {if $qplans > 1}
{literal}
  for (i = 0; i < document.spendform.h_id.length; i++)
  {
    if (document.spendform.h_id[i].value == id)
    {
      document.spendform.h_id[i].checked = true;
    }
  }
{/literal}
  {/if}
{literal}

}

function updateCompound() {
  var id = 0;
  var tt = document.spendform.h_id.type;
  if (tt && tt.toLowerCase() == 'hidden') {
    id = document.spendform.h_id.value;
  } else {
    for (i = 0; i < document.spendform.h_id.length; i++) {
      if (document.spendform.h_id[i].checked) {
        id = document.spendform.h_id[i].value;
      }
    }
  }

  var cpObj = document.getElementById('compound_percents');
  if (cpObj) {
    while (cpObj.options.length != 0) {
      cpObj.options[0] = null;
    }
  }

  if (cps[id] && cps[id].length > 0) {
    document.getElementById('coumpond_block').style.display = '';

    for (i in cps[id]) {
      cpObj.options[cpObj.options.length] = new Option(cps[id][i]);
    }
  } else {
    document.getElementById('coumpond_block').style.display = 'none';
  }
}
var cps = {};
--></script>

<!---------
 <script type="text/javascript">
              $(document).ready(function(){
                 $('.dep-btn').click(function(){
                    $('.dep-btn').removeClass('selected');
                    $(this).addClass('selected');	 
                    id='#body'+$(this).attr("id").substr(2);
                    if ($(id).css("display")=="none") {
                      $('.dep-panel').slideUp('normal');
                      $(id).slideToggle('normal');
                    }
                    else $('.dep-panel').slideUp('normal');
                    return false;
                 });
              });
            </script>
			------>
            
{/literal}

{if $frm.say eq 'deposit_success'}
<h1>The deposit has been successfully saved.</h1>
<br><br>
{/if}

{if $frm.say eq 'deposit_saved'}
<h1>The deposit has been saved. It will become active when the administrator checks statistics.</h1><br><br>
{/if}

<h1>Make a Deposit:</h1>
<br>
<form method=post name="spendform" class="account_full_form">
<input type=hidden name=a value=deposit>



    	<div class="cabinet-box left">
            <div class="info-block">
                <div class="title" style="padding-bottom:0px;"><div class="icon icon-6"></div>
				 {if $qplans > 1} Select a plan:{/if}</div>




<div class="dep-block">
{section name=plans loop=$plans}
<div class="dep-box dep-{$plans[plans].id}">
	<div class="first-box">
	<input type=radio name=h_id value='{$plans[plans].id}' {if (($smarty.section.plans.first == 1) && ($frm.h_id eq '')) || ($frm.h_id == $plans[plans].id)} checked {/if} onclick="updateCompound()"> 
    <input type=hidden name=allow_internal_{$plans[plans].id} value={$plans[plans].id}>
    <input type=hidden name=allow_external_{$plans[plans].id} value={$plans[plans].id}>
	</div>
 <!-------   <div class="dep-name" style="font-size:20px; padding-top:10px;">
	------->
<div class="dep-name">	{$plans[plans].name}</div>
	<span class="dep-btn" id="sp_{$plans[plans].id}">Show Plan Details</span>

</div>

<div class="dep-panel panel-1" id="body_1">
{section name=options loop=$plans[plans].plans}
            <div class="dep-tr">{$plans[plans].plans[options].deposit}: <span class="right">{$plans[plans].plans[options].percent}% </span></div>
        {/section}
		{if $settings.enable_calculator}
        <div class="dep-tr">Profit Calculator: <span class="right"><a href="javascript:openCalculator('{$plans[plans].id}')">Calculate your profit &gt;&gt;</a></span></div>
        {/if}


</div>
<script>
cps[{$plans[plans].id}] = {$plans[plans].compound_percents_json};
</script>
{/section}

</div>


            </div>   
    	</div> 

	<div class="cabinet-box right">
            <div class="form account_form">
                <div class="title" style="padding-bottom:30px;"><div class="icon icon-1"></div>Select Details:</div>

<div class="form-field info-tr first">Account Balance: 
            <span class="right">{$currency_sign}{$ab_formated.total}
            <a class="tooltip bal_tip dep_page">
               <span class="classic_tooltip radius3"> 
			   Account Balance <br>
                            {section name=p loop=$ps}
   {if $ps[p].balance > 0}{$currency_sign}{$ps[p].balance} of {$ps[p].name}{if $hold[p].amount > 0} / {$currency_sign}{$hold[p].amount} on hold{/if}<br>{/if}
{/section}
                              </span>
            </a>
            </span> 
</div>
<div class="form-field" style="margin-bottom:10px;">
	<label>Amount to Spend ($): <span class="star">*</span></label>
	<input type=text name=amount value='{$min_deposit}' class=inpts size=15>
</div>
<div class="form-field" id="coumpond_block" style="display:none">
	<label>Compounding(%): <span class="star">*</span></label>
	<select name="compound" class="inpts select" id="compound_percents"></select>
</div>


     {section name=p loop=$ps}
   {if $ps[p].balance > 0 and $ps[p].status == 1}                                                                         
         <div class="form-field radio-field">
	<input type=radio name=type  value="account_{$ps[p].id}" >
	Spend funds from the Account Balance {$ps[p].name}
</div>   {/if}
{/section}
{section name=p loop=$ps}
   {if $ps[p].status}
                                                   <div class="form-field radio-field">
	<input type=radio name=type value="process_{$ps[p].id}" {if $smarty.section.p.index == 0}checked{/if} >
	Spend funds from {$ps[p].name}
</div>   {/if}
{/section}
                 
         
<div class="form-field">   
	<input type=submit value="Spend" class=sbmt>
</div>

            </div>   
    	</div>
</form>
{literal}
<script language=javascript>
for (i = 0; i<document.spendform.type.length; i++) {
  if ((document.spendform.type[i].value.match(/^process_/))) {
    document.spendform.type[i].checked = true;
    break;
  }
}
updateCompound();
</script>
{/literal}

{/if}
{include file="mfooter.tpl"}