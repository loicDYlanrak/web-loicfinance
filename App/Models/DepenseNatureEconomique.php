<?php
namespace App\Models;

use PDO;

class DepenseNatureEconomique {
    private $db;

    public function __construct($db) {
        $this->db = $db;
    }

    public function getAll() {
        $stmt = $this->db->query("SELECT * FROM depenses_nature_economique ORDER BY annee DESC, montant DESC");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getByAnnee($annee) {
        $stmt = $this->db->prepare("SELECT * FROM depenses_nature_economique WHERE annee = ? ORDER BY montant DESC");
        $stmt->execute([$annee]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
