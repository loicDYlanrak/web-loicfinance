<?php

require_once 'flight/Flight.php';
require 'flight/autoload.php';

//require __DIR__ . '/../vendor/autoload.php';
require __DIR__ . '/config/database.php';

use App\Controllers\UserController;
use App\Controllers\BudgetController;

// Routes REST
Flight::route('GET /users', [UserController::class, 'getAll']);
Flight::route('GET /users/@id', [UserController::class, 'getById']);
Flight::route('POST /users', [UserController::class, 'create']);
Flight::route('PUT /users/@id', [UserController::class, 'update']);
Flight::route('DELETE /users/@id', [UserController::class, 'delete']);

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
