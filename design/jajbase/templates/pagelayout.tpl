<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

{def    
    $column-count=24
    $left-column-span=5
    $right-column-span=6
    $content-column-span=$column-count|sub($left-column-span, $right-column-span)
}

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$site.http_equiv.Content-language|wash}" lang="{$site.http_equiv.Content-language|wash}">
	<head>
		{include uri='design:page_head.tpl'}
		<link rel="stylesheet" href={"stylesheets/blueprint/screen.css"|ezdesign} type="text/css" media="screen, projection">
    	<link rel="stylesheet" href={"stylesheets/blueprint/print.css"|ezdesign} type="text/css" media="print">
		<!--[if lt IE 8]>
      			<link rel="stylesheet" href={"stylesheets/blueprint/ie.css"|ezdesign} type="text/css" media="screen, projection">
        <![endif]-->
        <link rel="stylesheet" href={"stylesheets/site.css"|ezdesign} type="text/css" media="screen, projection">
        <link rel="stylesheet" href={"stylesheets/base.css"|ezdesign} type="text/css" media="screen, projection">
        <link rel="stylesheet" href={"stylesheets/content.css"|ezdesign} type="text/css" media="screen, projection">
        {include uri='design:analytics.tpl'}
	</head>

	<body id="content-node-{first_set( $module_result.node_id, 0 )}">
            
        <div id="main-wrapper">
            <div id="main-wrapper-top"></div>

            <div class="container" id="main">
                {cache-block keys=$uri_string}
                <div id="header-container" class="span-{$column-count}">
                    <div id="header">
                        {def $pagedesign=fetch_alias(by_identifier,hash(attr_id,sitestyle_identifier))}
                        {if $pagedesign.data_map.image.content.is_valid}
                            <a href={"/"|ezurl}><img src={$pagedesign.data_map.image.content[original].full_path|ezroot} alt="{$pagedesign.data_map.image.content[original].text}" /></a>
                        {/if}
                        {undef $pagedesign}
                    </div>
                </div>{* #header-container *}
            
        		<div id="top-menu-container" class="span-{$column-count}">
                    <div class="span-19 prepend-5 last">
    	    	    	{include uri=concat( 'design:menu/', ezini( 'SelectedMenu', 'TopMenu', 'menu.ini' ), '.tpl' ) class=""}
                    </div>
   	    	    </div>{* #top-menu-container *}

                <div id="page-container" class="span-{$column-count}">
                    <div id="left-column-container" class="span-{$left-column-span}">
                        {include uri=concat( 'design:menu/', ezini( 'SelectedMenu', 'LeftMenu', 'menu.ini' ), '.tpl' )}
                    </div>
                {/cache-block}
                    <div id="content-column-container" class="span-{$content-column-span}">
                        <div id="content-column">
    	        	        {$module_result.content}
                        </div>
                    </div>
                
                    <div id="right-column-container" class="span-{$right-column-span} last">
                        <div id="right-column">
                            {tool_bar name=right view=full}
                        </div>
                    </div>

                    <div id="page-container-bottom"></div>
                </div>{* #page-container *}

                <div id="footer-container" class="span-{$column-count}">
                    <div id="footer-top"></div>
                    <div id="footer" class="span-19 prepend-5 last">
                        {cache-block}
                            {def $pagedesign=fetch_alias(by_identifier,hash(attr_id,sitestyle_identifier))}
                            {attribute_view_gui attribute=$pagedesign.data_map.footer}
                            {undef $pagedesign}
                        {/cache-block}
                    </div>
                </div>{* #footer-container *}

            </div> {* #main *}
            
            <div id="main-wrapper-bottom"></div>
        <div id="byline" class="span-24 last">
            Design: <a href="http://www.ideverkstedet.no" target="_blank">IDÉverkstedet</a> - Utvikling: <a href="http://www.hikt.no" target="_blank">Hålogaland ikt</a>
        </div>
        </div>{* #main-wrapper *}
	</body>
</html>
