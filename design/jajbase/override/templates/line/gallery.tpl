<div class="content-view-line">
    <div class="class-gallery">
        {if $node.data_map.image.has_content}
            <div class="attribute-image">
                {attribute_view_gui alignment=left image_class=thumbnail attribute=$node.data_map.image.content.data_map.image}
            </div>
        {/if}
        
        <h2><a href={$node.url_alias|ezurl}>{$node.name|wash}</a></h2>

        <div class="attribute-short">
            {attribute_view_gui attribute=$node.data_map.short_description}
        </div>

        <div class="attribute-link">
            <p><a href={$node.url_alias|ezurl}>{"Enter gallery"|i18n("design/base")}</a></p>
        </div>

    </div>
    <div class="clear"></div>
</div>
