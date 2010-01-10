{* Article - Line view *}
<div class="content-view-line">
    <div class="class-article">
        {if $node.data_map.image.has_content}
        <div class="attribute-image">
            {attribute_view_gui alignment=left image_class=thumbnail attribute=$node.data_map.image.content.data_map.image}
        </div>
        {/if}

        <h2><a href={$node.url_alias|ezurl}>{$node.data_map.title.content|wash}</a></h2>

        {if $node.data_map.intro.has_content}
        <div class="attribute-short">
            {attribute_view_gui attribute=$node.data_map.intro}
        </div>
        {/if}

        {if $node.data_map.body.has_content}
        <div class="attribute-link">
            <p><a href={$node.url_alias|ezurl}>{"Read more..."|i18n("design/base")}</a></p>
        </div>
        {/if}

    </div>
    <div class="clear"></div>
</div>
