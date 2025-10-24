<?php
// Flight::register('db', 'PDO', array(
//     'pgsql:host=localhost;port=5432;dbname=test',
//     'postgres',        // ton utilisateur PostgreSQL
//     ''       // ton mot de passe
// ), function ($db) {
//     $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
// });

Flight::register('db', 'PDO', array(
    'mysql:host=127.0.0.1;dbname=budget_citoyen_2025',
    'root',        // Ton utilisateur MySQL (par défaut)
    'yume'           // Ton mot de passe MySQL
), function ($db) {
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
});