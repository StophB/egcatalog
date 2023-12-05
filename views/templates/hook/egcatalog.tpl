<!-- Block egcatalog -->
<div id="egcatalog" class="block">
    <h4>{l s='pages' d='Modules.Egcatalog'}</h4>
    <div class="block_content">
        {foreach from=$pages item=pageInfo}
            <a href="{$link}?page={$pageInfo.Page}">Page {$pageInfo.Page}</a>
            <br>
        {/foreach}
    </div>
</div>
<!-- /Block egcatalog -->

