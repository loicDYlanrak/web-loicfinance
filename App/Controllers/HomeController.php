<?php
namespace App\Controllers;

// Importer les modèles et Flight
use App\Models\PerspectiveEconomique;
use App\Models\CroissanceSectorielle;
use App\Models\Recette;
use Flight;

class HomeController {
    
    /**
     * Affiche la page d'accueil en rendant les vues.
     */
    public static function index() {
        // Initialiser les modèles à l'intérieur de la méthode statique
        // en utilisant la connexion de Flight
        $perspectiveModel = new PerspectiveEconomique(Flight::db());
        $croissanceModel = new CroissanceSectorielle(Flight::db());
        $recetteModel = new Recette(Flight::db());
        
        // Récupérer les données
        $data = [
            'title' => 'Budget Citoyen 2025 - Madagascar',
            'perspectives' => $perspectiveModel->getAll(),
            'croissance2024' => $croissanceModel->getByYear(2024),
            'croissance2025' => $croissanceModel->getByYear(2025),
            'recettesTotal' => $recetteModel->getEvolutionRecettes(),
            'fiscales2024' => $recetteModel->getFiscalesInterieures(2024),
            'fiscales2025' => $recetteModel->getFiscalesInterieures(2025),
            'douanes2024' => $recetteModel->getDouanieres(2024),
            'douanes2025' => $recetteModel->getDouanieres(2025),
            'nonFiscales2024' => $recetteModel->getNonFiscales(2024),
            'nonFiscales2025' => $recetteModel->getNonFiscales(2025)
        ];
        
        // Rendre les vues.
        // Note : Flight::render() suppose que vos fichiers 'home.php' et 'layout.php'
        // sont dans le dossier de vues configuré (par ex. via Flight::set('flight.views.path', './');)
        // Puisque vos fichiers sont à la racine, vous avez dû configurer cela dans votre index.php
        Flight::render('home', $data, 'content');
        Flight::render('layout', $data);
    }
    
    /**
     * Renvoie les données pour les graphiques au format JSON.
     */
    public static function getChartData() {
        $data = [
            'secteurs' => [
                'labels' => ['Secteur primaire', 'Secteur secondaire', 'Secteur tertiaire'],
                '2024' => [5.3, -3.3, 5.0],
                '2025' => [7.8, 3.4, 5.4]
            ],
            'recettes' => [
                'labels' => ['2024', '2025'],
                'impots' => [4636.5, 5928.4],
                'douanes' => [3768.0, 4366.0],
                'non_fiscales' => [345.9, 491.7],
                'dons' => [1086.3, 2478.6]
            ]
        ];
        
        // Utiliser Flight::json() pour renvoyer du JSON, comme dans UserController
        Flight::json($data);
    }
}
