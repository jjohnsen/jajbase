{set $depth=inc($depth)}
<ul class="{concat( 'menu-level-', $depth)}">
    {foreach $items as $index => $item}
        {def $li_class=array( concat( 'menu-level-', $depth) )}
        {def $a_class=array()}

        {if eq( 0, $index )}{set $li_class=$li_class|append("first")}{/if}
        {if eq( count($items), sum( $index, 1 ) )}{set $li_class=$li_class|append("last")}{/if}
        {if eq( $module_result.node_id, $item.node_id )}
            {set $li_class=$li_class|append("selected")}
            {set $a_class=$a_class|append("selected")}
        {/if}
        {if eq( $module_result.path[$depth].node_id, $item.node_id )}
            {set $li_class=$li_class|append("in-path")}
        {/if}

        <li class="{$li_class|implode(" ")}">
            <a href={$item.url_alias|ezurl} class="{$a_class|implode(" ")}">
                <span>{$item.name|wash()}</span>
            </a>
            
            {if $depth|lt($max_depth)}
                {def $menuitems=fetch( content, list, hash( parent_node_id, $item.node_id,
                                                class_filter_type, include,
                                                class_filter_array, $class_filter,
                                                sort_by, $item.sort_array ) )}
                    {if $menuitems|count()|gt(0)}
                        {include name=concat( 'menu-level-', $depth) uri='design:menu/menu_items.tpl' items=$menuitems depth=$depth max_depth=$max_depth class_filter=$class_filter}
                    {/if}
                {undef $menuitems}
            {/if}
        </li>

        {undef $li_class $a_class}
    {/foreach}
</ul>
