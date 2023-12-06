{extends file=$layout}

<!-- Block egcatalog -->
{block name="content"}
    <div class="row">

        <!-- /egcatalog sidebar -->
        <div class="col-md-3">
            <aside id="sidebar">
                <div id="egcatalog" class="block">
                    <h4>{l s='pages ' d='Modules.Egcatalog'}</h4>
                    <div class="block_content">
                        {foreach from=$pages item=pageInfo}
                            <a href="{$link}?page={$pageInfo.Page}">Page {$pageInfo.Page}</a>
                            <br>
                        {/foreach}
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
                                                <img src="https://fournisseur.centrale-medicalliance.fr/modules/marketplace/views/img/visuels/{$product[0].VISUEL_1}.128.png" alt="{$product[0].LIBELLE_CAT}" data-full-size-image-url="" width="250" height="250" />
                                            </a>
                                        </div>

                                        <div class="product-description">
                                            <h2 class="">
                                                <a href="#" content="#">{$product[0].LIBELLE_CAT}</a>
                                            </h2>
                                            <p>{$product[0].DESCRIPTIF_PRODUIT }</p>

                                            {foreach from=$product item=item}
                                                <div class="d-flex justify-content-between">
                                                    <span class="mr-2" aria-label="">{strtoupper($item.Ordre_de_visuel)}</span>
                                                    <span class="" aria-label="">{$item.Descriptif_complementaire}</span>
                                                </div>
                                            <div class="d-flex justify-content-between">
                                                <span class="reference mr-3" aria-label="Reference">Ref: {$item.REFERENCE}</span>
                                                <span class="price pl-2" aria-label="Price">{$item.PRIX_DE_VENTE_CATALOGUE_TTC}€</span>
                                            </div>
                                            {if isset($item.Soit_a_lunite) && !empty($item.Soit_a_lunite)}
                                            <div class="">
                                                <span class="reference mr-3" aria-label="Reference"><small>Soit à l’unité</small></span>
                                                <span class="price pl-3" aria-label="Price"><small>{$item.Soit_a_lunite}€</small></span>
                                            </div>
                                            {/if}
                                            {/foreach}

                                        </div>
                                        <div>
                                        <a class="btn btn-primary" href="{$updateLink}?page={$item.Page}&prd={$item.Ordre_de_page}">UPDATE</a>
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
                                                <img src="https://fournisseur.centrale-medicalliance.fr/modules/marketplace/views/img/visuels/{$product[0].VISUEL_1}.128.png" alt="{$product.LIBELLE_CAT}" data-full-size-image-url="" width="250" height="250" />
                                            </a>
                                        </div>
                                        <div class="product-description">
                                            <h2 class="">
                                                <a href="#" content="#">{$product[0].LIBELLE_CAT}</a>
                                            </h2>
                                            <p>{$product[0].DESCRIPTIF_PRODUIT }</p>
                                            <div class="d-flex justify-content-between">
                                                <span class="reference mr-3" aria-label="Reference">Ref: {$product[0].REFERENCE}</span>
                                                <span class="price pl-2" aria-label="Price">{$product[0].PRIX_DE_VENTE_CATALOGUE_TTC}€</span>
                                            </div>
                                            {if isset($product[0].Soit_a_lunite) && !empty($product[0].Soit_a_lunite)}
                                            <div class="">
                                                <span class="reference mr-3" aria-label="Reference"><small>Soit à l’unité</small></span>
                                                <span class="price pl-3" aria-label="Price"><small>{$product[0].Soit_a_lunite}€</small></span>
                                            </div>
                                            {/if}
                                        </div>
                                        <div>
                                        <a class="btn btn-primary" href="{$updateLink}?page={$product[0].Page}&prd={$product[0].Ordre_de_page}">UPDATE</a>
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

