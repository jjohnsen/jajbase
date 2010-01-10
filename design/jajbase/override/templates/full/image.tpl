{* Image - Full view *}
{let sort_order=$node.parent.sort_array[0][1]
     sort_column=$node.parent.sort_array[0][0]
     sort_column_value=cond( $sort_column|eq( 'published' ), $node.object.published,
                             $sort_column|eq( 'modified' ), $node.object.modified,
                             $sort_column|eq( 'name' ), $node.object.name,
                             $sort_column|eq( 'priority' ), $node.priority,
                             $sort_column|eq( 'modified_subnode' ), $node.modified_subnode,
                             false() )
     previous_image=fetch_alias( subtree, hash( parent_node_id, $node.parent_node_id,
                                                class_filter_type, include,
                                                class_filter_array, array( 'image' ),
                                                limit, 1,
                                                attribute_filter, array( and, array( $sort_column, $sort_order|choose( '>', '<' ), $sort_column_value ) ),
                                                sort_by, array( array( $sort_column, $sort_order|not ), array( 'node_id', $sort_order|not ) ) ) )
     next_image=fetch_alias( subtree, hash( parent_node_id, $node.parent_node_id,
                                            class_filter_type, include,
                                            class_filter_array, array( 'image' ),
                                            limit, 1,
                                            attribute_filter, array( and, array( $sort_column, $sort_order|choose( '<', '>' ), $sort_column_value ) ),
                                            sort_by, array( array( $sort_column, $sort_order ), array( 'node_id', $sort_order ) ) ) )}

<div class="content-view-full">
    <div class="class-image">

        <h1>{$node.name|wash}</h1>

        <div class="pagenavigator">
            <span class="previous">
                {if $previous_image}
                    <a href={$previous_image[0].url_alias|ezurl} title="{$previous_image[0].name|wash}">&laquo;&nbsp; {'Previous image'|i18n( 'design/base' )}</a>
                {else}
                    &laquo;&nbsp; {'Previous image'|i18n( 'design/base' )}
                {/if}
            </span>
            <span class="next">
                {if $next_image}
                    <a href={$next_image[0].url_alias|ezurl} title="{$next_image[0].name|wash}">{'Next image'|i18n( 'design/base' )} &nbsp;&raquo;</a>
                {else}
                    {'Next image'|i18n( 'design/base' )} &nbsp;&raquo;
                {/if}
            </span>
            <span class="pages">
                <span class="other">
                    <a href={$node.data_map.image.content.original.url|ezurl} target="_blank">Last ned</a>
                </span>
            </span>
        </div>

        <div class="attribute-image">
            <p>{attribute_view_gui attribute=$node.data_map.image image_class=large alignment=center}</p>
        </div>

        <div class="attribute-large">
            {attribute_view_gui attribute=$node.data_map.caption}
        </div>

        <div class="button-row">
            <div class="button-left">
                <a href={$node.parent.url_alias|ezurl}><span>&laquo;&nbsp; {$node.parent.name|wash}</span></a>
            </div>
            <div clas="clear"></div>
        </div>
    </div>
</div>
{/let}
