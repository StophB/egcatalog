<?php
class egcatalogeditModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        parent::initContent();

        $product = Tools::getValue('prd');
        $page = Tools::getValue('page', 4);
        $this->context->smarty->assign(array(
            'product' => $this->getProduct($page, $product),
            'link' => $this->context->link->getModuleLink('egcatalog', 'update')
        ));

        $this->setTemplate('module:egcatalog/views/templates/front/form.tpl');
    }

    public function postProcess()
    {
        if (Tools::getValue('action') == 'update') {
            $this->updateProduct();
        }
    }

    public function getProduct($page, $product)
    {
        $query = new DbQuery();
        $query->select('c.*');
        $query->from('catalogue_nd_eg_list', 'c');
        $query->where('c.`Page` = '.(int) $page. ' AND c.`Ordre_de_page` =  '.(int) $product);

        $product = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($query);
        return $product;
    }
}
