{if $attribute.has_content}
    {if is_set($title)|not()}
        {def $title=$attribute.content.original_filename|wash(xhtml)}
    {/if}
    {if is_set($icon_size)|not()}
        {def $icon_size='small'}
    {/if}
    {if is_set($icon_title)|not()}
        {def $icon_title=$attribute.content.original_filename|wash}
    {/if}

    {*
    {if $icon|eq(no)|not()}
        {$attribute.content.mime_type|mimetype_icon( $icon_size, $icon_title )}
    {/if}
    *}
    <a href={concat("content/download/",$attribute.contentobject_id,"/",$attribute.id,"/file/",$attribute.content.original_filename)|ezurl}>
        {$title}
    </a>
    ({$attribute.content.filesize|si(byte)})
{/if}
