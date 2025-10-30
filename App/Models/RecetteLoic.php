<?php
namespace App\Models;

use PDO;

class RecetteLoic {
    private $db;
    
    public function __construct($db) {
        $this->db = $db;    
    }
    
    public function getFiscalesInterieures($year) {
        $stmt = $this->db->prepare("SELECT * FROM recettes_fiscales_interieures WHERE annee = ?");
        $stmt->execute([$year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public function getDouanieres($year) {
        $stmt = $this->db->prepare("SELECT * FROM recettes_douanieres WHERE annee = ?");
        $stmt->execute([$year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public function getNonFiscales($year) {
        $stmt = $this->db->prepare("SELECT * FROM recettes_non_fiscales WHERE annee = ?");
        $stmt->execute([$year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public function getTotalRecettes($year) {
        $stmt = $this->db->prepare("SELECT * FROM total_recettes WHERE annee = ?");
        $stmt->execute([$year]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public function getEvolutionRecettes() {
        // Utilisation de query() car il n'y a pas de paramètres
        $stmt = $this->db->query("SELECT * FROM total_recettes ORDER BY annee");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
