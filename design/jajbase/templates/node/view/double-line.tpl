<div class="class-node">
    {if $node.data_map.source.has_content}
    <h3>{$node.data_map.source.content|wash()}:</h3>
    {/if}
    <a href={$node.url_alias|ezurl}>{$node.name|wash}</a>
</div>
