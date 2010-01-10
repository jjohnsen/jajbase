{if $node.data_map.location.data_text|count|eq(0)}
    {if $node.data_map.location.content|count|gt(45)}
        {def $title=$node.data_map.location.content|wash|shorten( 45, '...' , 'middle' )}
    {else}
        {def $title=$node.data_map.location.content|wash}
    {/if}
{else}
    {def $title=$node.data_map.location.data_text|wash}
{/if}

<div class="content-view-line">
    <div class="class-link">

       {if $node.data_map.image.has_content}
        <div class="attribute-image">
            {attribute_view_gui alignment=left image_class=thumbnail attribute=$node.data_map.image.content.data_map.image}
        </div>
        {/if}

        <h2>
            <a href={$node.data_map.location.content|ezurl}{if $node.data_map.new_window.content}target="_blank"{/if}>{$node.name|wash}</a>
        </h2>

        {if $node.data_map.description.has_content}
        <div class="attribute-long">
            {attribute_view_gui attribute=$node.data_map.description}
        </div>
        {/if}

        {if $node.data_map.location.has_content}
        <div class="attribute-link">
            <p>
                <a href={$node.data_map.location.content|ezurl}{if $node.data_map.new_window.content}target="_blank"{/if}>{$title}</a>
            </p>
        </div>
        {/if}
    </div>
    <div class="clear"></div>
</div>

{undef $title}
