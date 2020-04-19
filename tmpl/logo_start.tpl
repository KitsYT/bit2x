<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>{$settings.site_name}</title>
	
	<link href="theme/css/global.css" rel="stylesheet" type="text/css">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
	<script type="text/javascript" src="theme/js/jquery-1.8.3.min.js"></script>
</head>

<body>
<div id="bodyWrapper">	


    <div id="headerWrapper">
    	<div id="header">


            <div id="top-header">
            
                <a href="?a=home" class="logo"></a>
                
                <div class="lang">
                    <a href="?language=en" class="en active"></a>
                    <a href="?language=ru" class="ru"></a>
                </div>
                
                <div class="login-block">
                 {if $userinfo.logged != 1}   <ul>
                                                <a href="?a=login" class="login-btn">Login to account</a>
                        <a href="?a=signup" class="reg-btn">Register account</a>
                                            </ul> {else}<ul>
                                                <a href="?a=logout" class="login-btn">Logout</a>
                        <a href="?a=account" class="account-btn">Account</a>
                                            </ul>{/if}
                </div> 
                
			    <div class="tell"><span>Have questions? Please contact us:</span> <a href="?a=support" class="last">customer support</a></div>
                
            </div>
            
            <div id="top-menu-wrapper">
                <div class="top-menu">
                    <ul>
                        <li><a href="?a=home" class="first">Home Page</a></li>
                        <li class="separator"></li>
                        <li><a href="?a=page&id=about_us">About us</a></li>
                        <li class="separator"></li>
                        <li><a href="?a=news">Our News</a></li>
                        <li class="separator"></li>
                        <li><a href="?a=page&id=for_investors">For Investors</a></li>
                        <li class="separator"></li>
                        <li><a href="?a=page&id=for_partners">For Partners</a></li>
                        <li class="separator"></li>
                        <li><a href="?a=faq">Questions</a></li>
                        <li class="separator"></li>
                        <li><a href="?a=support" class="last">Support</a></li>
                    </ul>   
                </div>
            </div>
            
            
        </div>
    </div>