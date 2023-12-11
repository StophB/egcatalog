{extends file=$layout}

<!-- Block egcatalog -->
{block name="content"}
    <div class="row">
        <!-- /egcatalog sidebar -->
        <div class="col-md-3">
            <aside id="sidebar">
                <div id="egcatalog" class="block">
                    <h4>{l s='Pages ' mod='egcatalog'}</h4>
                    <div class="block_content" id="pagesContainer">
                        {foreach from=$fiftyPages item=pageInfo}
                            <a href="{$link}?page={$pageInfo.Page|escape:'htmlall':'UTF-8'}">{l s='Page ' mod='egcatalog'}{$pageInfo.Page|escape:'htmlall':'UTF-8'}</a>
                            <br>
                        {/foreach}
                        <button class="btn btn-primary btn-sm mt-1" id="showMoreBtn">{l s='Show More' mod='egcatalog'}</button>
                    </div>
                    <div class="block_content" id="allPagesContainer" style="display: none;">
                        {foreach from=$pages item=pageInfo}
                            <a href="{$link}?page={$pageInfo.Page|escape:'htmlall':'UTF-8'}">{l s='Page ' mod='egcatalog'}{$pageInfo.Page|escape:'htmlall':'UTF-8'}</a>
                            <br>
                        {/foreach}
                        <button class="btn btn-primary btn-sm mt-1" id="showLessBtn">{l s='Show Less' mod='egcatalog'}</button>
                    </div>
                </div>
            </aside>
        </div>
        <!-- /egcatalog sidebar -->

        <!-- egcatalog products -->
        <div class="col-md-9">
            <section id="products">
                <div id="js-product-list">
                    <div class="products row">
                        {foreach from=$products item=product}
                            {if count($product) > 1}
                            <div class="js-product product col-xs-12 col-sm-6 col-xl-4">
                                <article class="product-miniature js-product-miniature" data-id-product="10" data-id-product-attribute="24">
                                    <div class="thumbnail-container reviews-loaded">
                                        <div class="thumbnail-top">
                                            <a href="#" class="thumbnail product-thumbnail">
                                                <img src="https://fournisseur.centrale-medicalliance.fr/modules/marketplace/views/img/visuels/{$product[0].VISUEL_1|escape:'htmlall':'UTF-8'}.128.png" alt="{$product[0].LIBELLE_CAT|escape:'htmlall':'UTF-8'}" data-full-size-image-url="" width="250" height="250" />
                                            </a>
                                        </div>

                                        <div class="product-description">
                                            <h2 class="">
                                                <a href="#" content="#">{$product[0].LIBELLE_CAT|escape:'htmlall':'UTF-8'}</a>
                                            </h2>

                                            <p>{$product[0].DESCRIPTIF_PRODUIT|escape:'htmlall':'UTF-8'|truncate:80:"..."}</p>

                                            {foreach from=$product item=item}
                                                <div class="d-flex justify-content-between">
                                                    <span class="mr-2" aria-label="">{strtoupper($item.Ordre_de_visuel|escape:'htmlall':'UTF-8')}</span>
                                                    <span class="pl-2" aria-label="">{$item.Descriptif_complementaire|escape:'htmlall':'UTF-8'}</span>
                                                </div>
                                            <div class="d-flex justify-content-between">
                                                <span class="reference mr-3" aria-label="Reference">{l s='Ref: ' mod='egcatalog'}{$item.REFERENCE|escape:'htmlall':'UTF-8'}</span>
                                                <span class="price" aria-label="Price">{$item.price_formatted|escape:'htmlall':'UTF-8'}</span>
                                            </div>
                                            {if isset($item.Soit_a_lunite) && !empty($item.Soit_a_lunite|escape:'htmlall':'UTF-8')}
                                            <div class="">
                                                <span class="reference mr-3" aria-label="Reference"><small>{l s='Soit à l’unité: ' mod='egcatalog'}</small></span>
                                                <span class="price pl-3" aria-label="Price"><small>{$item.price_formatted2|escape:'htmlall':'UTF-8'}</small></span>
                                            </div>
                                            {/if}
                                                <div>
                                                    <a class="btn btn-primary" href="{$updateLink|escape:'htmlall':'UTF-8'}?page={$item.Page}&prd={$item.Ordre_de_page|escape:'htmlall':'UTF-8'}&decli={$item.Ordre_de_visuel|escape:'htmlall':'UTF-8'}">{l s='UPDATE' mod='egcatalog'}</a>
                                                </div>
                                            {/foreach}

                                        </div>
                                    </div>
                                </article>
                            </div>
                            {else}
                            <div class="js-product product col-xs-12 col-sm-6 col-xl-4">
                                <article class="product-miniature js-product-miniature">
                                    <div class="thumbnail-container reviews-loaded">
                                        <div class="thumbnail-top">
                                            <a href="#" class="thumbnail product-thumbnail">
                                                <img src="https://fournisseur.centrale-medicalliance.fr/modules/marketplace/views/img/visuels/{$product[0].VISUEL_1|escape:'htmlall':'UTF-8'}.128.png" alt="{$product[0].LIBELLE_CAT|escape:'htmlall':'UTF-8'}" data-full-size-image-url="" width="250" height="250" />
                                            </a>
                                        </div>
                                        <div class="product-description">
                                            <h2 class="">
                                                <a href="#" content="#">{$product[0].LIBELLE_CAT|escape:'htmlall':'UTF-8'}</a>
                                            </h2>
                                            <p>{$product[0].DESCRIPTIF_PRODUIT|truncate:80:"..."|escape:'htmlall':'UTF-8'}</p>
                                            <div class="d-flex justify-content-between">
                                                <span class="reference mr-3" aria-label="Reference">{l s='Ref: ' mod='egcatalog'}{$product[0].REFERENCE|escape:'htmlall':'UTF-8'}</span>
                                                <span class="price" aria-label="Price">{$product[0].price_formatted|escape:'htmlall':'UTF-8'}</span>
                                            </div>
                                            {if isset($product[0].Soit_a_lunite) && !empty($product[0].Soit_a_lunite|escape:'htmlall':'UTF-8')}
                                            <div class="">
                                                <span class="reference mr-3" aria-label="Reference"><small>{l s='Soit à l’unité: ' mod='egcatalog'}</small></span>
                                                <span class="price pl-3" aria-label="Price"><small>{$product[0].price_formatted2|escape:'htmlall':'UTF-8'}</small></span>
                                            </div>
                                            {/if}
                                        </div>
                                        <div>
                                        <a class="btn btn-primary" href="{$updateLink|escape:'htmlall':'UTF-8'}?page={$product[0].Page|escape:'htmlall':'UTF-8'}&prd={$product[0].Ordre_de_page|escape:'htmlall':'UTF-8'}">{l s='UPDATE' mod='egcatalog'}</a>
                                        </div>
                                    </div>
                                </article>
                            </div>
                            {/if}
                        {/foreach}
                    </div>
                </div>
            </section>
        </div>
        <!-- /egcatalog products -->
    </div>
{/block}
<!-- Block egcatalog -->

