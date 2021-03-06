<!doctype html>
<html>
<head>
    <meta charset='utf-8'>
    <title>OpenClonk League</title>
    <link rel="stylesheet" type="text/css" href="league.css">
</head>
<body>

{config_load "main.conf"}
{fetch file=#header#}

<div id='wrapper'>
<div id='content'>

{include file='header.tpl'}

{include file='message_box.tpl'}

{if 'scenario'==$part}
    {if 'list'==$method || 'toggle_league'==$method}
        {include file='scenario_list.tpl'}
    {/if}
{elseif 'league'==$part}
    {if 'list'==$method}
        {include file='league_list.tpl'}
    {else if 'ranking'==$method || 'clan_ranking'==$method}
        {include file='league_ranking.tpl'}
    {/if}
{elseif 'game'==$part}
    {if 'list'==$method}
        {include file='game_list.tpl'}
    {else if 'details'==$method}
        {include file='game_details.tpl'}
    {/if}
{elseif 'clan'==$part}
    {if 'list'==$method}
        {include file='clan_list.tpl'}
    {elseif 'details'==$method}
        {include file='clan_details.tpl'}
    {elseif 'add'==$method}
        {include file='clan_add_edit.tpl'}
    {elseif 'add2'==$method}
        {include file='clan_list.tpl'}
    {elseif 'edit'==$method}
        {include file='clan_add_edit.tpl'}
    {elseif 'edit2'==$method}
        {include file='clan_add_edit.tpl'}
    {elseif 'delete2'==$method}
        {include file='clan_list.tpl'}
    {elseif 'join'==$method}
        {include file='clan_list.tpl'}
    {elseif 'leave'==$method}
        {include file='clan_list.tpl'}
    {elseif 'kick'==$method}
        {include file='clan_list.tpl'}
    {elseif 'transfer_founder'==$method}
        {include file='clan_list.tpl'}
    {/if}
{elseif 'user'==$part}
    {if 'details'==$method || 'set_score'==$method}
        {include file='user_details.tpl'}
    {elseif 'list'==$method}
        {include file='user_list.tpl'}
    {elseif 'login'==$method || !$user_logged_in}
        {include file='login.tpl'}
    {elseif 'edit'==$method || 'suicide'==$method}
    	<div>
        {include file='user_details.tpl'}
        {include file='user_edit.tpl'}
        </div>
    {elseif 'edit2'==$method}
        {include file='user_edit.tpl'}
    {/if}
{elseif 'login'==$part}
    {if 'error' == $method}
        {include file='login.tpl'}
    {elseif 'new_user' == $method}
        {include file='login.tpl' new_user=1}
    {/if}
{/if}

{if 'invalid'==$part || 'invalid'==$method}
    <p>
        <b>Not found</b>
    </p>
{/if}

</div>
</div>

<div id='navbar'>
<div class='languages'>
    [ <a href='?lang=de'><img src='images/de.png' alt='Deutsch'></a>
    | <a href='?lang=en'><img src='images/us.png' alt='English'></a> ]
</div>
</div>

{fetch file=#footer#}

</body>
</html>
