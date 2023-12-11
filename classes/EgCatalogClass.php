<?php


class EgCatalogClass
{
    public static function getProductsByPage($page)
    {
        $context = Context::getContext();

        $query = new DbQuery();
        $query->select('c.*');
        $query->from('catalogue_nd_eg_list', 'c');
        $query->where('c.`Page` =  ' . (int) $page);
        $query->orderBy('c.`Ordre_de_page` ASC, c.`Ordre_de_visuel` ASC');

        $result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($query);

        $groupedProducts = [];
        foreach ($result as &$product) {
            $product['PRIX_DE_VENTE_CATALOGUE_TTC'] = str_replace(',', '.', $product['PRIX_DE_VENTE_CATALOGUE_TTC']);
            $product['Soit_a_lunite'] = str_replace(',', '.', $product['Soit_a_lunite']);
            $product['price_formatted'] = $context->getCurrentLocale()->formatPrice(
                $product['PRIX_DE_VENTE_CATALOGUE_TTC'] ?: 0.00,
                $context->currency->iso_code
            );
            $product['price_formatted2'] = $context->getCurrentLocale()->formatPrice(
                $product['Soit_a_lunite'] ?: 0.00,
                $context->currency->iso_code
            );
            $orderDePage = $product['Ordre_de_page'];
            if (!isset($groupedProducts[$orderDePage])) {
                $groupedProducts[$orderDePage] = [];
            }
            $groupedProducts[$orderDePage][] = $product;
        }

        return array_values($groupedProducts);
    }

    public static function getPages()
    {
        $query = new DbQuery();
        $query->select('DISTINCT c.`Page`');
        $query->from('catalogue_nd_eg_list', 'c');
        $query->orderBy('c.`Page` ASC');

        return Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($query);
    }

    public static function getFiftyPages()
    {
        $query = new DbQuery();
        $query->select('DISTINCT c.`Page`');
        $query->from('catalogue_nd_eg_list', 'c');
        $query->orderBy('c.`Page` ASC');
        $query->limit(50);

        return Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($query);
    }

    public static function getProduct($page, $product, $ordreDeVisuel = null)
    {
        $query = new DbQuery();
        $query->select('c.*');
        $query->from('catalogue_nd_eg_list', 'c');
        $query->where('c.`Page` = ' . (int)$page . ' AND c.`Ordre_de_page` = ' . (int)$product);
        $query->where("c.`Ordre_de_visuel` = '" . pSQL($ordreDeVisuel) . "'");

        $product = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($query);
        return $product;
    }

    public static function updateImg($file)
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
