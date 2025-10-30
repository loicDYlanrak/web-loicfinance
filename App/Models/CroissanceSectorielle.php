<?php
namespace App\Models;

use PDO;

class CroissanceSectorielle {
    private $db;
    
    public function __construct($db) {
        $this->db = $db;
    }
    
    public function getByYear($year) {
        $stmt = $this->db->prepare("SELECT * FROM croissance_sectorielle WHERE annee = ? ORDER BY secteur, sous_secteur");
        $stmt->execute([$year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public function getSecteursPrimaires($year) {
        $stmt = $this->db->prepare("SELECT * FROM croissance_sectorielle WHERE annee = ? AND secteur LIKE 'SECTEUR PRIMAIRE%'");
        $stmt->execute([$year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public function getSecteursSecondaires($year) {
        $stmt = $this->db->prepare("SELECT * FROM croissance_sectorielle WHERE annee = ? AND secteur LIKE 'SECTEUR SECONDAIRE%'");
        $stmt->execute([$year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public function getSecteursTertiaires($year) {
        $stmt = $this->db->prepare("SELECT * FROM croissance_sectorielle WHERE annee = ? AND secteur LIKE 'SECTEUR TERTIAIRE%'");
        $stmt->execute([$year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
