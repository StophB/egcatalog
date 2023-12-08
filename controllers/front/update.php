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
            'product' => $this->getProduct($page, $product, $ordreDeVisuel),
        ));

        $this->setTemplate('module:egcatalog/views/templates/front/form.tpl');
    }

    public function processUpdate()
    {
        $link = $this->context->link->getModuleLink('egcatalog', 'display');

        $page = Tools::getValue('page');
        $ordreDePage = Tools::getValue('prd');
        $libelleCat = Tools::getValue('LIBELLE_CAT');
        $descriptifProduit = Tools::getValue('DESCRIPTIF_PRODUIT');
        $descriptifComplementaire = Tools::getValue('Descriptif_complementaire');
        $piedDePage = Tools::getValue('Pied_de_page');
        $ordreDeVisuel = Tools::getValue('ordre_de_visuel');

        $visuel1File = $_FILES['VISUEL_1'];
        $visuel2File = $_FILES['VISUEL_2'];

        $visuel1Path = $this->updateImg($visuel1File);
        $visuel2Path = $this->updateImg($visuel2File);

        $sql = 'UPDATE ' . _DB_PREFIX_ . 'catalogue_nd_eg_list SET ' .
            '`LIBELLE_CAT` = "' . pSQL($libelleCat) . '", ' .
            '`DESCRIPTIF_PRODUIT` = "' . pSQL($descriptifProduit) . '", ' .
            '`Descriptif_complementaire` = "' . pSQL($descriptifComplementaire) . '", ';

        if ($visuel1Path !== null || $visuel2Path !== null) {
            $sql .= '`VISUEL_1` = "' . pSQL($visuel1Path) . '", ' .
                '`VISUEL_2` = "' . pSQL($visuel2Path) . '", ';
        }

        $sql .= '`Pied_de_page` = "' . pSQL($piedDePage) . '" ' .
            'WHERE `Page` = ' . (int)$page . ' AND `Ordre_de_page` = ' . (int)$ordreDePage . ' AND `Ordre_de_visuel` = "' . pSQL($ordreDeVisuel) . '"';

        Db::getInstance()->execute($sql);

        // Redirect to another page after update
        Tools::redirect($link . '?page=' . $page);
    }

    public function getProduct($page, $product, $ordreDeVisuel = null)
    {
        $query = new DbQuery();
        $query->select('c.*');
        $query->from('catalogue_nd_eg_list', 'c');
        $query->where('c.`Page` = ' . (int)$page . ' AND c.`Ordre_de_page` = ' . (int)$product);
        $query->where("c.`Ordre_de_visuel` = '" . pSQL($ordreDeVisuel) . "'");

        $product = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($query);
        return $product;
    }

    private function updateImg($file)
    {
        if (!empty($file['tmp_name']) && is_uploaded_file($file['tmp_name'])) {

            $uploadDirectory = _PS_MODULE_DIR_ . 'egcatalog/views/img/';
            $uploadedFileName = basename($file['name']);
            $fileType = pathinfo($uploadedFileName, PATHINFO_EXTENSION);

            $allowedTypes = array('tif');

            if (!in_array(strtolower($fileType), $allowedTypes)) {
                return null;
            }

            $uploadedFilePath = $uploadDirectory . $uploadedFileName;

            move_uploaded_file($file['tmp_name'], $uploadedFilePath);

            return $uploadedFileName;
        }

        return null;
    }
}
