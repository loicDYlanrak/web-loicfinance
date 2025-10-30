-- Création de la base de données
CREATE DATABASE IF NOT EXISTS budget_citoyen_2025;
USE budget_citoyen_2025;

-- Table pour les perspectives économiques
CREATE TABLE perspectives_economiques (
    id INT AUTO_INCREMENT PRIMARY KEY,
    annee INT NOT NULL,
    pib_nominal DECIMAL(15,2), -- en milliards d'Ariary
    taux_croissance DECIMAL(4,2),
    inflation DECIMAL(4,2),
    ratio_depenses_pib DECIMAL(4,2),
    solde_global DECIMAL(4,2),
    solde_primaire DECIMAL(10,2),
    taux_change_usd DECIMAL(8,2),
    taux_change_eur DECIMAL(8,2),
    taux_investissement_public DECIMAL(4,2),
    taux_investissement_prive DECIMAL(4,2),
    taux_pression_fiscale DECIMAL(4,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour la croissance sectorielle
CREATE TABLE croissance_sectorielle (
    id INT AUTO_INCREMENT PRIMARY KEY,
    annee INT NOT NULL,
    secteur VARCHAR(100) NOT NULL,
    sous_secteur VARCHAR(150),
    taux_croissance DECIMAL(5,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les recettes fiscales intérieures
CREATE TABLE recettes_fiscales_interieures (
    id INT AUTO_INCREMENT PRIMARY KEY,
    annee INT NOT NULL,
    type_impot VARCHAR(100) NOT NULL,
    montant DECIMAL(12,2), -- en milliards d'Ariary
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les recettes douanières
CREATE TABLE recettes_douanieres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    annee INT NOT NULL,
    type_droit_taxe VARCHAR(100) NOT NULL,
    montant DECIMAL(12,2), -- en milliards d'Ariary
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les recettes non fiscales
CREATE TABLE recettes_non_fiscales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    annee INT NOT NULL,
    type_recette VARCHAR(100) NOT NULL,
    montant DECIMAL(12,2), -- en milliards d'Ariary
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les dons
CREATE TABLE dons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    annee INT NOT NULL,
    type_don VARCHAR(50) NOT NULL,
    montant DECIMAL(12,2), -- en milliards d'Ariary
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les dépenses par nature économique
CREATE TABLE depenses_nature_economique (
    id INT AUTO_INCREMENT PRIMARY KEY,
    annee INT NOT NULL,
    rubrique VARCHAR(100) NOT NULL,
    montant DECIMAL(12,2), -- en milliards d'Ariary
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les dépenses par ministère/institution
CREATE TABLE depenses_par_institution (
    id INT AUTO_INCREMENT PRIMARY KEY,
    annee INT NOT NULL,
    institution VARCHAR(150) NOT NULL,
    montant DECIMAL(12,2), -- en milliards d'Ariary
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour la dette
CREATE TABLE dette (
    id INT AUTO_INCREMENT PRIMARY KEY,
    annee INT NOT NULL,
    type_dette VARCHAR(50) NOT NULL, -- 'exterieure' ou 'interieure'
    principal DECIMAL(12,2), -- en milliards d'Ariary
    interets DECIMAL(12,2), -- en milliards d'Ariary
    taux_interet_moyen DECIMAL(5,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les postes budgétaires
CREATE TABLE postes_budgetaires (
    id INT AUTO_INCREMENT PRIMARY KEY,
    annee INT NOT NULL,
    ministere VARCHAR(150) NOT NULL,
    nombre_postes INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les programmes d'investissement
CREATE TABLE programmes_investissement (
    id INT AUTO_INCREMENT PRIMARY KEY,
    annee INT NOT NULL,
    secteur VARCHAR(100) NOT NULL,
    programme VARCHAR(200) NOT NULL,
    description TEXT,
    montant DECIMAL(12,2), -- en milliards d'Ariary
    source_financement VARCHAR(50), -- 'interne' ou 'externe'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour le déficit budgétaire
CREATE TABLE deficit_budgetaire (
    id INT AUTO_INCREMENT PRIMARY KEY,
    annee INT NOT NULL,
    recettes_total DECIMAL(12,2), -- en milliards d'Ariary
    depenses_total DECIMAL(12,2), -- en milliards d'Ariary
    deficit DECIMAL(12,2), -- en milliards d'Ariary
    deficit_pib DECIMAL(4,2),
    financement_interne DECIMAL(12,2),
    financement_externe DECIMAL(12,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les dispositions fiscales
CREATE TABLE dispositions_fiscales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_impot VARCHAR(100) NOT NULL,
    article VARCHAR(50),
    description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les acronymes
CREATE TABLE acronymes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    acronym VARCHAR(20) NOT NULL,
    signification VARCHAR(200) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour le glossaire
CREATE TABLE glossaire (
    id INT AUTO_INCREMENT PRIMARY KEY,
    terme VARCHAR(100) NOT NULL,
    definition TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les totaux des recettes
CREATE TABLE total_recettes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    annee INT NOT NULL,
    impots DECIMAL(12,2),
    douanes DECIMAL(12,2),
    recettes_non_fiscales DECIMAL(12,2),
    dons DECIMAL(12,2),
    total DECIMAL(12,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertion des données principales
INSERT INTO perspectives_economiques (annee, pib_nominal, taux_croissance, inflation, ratio_depenses_pib, solde_global, solde_primaire, taux_change_usd, taux_change_eur, taux_investissement_public, taux_investissement_prive, taux_pression_fiscale) VALUES
(2024, 78945.4, 4.4, 8.2, 16.2, -4.3, 214.2, 4508.6, 4905.5, 6.1, 14.6, 10.6),
(2025, 88851.6, 5.0, 7.1, 18.4, -4.1, 10976.0, 4688.8, 5275.2, 9.6, 12.0, 11.2),
(2026, 99826.3, 5.2, 7.2, 17.8, -4.1, 866.0, 4853.2, 5532.7, 8.3, 13.7, 11.8);

-- Croissance sectorielle 2024
INSERT INTO croissance_sectorielle (annee, secteur, sous_secteur, taux_croissance) VALUES
(2024, 'SECTEUR PRIMAIRE', NULL, 5.3),
(2024, 'Agriculture', NULL, 6.0),
(2024, 'Élevage et pêche', NULL, 3.9),
(2024, 'Sylviculture', NULL, 1.0),
(2024, 'SECTEUR SECONDAIRE', NULL, -3.3),
(2024, 'Industrie extractive', NULL, -20.8),
(2024, 'Alimentaire, boisson, tabac', NULL, 0.9),
(2024, 'Textile', NULL, 31.6),
(2024, 'Bois, papiers, imprimerie', NULL, 0.4),
(2024, 'Matériaux de construction', NULL, 7.9),
(2024, 'Industrie métallique', NULL, 7.2),
(2024, 'Machine, matériels électriques', NULL, 3.1),
(2024, 'Industries diverses', NULL, 0.5),
(2024, 'Électricité, eau, gaz', NULL, 3.9),
(2024, 'SECTEUR TERTIAIRE', NULL, 5.0),
(2024, 'BTP', NULL, 3.2),
(2024, 'Commerce, entretiens, réparations', NULL, 4.2),
(2024, 'Hôtel, restaurant', NULL, 14.7),
(2024, 'Transport', NULL, 7.0),
(2024, 'Poste et télécommunication', NULL, 13.4),
(2024, 'Banque, assurance', NULL, 5.3),
(2024, 'Services aux entreprises', NULL, 2.3),
(2024, 'Administration', NULL, 1.7),
(2024, 'Éducation', NULL, 1.7),
(2024, 'Santé', NULL, 1.8),
(2024, 'Services rendus aux ménages', NULL, 1.3);

-- Croissance sectorielle 2025
INSERT INTO croissance_sectorielle (annee, secteur, sous_secteur, taux_croissance) VALUES
(2025, 'SECTEUR PRIMAIRE', NULL, 7.8),
(2025, 'Agriculture', NULL, 9.5),
(2025, 'Élevage et pêche', NULL, 4.0),
(2025, 'Sylviculture', NULL, 1.1),
(2025, 'SECTEUR SECONDAIRE', NULL, 3.4),
(2025, 'Industrie extractive', NULL, 4.0),
(2025, 'Alimentaire, boisson, tabac', NULL, 2.4),
(2025, 'Textile', NULL, 4.0),
(2025, 'Bois, papiers, imprimerie', NULL, 0.7),
(2025, 'Matériaux de construction', NULL, 8.0),
(2025, 'Industrie métallique', NULL, 7.3),
(2025, 'Machine, matériels électriques', NULL, 3.2),
(2025, 'Industries diverses', NULL, 0.6),
(2025, 'Électricité, eau, gaz', NULL, 4.0),
(2025, 'SECTEUR TERTIAIRE', NULL, 5.4),
(2025, 'BTP', NULL, 3.6),
(2025, 'Commerce, entretiens, réparations', NULL, 4.3),
(2025, 'Hôtel, restaurant', NULL, 14.9),
(2025, 'Transport', NULL, 7.2),
(2025, 'Poste et télécommunication', NULL, 13.7),
(2025, 'Banque, assurance', NULL, 6.1),
(2025, 'Services aux entreprises', NULL, 2.4),
(2025, 'Administration', NULL, 1.9),
(2025, 'Éducation', NULL, 1.8),
(2025, 'Santé', NULL, 1.9),
(2025, 'Services rendus aux ménages', NULL, 1.4);

-- Recettes fiscales intérieures 2024
INSERT INTO recettes_fiscales_interieures (annee, type_impot, montant) VALUES
(2024, 'Impôt sur les revenus', 1178.0),
(2024, 'Impôt sur les revenus Salariaux et Assimilés', 848.2),
(2024, 'Impôt sur les revenus des Capitaux Mobiliers', 78.2),
(2024, 'Impôt sur les plus-values Immobilières', 14.0),
(2024, 'Impôt Synthétique', 132.3),
(2024, 'Droit d\'Enregistrement', 49.0),
(2024, 'Taxe sur la Valeur Ajoutée', 1400.2),
(2024, 'Impôt sur les marchés Publics', 148.7),
(2024, 'Droit d\'Accès', 754.1),
(2024, 'Taxes sur les Assurances', 17.2),
(2024, 'Droit de Timbres', 14.1),
(2024, 'Autres', 1.5);

-- Recettes fiscales intérieures 2025
INSERT INTO recettes_fiscales_interieures (annee, type_impot, montant) VALUES
(2025, 'Impôt sur les revenus', 1411.4),
(2025, 'Impôt sur les revenus Salariaux et Assimilés', 889.9),
(2025, 'Impôt sur les revenus des Capitaux Mobiliers', 93.7),
(2025, 'Impôt sur les plus-values Immobilières', 18.3),
(2025, 'Impôt Synthétique', 164.7),
(2025, 'Droit d\'Enregistrement', 62.8),
(2025, 'Taxe sur la Valeur Ajoutée (y compris Taxe sur les transactions Mobiles)', 1742.2),
(2025, 'Impôt sur les marchés Publics', 250.0),
(2025, 'Droit d\'Accès (y compris Taxe environnementale)', 955.4),
(2025, 'Taxes sur les Assurances', 20.6),
(2025, 'Droit de Timbres', 16.8),
(2025, 'Autres', 2.7);

-- Recettes douanières 2024
INSERT INTO recettes_douanieres (annee, type_droit_taxe, montant) VALUES
(2024, 'Droit de douane', 847.5),
(2024, 'TVA à l\'importation', 1768.3),
(2024, 'Taxe sur les produits pétroliers', 308.0),
(2024, 'TVA sur les produits pétroliers', 842.8),
(2024, 'Droit de navigation', 1.2),
(2024, 'Autres', 0.2);

-- Recettes douanières 2025
INSERT INTO recettes_douanieres (annee, type_droit_taxe, montant) VALUES
(2025, 'Droit de douane', 1010.7),
(2025, 'TVA à l\'importation', 2148.3),
(2025, 'Taxe sur les produits pétroliers', 326.0),
(2025, 'TVA sur les produits pétroliers', 879.0),
(2025, 'Droit de navigation', 1.9),
(2025, 'Autres', 0.1);

-- Recettes non fiscales
INSERT INTO recettes_non_fiscales (annee, type_recette, montant) VALUES
(2024, 'Dividendes', 89.5),
(2024, 'Productions immobilières financières', 0.5),
(2024, 'Redevance de pêche', 10.0),
(2024, 'Redevance minières', 84.9),
(2024, 'Autres redevance', 9.7),
(2024, 'Produits des activités et autres', 11.1),
(2024, 'Autres', 140.1),
(2025, 'Dividendes', 120.2),
(2025, 'Productions immobilières financières', 2.1),
(2025, 'Redevance de pêche', 15.0),
(2025, 'Redevance minières', 331.2),
(2025, 'Autres redevance', 10.0),
(2025, 'Produits des activités et autres', 8.1),
(2025, 'Autres', 5.2);

-- Totaux des recettes
INSERT INTO total_recettes (annee, impots, douanes, recettes_non_fiscales, dons, total) VALUES
(2024, 4636.5, 3768.0, 345.9, 1086.3, 9836.7),
(2025, 5928.4, 4366.0, 491.7, 2478.6, 13264.7);

-- Insertion des acronymes
INSERT INTO acronymes (acronym, signification) VALUES
('BAD', 'Banque Africaine pour le Développement'),
('CRCM', 'Caisse de Retraite Civile et Militaire'),
('HT', 'Hors Taxe'),
('IFPB', 'Impôt Foncier sur la Propriété Bâtie'),
('IFT', 'Impôt Foncier sur le Terrain');

-- Insertion du glossaire
INSERT INTO glossaire (terme, definition) VALUES
('Souveraineté alimentaire', 'Capacité d''un pays à produire suffisamment de nourriture pour répondre aux besoins de sa population, en réduisant sa dépendance vis-à-vis des importations.'),
('Transition énergétique', 'Processus de passage des énergies polluantes (charbon, pétrole) vers des énergies renouvelables (solaire, éolien), afin de réduire l''impact sur l''environnement et de garantir une production énergétique durable.');
