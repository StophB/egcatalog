<?php

if (!defined('_PS_VERSION_')) {
    exit;
}
include_once(dirname(__FILE__) . '/classes/EgCatalogClass.php');

class EgCatalog extends Module
{
    public function __construct()
    {
        $this->name = 'egcatalog';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Mustapha bousfina';
        $this->need_instance = 0;

        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Module eg catalog');
        $this->description = $this->l('Module egio catalog');
        $this->confirmUninstall = $this->l('Êtes-vous sûr de vouloir désinstaller ce module?');
        $this->ps_versions_compliancy = [
            'min' => '1.7',
            'max' => _PS_VERSION_
        ];
    }

    public function install()
    {
        include(dirname(__FILE__) . '/sql/install.php');

        if (!parent::install() || !$this->registerHook('moduleRoutes') || !$this->registerHook('displayTop') || !$this->registerHook('header')) {
            return false;
        }

        return true;
    }

    public function uninstall()
    {
        include(dirname(__FILE__) . '/sql/uninstall.php');
        if (!parent::uninstall()) {
            return false;
        }

        return true;
    }

    public function hookModuleRoutes()
    {
        return [
            'egcatalog' => [
                'controller' => 'display',
                'rule' => 'egcatalog/display',
                'keywords' => [
                    'link_rewrite' => [
                        'regexp' => '[_a-zA-Z0-9-\pL]*',
                        'param' => 'link_rewrite'
                    ],
                ],
                'params' => [
                    'fc' => 'module',
                    'module' => 'egcatalog',
                ]
            ],
            'egcatalogupdate' => [
                'controller' => 'update',
                'rule' => 'update',
                'keywords' => [
                    'link_rewrite' => [
                        'regexp' => '[_a-zA-Z0-9-\pL]*',
                        'param' => 'link_rewrite'
                    ],
                ],
                'params' => [
                    'fc' => 'module',
                    'module' => 'egcatalog',
                ]
            ],
        ];
    }

    public function hookDisplayTop($params)
    {
        $this->context->smarty->assign([
            'link' => $this->context->link->getModuleLink('egcatalog', 'display')
        ]);

        return $this->display(__FILE__, 'top.tpl');
    }

    public function hookDisplayHeader()
    {
        $this->context->controller->addJS($this->_path . '/views/js/front.js');
        $this->context->controller->addCSS($this->_path . '/views/css/front.css');
    }
}
