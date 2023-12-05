{extends file='page.tpl'}

{block name="page_content"}
    <section id="products">
        <div id="js-product-list">
            <div class="products row">
                {foreach from=$products item=product}
                    <div class="js-product product col-xs-12 col-sm-6 col-xl-4">
                        <article class="product-miniature js-product-miniature" data-id-product="10" data-id-product-attribute="24">
                            <div class="thumbnail-container reviews-loaded">
                                <div class="thumbnail-top">
                                    <a href="#" class="thumbnail product-thumbnail">
                                        <img src="https://fournisseur.centrale-medicalliance.fr/modules/marketplace/views/img/visuels/{$product.VISUEL_1}.128.png" alt="{$product.LIBELLE_CAT}" data-full-size-image-url="" width="250" height="250" />
                                    </a>

                                    <div class="highlighted-informations">
                                        <a class="quick-view js-quick-view" href="#" data-link-action="quickview">
                                            <i class="material-icons search"></i> Quick view
                                        </a>
                                    </div>
                                </div>

                                <div class="product-description">
                                    <h2 class="h3 product-title">
                                        <a href="#" content="#">{$product.LIBELLE_CAT}</a>
                                    </h2>

                                    <div class="product-price-and-shipping">
                                        <span class="price" aria-label="Price"> {$product.PRIX_DE_VENTE_CATALOGUE_TTC}€</span>
                                    </div>
                                </div>

                                <ul class="product-flags js-product-flags">

                                        <li class="product-flag new">New</li>

                                </ul>

                                <button class="wishlist-button-add">
                                    <i class="material-icons">favorite_border</i>
                                </button>
                            </div>
                        </article>
                    </div>
                {/foreach}
            </div>
        </div>
    </section>
{/block}
