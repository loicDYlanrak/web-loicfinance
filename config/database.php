<?php
Flight::register('db', 'PDO', array(
    'pgsql:host=localhost;port=5432;dbname=test',
    'postgres',        // ton utilisateur PostgreSQL
    ''       // ton mot de passe
), function ($db) {
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
});