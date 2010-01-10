<div class="content-view-line">
    <div class="class-file">
        
        {if $node.data_map.image_relation.has_content} 
            <div class="attribute-image">
                {attribute_view_gui alignment=left image_class=thumbnail attribute=$node.data_map.image_relation.content.data_map.image} 
            </div>
        {elseif $node.data_map.image.has_content}
            <div class="attribute-image">
                {attribute_view_gui alignment=left image_class=thumbnail attribute=$node.data_map.image}
            </div>
        {/if}
        
        <h2><a href={$node.url_alias|ezurl}>{$node.name|wash}</a></h2>

        <div class="attribute-short">
            {attribute_view_gui attribute=$node.data_map.description}
        </div>

        <!--
        <div class="attribute-file">
            <p>{attribute_view_gui attribute=$node.data_map.file icon_size='small' icon_title=$node.name}</p>
        </div>
        -->

        <div class="attribute-link">
            <p><a href={$node.url_alias|ezurl}>{'Last ned'|i18n( 'design/base' )}</a></p>
        </div>

    </div>
    <div class="clear"></div>
</div>
