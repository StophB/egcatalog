<?php

class egcatalogdisplayModuleFrontController extends ModuleFrontController
{
    public function __construct()
    {
        parent::__construct();
        $this->context = Context::getContext();
    }

    public function initContent()
    {
        parent::initContent();

        $page = Tools::getValue('page');
        $this->context->smarty->assign(array(
            'pages' => EgCatalogClass::getPages(),
            'fiftyPages' => EgCatalogClass::getFiftyPages(),
            'products' => EgCatalogClass::getProductsByPage($page),
            'link' => $this->context->link->getModuleLink('egcatalog', 'display'),
            'updateLink' => $this->context->link->getModuleLink('egcatalog', 'update')

        ));

        $this->setTemplate('module:egcatalog/views/templates/front/display.tpl');
    }
}


