<?php
namespace App\Models;

use PDO;

class PosteBudgetaire {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function getAll() {
        $stmt = $this->db->query("SELECT * FROM postes_budgetaires ORDER BY annee DESC, nombre_postes DESC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getByAnnee($annee) {
        $stmt = $this->db->prepare("SELECT * FROM postes_budgetaires WHERE annee = ? ORDER BY nombre_postes DESC");
        $stmt->execute([$annee]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
