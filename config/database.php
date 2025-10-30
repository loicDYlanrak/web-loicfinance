<?php
Flight::register('db', 'PDO', array(
    'mysql:host=localhost;dbname=budget_citoyen_2025', // DSN pour MySQL
    'root',          // Votre utilisateur MySQL
    ''                // Votre mot de passe MySQL
), function ($db) {
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
});