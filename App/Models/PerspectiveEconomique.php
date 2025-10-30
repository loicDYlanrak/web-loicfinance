<?php
namespace App\Models;

use PDO;

class PerspectiveEconomique {
    private $db;
    
    public function __construct($db) {
        $this->db = $db;
    }
    
    public function getAll() {
        // Utilisation de query() car il n'y a pas de paramètres, comme dans User::getAll()
        $stmt = $this->db->query("SELECT * FROM perspectives_economiques ORDER BY annee");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public function getByYear($year) {
        $stmt = $this->db->prepare("SELECT * FROM perspectives_economiques WHERE annee = ?");
        $stmt->execute([$year]);
        // J'utilise fetchAll ici, car il pourrait y avoir plusieurs perspectives pour une année.
        // Si 'annee' est unique, vous pouvez utiliser fetch() comme dans User::getById()
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
