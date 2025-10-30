<?php

require_once 'flight/Flight.php';
require 'flight/autoload.php';

//require __DIR__ . '/../vendor/autoload.php';
require __DIR__ . '/config/database.php';

// Importer les contrôleurs
use App\Controllers\UserController;
use App\Controllers\HomeController; // <-- 1. Ajoutez HomeController
use App\Controllers\BudgetController;

// Configuration
Flight::set('flight.views.path', './'); // <-- 2. Définissez le dossier des vues

// --- Routes ---

// Routes pour l'API (UserController)
Flight::route('GET /users', [UserController::class, 'getAll']);
Flight::route('GET /users/@id', [UserController::class, 'getById']);
Flight::route('POST /users', [UserController::class, 'create']);
Flight::route('PUT /users/@id', [UserController::class, 'update']);
Flight::route('DELETE /users/@id', [UserController::class, 'delete']);

// Routes pour la page d'accueil (HomeController)
Flight::route('GET /', [HomeController::class, 'index']); // <-- 3. Ajoutez la route pour la page d'accueil
Flight::route('GET /api/chart-data', [HomeController::class, 'getChartData']); // <-- 4. Ajoutez la route pour l'API des graphiques

// Démarrer Flight
Flight::start();
// Budget routes
Flight::route('GET /dons', [BudgetController::class, 'getDons']);
Flight::route('GET /depenses-nature', [BudgetController::class, 'getDepensesNature']);
Flight::route('GET /deficit-budgetaire', [BudgetController::class, 'getDeficitBudgetaire']);
Flight::route('GET /depenses-institution', [BudgetController::class, 'getDepensesInstitution']);
Flight::route('GET /postes-budgetaires', [BudgetController::class, 'getPostesBudgetaires']);
Flight::route('GET /recettes-fiscales-douanieres', [BudgetController::class, 'getRecettesFiscalesDouanieres']);
Flight::route('GET /investissements-publics', [BudgetController::class, 'getInvestissementsPublics']);
Flight::route('GET /deficit-prevision', [BudgetController::class, 'getDeficitPrevision']);

Flight::start();
