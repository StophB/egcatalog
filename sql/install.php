<?php
/**
 * 2020 (c) Egio digital
 *
 * MODULE EgBanner
 *
 * @author    Egio digital
 * @copyright Copyright (c), Egio digital
 * @license   Commercial
 * @version   1.0.0
 */

$sql = array();

/* Information on content EG Banner */
$sql[] = 'CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'catalogue_nd_eg_list` (
    `Produits_supprimes` TEXT DEFAULT NULL,
    `CHAPITRE` TEXT DEFAULT NULL,
    `Page` INT(11) DEFAULT NULL,
    `Ordre_de_page` INT(11) DEFAULT NULL,
    `Ordre_de_visuel` TEXT DEFAULT NULL,
    `FOURNISSEURS` TEXT DEFAULT NULL,
    `MARQUES` TEXT DEFAULT NULL,
    `FOURNISSEURS_CAT` TEXT DEFAULT NULL,
    `REFERENCE` TEXT DEFAULT NULL,
    `LIBELLE_CAT` TEXT DEFAULT NULL,
    `PRIX_DE_VENTE_CATALOGUE_TTC` TEXT DEFAULT NULL,
    `COND_Pour_PU` TEXT DEFAULT NULL,
    `Soit_a_lunite` TEXT DEFAULT NULL,
    `LPPR` TEXT DEFAULT NULL,
    `IMAGES_LPPR` TEXT DEFAULT NULL,
    `DESCRIPTIF_PRODUIT` TEXT DEFAULT NULL,
    `Descriptif_complementaire` TEXT DEFAULT NULL,
    `FAMILLE` TEXT DEFAULT NULL,
    `PICTOGRAMMES1` TEXT DEFAULT NULL,
    `PICTOGRAMMES2` TEXT DEFAULT NULL,
    `PICTOGRAMMES3` TEXT DEFAULT NULL,
    `A_PARTIR_DE` TEXT DEFAULT NULL,
    `VISUEL_1` TEXT DEFAULT NULL,
    `VISUEL_2` TEXT DEFAULT NULL,
    `LOGOS` TEXT DEFAULT NULL,
    `LOGOS_2` TEXT DEFAULT NULL,
    `Pied_de_page` TEXT DEFAULT NULL,
    `Nous_Consulter` TEXT DEFAULT NULL,
    `Eco_Part` TEXT DEFAULT NULL,
    `Commentaire` TEXT DEFAULT NULL
) ENGINE=' . _MYSQL_ENGINE_ . ' DEFAULT CHARSET=utf8 ;';

foreach ($sql as $query) {
    if (Db::getInstance()->execute($query) === false) {
        die('Error creating table: ' . Db::getInstance()->getMsgError());
    }
}
