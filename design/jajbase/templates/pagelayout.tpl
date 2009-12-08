<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

{def    
    $column-count=30
    $left-column-span=7
    $right-column-span=10
    $content-column-span=32|sub($left-column-span, $right-column-span)
}

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$site.http_equiv.Content-language|wash}" lang="{$site.http_equiv.Content-language|wash}">
	<head>
		{include uri='design:page_head.tpl'}
		<link rel="stylesheet" href={"stylesheets/blueprint/screen.css"|ezdesign} type="text/css" media="screen, projection">
    	<link rel="stylesheet" href={"stylesheets/blueprint/print.css"|ezdesign} type="text/css" media="print">
		<!--[if lt IE 8]>
      			<link rel="stylesheet" href={"stylesheets/blueprint/ie.css"|ezdesign} type="text/css" media="screen, projection">
        <![endif]-->
        <link rel="stylesheet" href={"stylesheets/base.css"|ezdesign} type="text/css" media="screen, projection">
        <link rel="stylesheet" href={"stylesheets/site.css"|ezdesign} type="text/css" media="screen, projection">
	</head>

	<body id="content-node-{first_set( $module_result.node_id, 0 )}">
            
        <div id="main-top" style="position: top"></div>

        <div class="shadow-container" style="width:980px;margin:0 auto;">

        <div class="bp-container" id="main">
        <div class="bp-span-32 last">

            <div id="header-container" class="span-32">
                <div id="header">
                    {cache-block}
                    {def $pagedesign=fetch_alias(by_identifier,hash(attr_id,sitestyle_identifier))}
                    {if $pagedesign.data_map.image.content.is_valid}
                        <a href={"/"|ezurl}><img src={$pagedesign.data_map.image.content[original].full_path|ezroot} alt="{$pagedesign.data_map.image.content[original].text}" /></a>
                    {/if}
                    {undef $pagedesign}
                    {/cache-block}
                </div>
            </div>
            
    		<div id="top-menu-container" class="bp-span-32">
                <div class="bp-span-7">.</div>
                <div class="bp-span-24">
	    		{include uri=concat( 'design:menu/', ezini( 'SelectedMenu', 'TopMenu', 'menu.ini' ), '.tpl' )}
                </div>
                <div class="bp-span-1 bp-last">-</div>
   		    </div>

            <div id="page-container" class="bp-span-24">
                <div id="left-column-container" class="bp-span-{$left-column-span}">
                    Left column
                </div>

                <div id="content-column-container" class="bp-span-{$content-column-span}">
	    	        {$module_result.content}
                </div>
                
                <div id="right-column-container" class="bp-span-{$right-column-span} bp-last">
                    Right column
                </div>
            </div>

            <div id="footer-container" class="span-24">
                <div id="footer">
                    {cache-block}
                        {def $pagedesign=fetch_alias(by_identifier,hash(attr_id,sitestyle_identifier))}
                        {attribute_view_gui attribute=$pagedesign.data_map.footer}
                        {undef $pagedesign}
                    {/cache-block}
                </div>
            </div>
        </div>
        </div>
        </div>{* End of #main *}

        <div id="main-bottom"></div>  
	</body>
</html>
