<div class="content-view-full">
    <div class="class-file">
        {if $node.data_map.image.has_content}
        <div class="attribute-image">
            {attribute_view_gui alignment=right image_class=medium attribute=$node.data_map.image}
            {*
            <p>
                <a href="#">Klikk for større bilde</a>
            </p>
            *}
        </div>
        {/if}

        <h1>{$node.data_map.name.content|wash()}</h1>

        {if $node.data_map.description.has_content}
        <div class="attribute-short">
            {attribute_view_gui attribute=$node.data_map.description}
        </div>
        {/if}

        <div class="attribute-file">
            <p>{attribute_view_gui attribute=$node.data_map.file title='Last ned'}</p>
        </div>
    </div>
</div>
