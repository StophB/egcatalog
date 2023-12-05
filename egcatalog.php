<?php

if (!defined('_PS_VERSION_')) {
    exit;
}

class EgCatalog extends Module
{
    public function __construct()
    {
        $this->name = 'egcatalog';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Mustapha bousfina';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = [
            'min' => '1.7',
            'max' => _PS_VERSION_
        ];
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Module eg catalog');
        $this->description = $this->l('Module egio catalog');

        $this->confirmUninstall = $this->l('Êtes-vous sûr de vouloir désinstaller ce module?');
    }

    public function install()
    {
        if (Shop::isFeatureActive()) {
            Shop::setContext(Shop::CONTEXT_ALL);
        }

        if (
            !parent::install() ||
            !$this->registerHook('leftColumn') ||
            !$this->registerHook('header')
        ) {
            return false;
        }

        return true;
    }

    public function uninstall()
    {
        if (
            !parent::uninstall()
        ) {
            return false;
        }

        return true;
    }

    public function hookDisplayLeftColumn($params)
    {
        $this->context->smarty->assign([
            'pages' => $this->getPages(),
            'link' => $this->context->link->getModuleLink('egcatalog', 'display')
        ]);

        return $this->display(__FILE__, 'egcatalog.tpl');
    }

    public function hookDisplayHeader()
    {
        $this->context->controller->registerStylesheet(
            'egcatalog',
            $this->_path . 'views/css/front.css',
            ['server' => 'remote', 'position' => 'head', 'priority' => 150]
        );
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
