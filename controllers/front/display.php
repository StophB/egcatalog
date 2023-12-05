<?php
class egcatalogdisplayModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        parent::initContent();

        $page = Tools::getValue('page', 1);

        $this->context->smarty->assign(array(
            'products' => $this->getProductsByPage($page)
        ));

        $this->setTemplate('module:egcatalog/views/templates/front/display.tpl');
    }

    public function getProductsByPage($page)
    {
        $query = new DbQuery();
        $query->select('c.*');
        $query->from('catalogue_nd_eg_list', 'c');
        $query->where('c.`Page` =  '.(int) $page);

        return Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($query);
    }



}
