<?php
namespace App\Controllers;

use App\Models\Don;
use App\Models\DepenseNatureEconomique;
use App\Models\DeficitBudgetaire;
use App\Models\DepenseParInstitution;
use App\Models\PosteBudgetaire;
use Flight;


class BudgetController {

    public static function getDons() {
        $model = new Don(Flight::db());
        $dataArray = $model->getAll(); 
    
    // 2. Encapsuler le tableau dans la clé 'data'
    $jsonResponse = [
        'data' => $dataArray
    ];
    
    // 3. Renvoyer l'objet JSON formaté
    Flight::json($jsonResponse);
    }

    public static function getDepensesNature() {
        $model = new DepenseNatureEconomique(Flight::db());
        $dataArray = $model->getAll(); 
    
    // 2. Encapsuler le tableau dans la clé 'data'
    $jsonResponse = [
        'data' => $dataArray
    ];
    
    // 3. Renvoyer l'objet JSON formaté
    Flight::json($jsonResponse);
    }

    public static function getDeficitBudgetaire() {
        $model = new DeficitBudgetaire(Flight::db());
        $dataArray = $model->getAll();
        $jsonResponse = ['data' => $dataArray];
        Flight::json($jsonResponse);
    }

    public static function getDepensesInstitution() {
        $model = new DepenseParInstitution(Flight::db());
        $dataArray = $model->getAll();
        $jsonResponse = ['data' => $dataArray];
        Flight::json($jsonResponse);
    }

    public static function getPostesBudgetaires() {
        $model = new PosteBudgetaire(Flight::db());
        $dataArray = $model->getAll();
        $jsonResponse = ['data' => $dataArray];
        Flight::json($jsonResponse);
    }

    public static function getRecettesFiscalesDouanieres() {
        $db = Flight::db();
        $stmt = $db->prepare("
            SELECT annee,
                   SUM(CASE WHEN type_impot IS NOT NULL THEN montant ELSE 0 END) as fiscales,
                   SUM(CASE WHEN type_droit_taxe IS NOT NULL THEN montant ELSE 0 END) as douanieres
            FROM (
                SELECT annee, type_impot, NULL as type_droit_taxe, montant FROM recettes_fiscales_interieures
                UNION ALL
                SELECT annee, NULL as type_impot, type_droit_taxe, montant FROM recettes_douanieres
            ) combined
            GROUP BY annee
            ORDER BY annee
        ");
        $stmt->execute();
        $dataArray = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        $jsonResponse = ['data' => $dataArray];
        Flight::json($jsonResponse);
    }

    public static function getInvestissementsPublics() {
        $db = Flight::db();
        $stmt = $db->prepare("
            SELECT annee, source_financement as source, SUM(montant) as total
            FROM programmes_investissement
            GROUP BY annee, source_financement
            ORDER BY annee, source_financement
        ");
        $stmt->execute();
        $dataArray = $stmt->fetchAll(\PDO::FETCH_ASSOC);
        $jsonResponse = ['data' => $dataArray];
        Flight::json($jsonResponse);
    }

    public static function getDeficitPrevision() {
        $model = new DeficitBudgetaire(Flight::db());
        $dataArray = $model->getAll();
        $jsonResponse = ['data' => $dataArray];
        Flight::json($jsonResponse);
    }
}
