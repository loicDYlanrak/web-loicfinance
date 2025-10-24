<?php
namespace App\Models;

use PDO;

class Don {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function getAll() {
        $stmt = $this->db->query("SELECT * FROM dons ORDER BY annee DESC, montant DESC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getByAnnee($annee) {
        $stmt = $this->db->prepare("SELECT * FROM dons WHERE annee = ? ORDER BY montant DESC");
        $stmt->execute([$annee]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
