<?php

require_once 'flight/Flight.php';
// require 'flight/autoload.php';

//require __DIR__ . '/../vendor/autoload.php';
require __DIR__ . '/config/database.php';

// Importer les contrôleurs
use App\Controllers\UserController;
use App\Controllers\HomeController; // <-- 1. Ajoutez HomeController

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