<?php
class egcatalogupdateModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        parent::initContent();

        if (Tools::isSubmit('update')) {
            $this->processUpdate();
        }
        $product = Tools::getValue('prd');
        $page = Tools::getValue('page', 4);
        $ordreDeVisuel = Tools::getValue('decli');

        $this->context->smarty->assign(array(
            'product' => EgCatalogClass::getProduct($page, $product, $ordreDeVisuel),
        ));

        $this->setTemplate('module:egcatalog/views/templates/front/form.tpl');
    }

    public function processUpdate()
    {
        $context = Context::getContext();

        $link = $context->link->getModuleLink('egcatalog', 'display');

        $page = Tools::getValue('page');
        $ordreDePage = Tools::getValue('prd');
        $ordreDeVisuel = Tools::getValue('ordre_de_visuel');

        $libelleCat = Tools::getValue('LIBELLE_CAT');
        $descriptifProduit = Tools::getValue('DESCRIPTIF_PRODUIT');
        $descriptifComplementaire = Tools::getValue('Descriptif_complementaire');
        $piedDePage = Tools::getValue('Pied_de_page');

        $visuel1File = $_FILES['VISUEL_1'];
        $visuel2File = $_FILES['VISUEL_2'];

        $visuel1Path = EgCatalogClass::updateImg($visuel1File);
        $visuel2Path = EgCatalogClass::updateImg($visuel2File);

        $sql = 'UPDATE ' . _DB_PREFIX_ . 'catalogue_nd_eg_list SET ' .
            '`LIBELLE_CAT` = "' . pSQL($libelleCat) . '", ' .
            '`DESCRIPTIF_PRODUIT` = "' . pSQL($descriptifProduit) . '", ' .
            '`Descriptif_complementaire` = "' . pSQL($descriptifComplementaire) . '", ';

        if ($visuel1Path !== null) {
            $sql .= '`VISUEL_1` = "' . pSQL($visuel1Path) . '", ';
        } elseif ($visuel2Path !== null) {
            $sql .= '`VISUEL_2` = "' . pSQL($visuel2Path) . '", ';
        }

        $sql .= '`Pied_de_page` = "' . pSQL($piedDePage) . '" ' .
            'WHERE `Page` = ' . (int)$page . ' AND `Ordre_de_page` = ' . (int)$ordreDePage . ' AND `Ordre_de_visuel` = "' . pSQL($ordreDeVisuel) . '"';

        Db::getInstance()->execute($sql);

        // Redirect to another page after update
        Tools::redirect($link . '?page=' . $page);
    }
}
