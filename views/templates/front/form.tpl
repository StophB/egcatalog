{extends file=$layout}
{block name='content'}
    <div id="content" class="page-content card card-block">
        <section class="contact-form">
            <form action="" method="post" enctype="multipart/form-data">
                <section class="form-fields">
                    <div class="form-group row">
                        <div class="col-md-9 col-md-offset-3">
                            <h3>Update Product</h3>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-md-3 form-control-label" for="LIBELLE_CAT">LIBELLE CAT:</label>
                        <div class="col-md-6">
                            <input id="LIBELLE_CAT" class="form-control" name="LIBELLE_CAT" type="text" value="{$product[0].LIBELLE_CAT}" required>
                        </div>
                    </div>



                    <div class="form-group row">
                        <label class="col-md-3 form-control-label" for="DESCRIPTIF_PRODUIT">DESCRIPTIF PRODUIT:</label>
                        <div class="col-md-9">
                            <textarea id="DESCRIPTIF_PRODUIT" class="form-control" name="DESCRIPTIF_PRODUIT" rows="3" spellcheck="false" data-ms-editor="true">{$product[0].DESCRIPTIF_PRODUIT}</textarea>
                        </div>
                    </div>

                    {if count($product) > 1}

                    {foreach from=$product item=item}
                        <div class="form-group row">
                            <label class="col-md-3 form-control-label" for="Descriptif_complementaire">Descriptif Complementaire {strtoupper($item.Ordre_de_visuel)}:</label>
                            <div class="col-md-9">
                                <textarea id="Descriptif_complementaire" class="form-control" name="Descriptif_complementaire" rows="3" spellcheck="false" data-ms-editor="true">{$item.Descriptif_complementaire}</textarea>
                            </div>
                        </div>
                    {/foreach}
                    {else}
                        <div class="form-group row">
                            <label class="col-md-3 form-control-label" for="Descriptif_complementaire">Descriptif Complementaire:</label>
                            <div class="col-md-9">
                                <textarea id="Descriptif_complementaire" class="form-control" name="Descriptif_complementaire" rows="3" spellcheck="false" data-ms-editor="true">{$product[0].Descriptif_complementaire}</textarea>
                            </div>
                        </div>
                    {/if}

                    <div class="form-group row">
                        <label class="col-md-3 form-control-label" for="LIBELLE_CAT">Pied de page:</label>
                        <div class="col-md-6">
                            <input id="LIBELLE_CAT" class="form-control" name="LIBELLE_CAT" type="text" value="{$product[0].Pied_de_page}" required>
                        </div>
                    </div>
                </section>

                <footer class="form-footer text-sm-right">
                    <input class="btn btn-primary" type="submit" name="update" value="update">
                </footer>
            </form>
        </section>
    </div>
{/block}
