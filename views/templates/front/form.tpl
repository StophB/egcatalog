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
                    <input type="hidden" name="ordre_de_visuel" value="{$product[0].Ordre_de_visuel}">

                    <div class="form-group row">
                        <label class="col-md-3 form-control-label" for="DESCRIPTIF_PRODUIT">DESCRIPTIF PRODUIT:</label>
                        <div class="col-md-9">
                            <textarea id="DESCRIPTIF_PRODUIT" class="form-control" name="DESCRIPTIF_PRODUIT" rows="3" spellcheck="false" data-ms-editor="true">{$product[0].DESCRIPTIF_PRODUIT}</textarea>
                        </div>
                    </div>

                            <div class="mt-2 form-group row">
                                <label class="col-md-3 form-control-label" for="Descriptif_complementaire">Descriptif Complementaire:</label>
                                <div class="col-md-9">
                                    <textarea id="Descriptif_complementaire" class="form-control" name="Descriptif_complementaire" rows="3" spellcheck="false" data-ms-editor="true">{$product[0].Descriptif_complementaire}</textarea>
                                </div>
                            </div>

                    <div class="form-group row">
                        <label class="col-md-3 form-control-label" for="Pied_de_page">Pied de page:</label>
                        <div class="col-md-6">
                            <input id="Pied_de_page" class="form-control" name="Pied_de_page" type="text" value="{$product[0].Pied_de_page}">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-md-3 form-control-label" for="VISUEL_1">VISUEL 1</label>
                        <div class="col-md-6">
                            <input id="VISUEL_1" type="file" name="VISUEL_1" class="filestyle">
                            <span class="col-md-3 form-control-comment">optional</span>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-md-3 form-control-label" for="VISUEL_2">VISUEL 2</label>
                        <div class="col-md-6">
                            <input id="VISUEL_2" type="file" value="" name="VISUEL_2" class="filestyle">
                            <span class="col-md-3 form-control-comment">optional</span>
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
