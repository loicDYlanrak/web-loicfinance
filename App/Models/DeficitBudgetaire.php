<?php
namespace App\Models;

use PDO;

class DeficitBudgetaire {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function getAll() {
        $stmt = $this->db->query("SELECT * FROM deficit_budgetaire ORDER BY annee DESC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getByAnnee($annee) {
        $stmt = $this->db->prepare("SELECT * FROM deficit_budgetaire WHERE annee = ?");
        $stmt->execute([$annee]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
