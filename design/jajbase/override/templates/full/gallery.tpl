<div class="content-view-full">
    <div class="class-gallery">

        <h1>{$node.name|wash()}</h1>

        <div class="attribute-short">
           {attribute_view_gui attribute=$node.data_map.short_description}
        </div>

        <div class="attribute-long">
           {attribute_view_gui attribute=$node.data_map.description}
        </div>

        {let page_limit=24
             children=fetch_alias( children, hash( parent_node_id, $node.node_id,
                                                   offset, $view_parameters.offset,
                                                   limit, $page_limit,
                                                   sort_by, $node.sort_array ) )
             list_count=fetch_alias( children_count, hash( parent_node_id, $node.node_id ) )}

        {section show=$children}
           <div class="content-view-children">
               <table>
               <tr>
               {section var=child loop=$children sequence=array( bglight, bgdark )}
                   <td>
                      {node_view_gui view=galleryline content_node=$child}
                   </td>
                   {delimiter modulo=4}
                   </tr>
                   <tr>
                   {/delimiter}
               {/section}
               </tr>
               </table>
           </div>
        {/section}

        {include name=navigator
                 uri='design:navigator/google.tpl'
                 page_uri=concat( '/content/view', '/full/', $node.node_id )
                 item_count=$list_count
                 view_parameters=$view_parameters
                 item_limit=$page_limit}
        {/let}

        <div class="button-row">
            <div class="button-left">
                <a href={$node.parent.url_alias|ezurl}><span>&laquo;&nbsp; {$node.parent.name|wash}</span></a>
            </div>
            <div clas="clear"></div>
        </div>
    </div>
</div>
