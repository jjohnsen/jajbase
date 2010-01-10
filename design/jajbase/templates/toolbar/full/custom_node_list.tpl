{def $show=true()}
{if and($show_in_text, $show_in_text|explode(',')contains( $module_result.node_id )|not())}
  {set $show=false()}
{/if}
{if and($hide_in_text, $hide_in_text|explode(',')contains( $module_result.node_id ))}
  {set $show=false()}
{/if}

{if $show}
{cache-block}
{def    $parent_node=fetch( 'content', 'node', hash( 'node_id', $parent_node ) )
        $children=fetch( 'content', 'list', 
            hash(
                'parent_node_id',   $parent_node.node_id,
                'sort_by',          $parent_node.sort_array,
                'limit',            $limit
            )
        )

}

<div class="toolbar-item {$placement}">
  <div class="toolbox toolbox-custom-node-list">
    <div class="toolbox-design">
      <h2>{$title|wash()}</h2>

      <div class="toolbox-content">
        <div class="content-view-children">
        {foreach $children as $child}
            <div class="content-view-line">
                {node_view_gui view='double-line' content_node=$child}
            </div>
        {/foreach}
        </div>

        <div class="parent-node">
            <a href={$parent_node.url_alias|ezurl}>Flere saker</a>
        </div>
      </div>
    </div>
  </div>
</div>
{undef $parent_node}
{/cache-block}
{/if}
{undef $show}

