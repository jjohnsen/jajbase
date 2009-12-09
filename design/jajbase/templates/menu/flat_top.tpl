{def $root_node=fetch( content, node, hash( node_id, 2 ) )
     $class_filter=ezini( 'MenuContentSettings', 'TopIdentifierList', 'menu.ini' )
     $menuitems=fetch( content, list, hash( parent_node_id, 2,
                                            class_filter_type, include,
                                            class_filter_array, $class_filter,
                                            sort_by, $root_node.sort_array ) )
     $depth=0
     $max_depth=1
}

{if ezini( 'TopMenu', 'TreeDepth', 'menu.ini' )}
    {set $max_depth=ezini( 'TopMenu', 'TreeDepth', 'menu.ini' )}
{/if}

{if ezini( 'MenuSettings', 'HideRootNode', 'menu.ini' )|eq('true')|not()}
    {set $menuitems=$menuitems|prepend($root_node)}
{/if}


<div id="top-menu-{if $max_depth|gt(1)}flat{else}flat{/if}" class="{$class}">
    <div id="top-menu-design">

    <h3 class="hide">{"Top menu"|i18n("design/base")}</h3>

    {if $menuitems|count|gt(0)}
        {include name=concat( 'menu-level-', $depth) uri='design:menu/menu_items.tpl' items=$menuitems depth=$depth max_depth=$max_depth class_filter=$class_filter} 
    {/if}

	<div class="break"></div>
    </div>
</div>

<hr class="hide" />

{undef $root_node $menuitems $depth $max_depth $class_filter}
