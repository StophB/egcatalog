{extends file=$layout}
{block name='content'}
    <div id="content" class="page-content card card-block">
        <section class="contact-form">
            <form action="" method="post" enctype="multipart/form-data">
                <section class="form-fields">
                    <div class="form-group row">
                        <div class="col-md-9 col-md-offset-3">
                            <h3>{l s='Update Product' mod='egcatalog'}</h3>
                        </div>
                    </div>

                    <input type="hidden" name="ordre_de_visuel" value="{$product[0].Ordre_de_visuel|escape:'htmlall':'UTF-8'}">

                    <div class="form-group row">
                        <label class="col-md-3 form-control-label" for="LIBELLE_CAT">>{l s='LIBELLE CAT:' mod='egcatalog'|escape:'htmlall':'UTF-8'}</label>
                        <div class="col-md-6">
                            <input id="LIBELLE_CAT" class="form-control" name="LIBELLE_CAT" type="text" value="{$product[0].LIBELLE_CAT|escape:'htmlall':'UTF-8'}" required>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-md-3 form-control-label" for="DESCRIPTIF_PRODUIT">">>{l s='DESCRIPTIF PRODUIT:' mod='egcatalog'}</label>
                        <div class="col-md-9">
                            <textarea id="DESCRIPTIF_PRODUIT" class="form-control" name="DESCRIPTIF_PRODUIT" rows="3" spellcheck="false" data-ms-editor="true">{$product[0].DESCRIPTIF_PRODUIT|escape:'htmlall':'UTF-8'}</textarea>
                        </div>
                    </div>

                    <div class="mt-2 form-group row">
                        <label class="col-md-3 form-control-label" for="Descriptif_complementaire">{l s='Descriptif Complementaire:' mod='egcatalog'}</label>
                        <div class="col-md-9">
                            <textarea id="Descriptif_complementaire" class="form-control" name="Descriptif_complementaire" rows="3" spellcheck="false" data-ms-editor="true">{$product[0].Descriptif_complementaire|escape:'htmlall':'UTF-8'}</textarea>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-md-3 form-control-label" for="Pied_de_page">">{l s='Pied de page:' mod='egcatalog'}</label>
                        <div class="col-md-6">
                            <input id="Pied_de_page" class="form-control" name="Pied_de_page" type="text" value="{$product[0].Pied_de_page|escape:'htmlall':'UTF-8'}">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-md-3 form-control-label" for="VISUEL_1">{l s='VISUEL 1:' mod='egcatalog'}</label>
                        <div class="col-md-6">
                            <input id="VISUEL_1" type="file" name="VISUEL_1" class="filestyle" value="">
                            <span class="col-md-3 form-control-comment">">{l s='optional' mod='egcatalog'}</span>
                        </div>
                        <p>{$product[0].VISUEL_1|escape:'htmlall':'UTF-8'}</p>
                    </div>

                    <div class="form-group row">
                        <label class="col-md-3 form-control-label" for="VISUEL_2">{l s='VISUEL 2:' mod='egcatalog'}</label>
                        <div class="col-md-6">
                            <input id="VISUEL_2" type="file" value="" name="VISUEL_2" class="filestyle">
                            <span class="col-md-3 form-control-comment">">{l s='optional' mod='egcatalog'}</span>
                        </div>
                        <p>{$product[0].VISUEL_2|escape:'htmlall':'UTF-8'}</p>
                    </div>
                </section>

                <footer class="form-footer text-sm-right">
                    <input class="btn btn-primary" type="submit" name="update" value="{l s='update' mod='egcatalog'}">
                </footer>
            </form>
        </section>
    </div>
{/block}
