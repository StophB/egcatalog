<?php
class egcatalogdisplayModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        parent::initContent();

        $page = Tools::getValue('page', 4);
        $this->context->smarty->assign(array(
            'pages' => $this->getPages(),
            'products' => $this->getProductsByPage($page),
            'link' => $this->context->link->getModuleLink('egcatalog', 'display'),
            'updateLink' => $this->context->link->getModuleLink('egcatalog', 'edit')

        ));

        $this->setTemplate('module:egcatalog/views/templates/front/display.tpl');
    }

    public function getProductsByPage($page)
    {
        $query = new DbQuery();
        $query->select('c.*');
        $query->from('catalogue_nd_eg_list', 'c');
        $query->where('c.`Page` =  '.(int) $page);
        $query->orderBy('c.`Ordre_de_page` ASC, c.`Ordre_de_visuel` ASC');

        $result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($query);

        // Group products by Ordre_de_page
        $groupedProducts = [];
        foreach ($result as $product) {
            $ordreDePage = $product['Ordre_de_page'];
            if (!isset($groupedProducts[$ordreDePage])) {
                $groupedProducts[$ordreDePage] = [];
            }
            $groupedProducts[$ordreDePage][] = $product;
        }

        // Convert the associative array to a simple indexed array
        $finalResult = array_values($groupedProducts);

        return $finalResult;
    }


    public function getPages()
    {
        $query = new DbQuery();
        $query->select('DISTINCT c.`Page`');
        $query->from('catalogue_nd_eg_list', 'c');
        $query->orderBy('c.`Page` ASC');

        return Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($query);
    }
}
