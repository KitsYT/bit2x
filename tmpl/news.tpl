{include file="logo.tpl"}


<div id="contentWrapper">
	<div id="content">
        
    	<div class="content-box">
            <div class="big-title">Company News</div>

                    <div class="page-news-block">
                                                                       
                                                 	                       
                                                 


{if $news}
{section name=s loop=$news}

												 <div class="news-box">
                                <div class="icon"><img src="theme/images/news/news-1.png" width="110px" height="110px"></div>
                                <div class="date"></div>
                                <div class="title"><a name="1"></a>{$news[s].title}</div>
                                <div class="text"><p> {$news[s].full_text}<p></div>
                         	</div>  
{/section}
{else}

 <div class="news-box">
                                <div class="icon"><img src="theme/images/news/news-1.png" width="110px" height="110px"></div>
                                <div class="date"></div>
                                <div class="title"><a name="1"></a>No news found</div>
                                <div class="text"><p> Visit this page regularly to keep yoruself updated about latest company news & updates.<p></div>
                         	</div> {/if}


{if $colpages > 1}
<center>
{if $prev_page > 0}
 <a href="?a=news&page={$prev_page}">&lt;&lt;</a>
{/if}
{section name=p loop=$pages}
{if $pages[p].current == 1}
{$pages[p].page}
{else}
 <a href="?a=news&page={$pages[p].page}">{$pages[p].page}</a>
{/if}
{/section}
{if $next_page > 0}
 <a href="?a=news&page={$next_page}">&gt;&gt;</a>
{/if}
</center>
{/if}

							
                                            </div>
                    
                    
                    
                    
                    

        </div>

	</div> 
</div>
{include file="footer.tpl"}