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

-- Insertion des données de base (exemple pour 2024 et 2025)
INSERT INTO perspectives_economiques (annee, pib_nominal, taux_croissance, inflation, ratio_depenses_pib, solde_global, solde_primaire, taux_change_usd, taux_change_eur, taux_investissement_public, taux_investissement_prive, taux_pression_fiscale) VALUES
(2024, 78945.4, 4.4, 8.2, 16.2, -4.3, 214.2, 4508.6, 4905.5, 6.1, 14.6, 10.6),
(2025, 88851.6, 5.0, 7.1, 18.4, -4.1, 1097.6, 4688.8, 5275.2, 9.6, 12.0, 11.2);

-- Insertion des données de croissance sectorielle (exemples)
INSERT INTO croissance_sectorielle (annee, secteur, sous_secteur, taux_croissance) VALUES
(2024, 'SECTEUR PRIMAIRE', NULL, 5.3),
(2025, 'SECTEUR PRIMAIRE', NULL, 7.8),
(2024, 'Agriculture', NULL, 6.0),
(2025, 'Agriculture', NULL, 9.5);

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


INSERT INTO croissance_sectorielle (annee, secteur, sous_secteur, taux_croissance) VALUES
-- SECTEUR PRIMAIRE
(2024, 'SECTEUR PRIMAIRE', NULL, 5.3), [cite: 259]
(2025, 'SECTEUR PRIMAIRE', NULL, 7.8), [cite: 259]
(2024, 'SECTEUR PRIMAIRE', 'Agriculture', 6.0), [cite: 259]
(2025, 'SECTEUR PRIMAIRE', 'Agriculture', 9.5), [cite: 259]
(2024, 'SECTEUR PRIMAIRE', 'Élevage et pêche', 3.9), [cite: 259]
(2025, 'SECTEUR PRIMAIRE', 'Élevage et pêche', 4.0), [cite: 259]
(2024, 'SECTEUR PRIMAIRE', 'Sylviculture', 1.0), [cite: 259]
(2025, 'SECTEUR PRIMAIRE', 'Sylviculture', 1.1), [cite: 259]

-- SECTEUR SECONDAIRE
(2024, 'SECTEUR SECONDAIRE', NULL, -3.3), [cite: 259]
(2025, 'SECTEUR SECONDAIRE', NULL, 3.4), [cite: 259]
(2024, 'SECTEUR SECONDAIRE', 'Industrie extractive', -20.8), [cite: 259]
(2025, 'SECTEUR SECONDAIRE', 'Industrie extractive', 4.0), [cite: 259]
(2024, 'SECTEUR SECONDAIRE', 'Alimentaire, boisson, tabac', 0.9), [cite: 259]
(2025, 'SECTEUR SECONDAIRE', 'Alimentaire, boisson, tabac', 2.4), [cite: 259]
(2024, 'SECTEUR SECONDAIRE', 'Textile', 31.6), [cite: 259]
(2025, 'SECTEUR SECONDAIRE', 'Textile', 4.0), [cite: 259]
(2024, 'SECTEUR SECONDAIRE', 'Bois, papiers, imprimerie', 0.4), [cite: 259]
(2025, 'SECTEUR SECONDAIRE', 'Bois, papiers, imprimerie', 0.7), [cite: 259]
(2024, 'SECTEUR SECONDAIRE', 'Matériaux de construction', 7.9), [cite: 259]
(2025, 'SECTEUR SECONDAIRE', 'Matériaux de construction', 8.0), [cite: 259]
(2024, 'SECTEUR SECONDAIRE', 'Industrie métallique', 7.2), [cite: 259]
(2025, 'SECTEUR SECONDAIRE', 'Industrie métallique', 7.3), [cite: 259]
(2024, 'SECTEUR SECONDAIRE', 'Machine, matériels électriques', 3.1), [cite: 259]
(2025, 'SECTEUR SECONDAIRE', 'Machine, matériels électriques', 3.2), [cite: 259]
(2024, 'SECTEUR SECONDAIRE', 'Industries diverses', 0.5), [cite: 259]
(2025, 'SECTEUR SECONDAIRE', 'Industries diverses', 0.6), [cite: 259]
(2024, 'SECTEUR SECONDAIRE', 'Électricité, eau, gaz', 3.9), [cite: 259]
(2025, 'SECTEUR SECONDAIRE', 'Électricité, eau, gaz', 4.0), [cite: 259]

-- SECTEUR TERTIAIRE
(2024, 'SECTEUR TERTIAIRE', NULL, 5.0), [cite: 261]
(2025, 'SECTEUR TERTIAIRE', NULL, 5.4), [cite: 261]
(2024, 'SECTEUR TERTIAIRE', 'BTP', 3.2), [cite: 261]
(2025, 'SECTEUR TERTIAIRE', 'BTP', 3.6), [cite: 261]
(2024, 'SECTEUR TERTIAIRE', 'Commerce, entretiens, réparations', 4.2), [cite: 261]
(2025, 'SECTEUR TERTIAIRE', 'Commerce, entretiens, réparations', 4.3), [cite: 261]
(2024, 'SECTEUR TERTIAIRE', 'Hôtel, restaurant', 14.7), [cite: 261]
(2025, 'SECTEUR TERTIAIRE', 'Hôtel, restaurant', 14.9), [cite: 261]
(2024, 'SECTEUR TERTIAIRE', 'Transport', 7.0), [cite: 261]
(2025, 'SECTEUR TERTIAIRE', 'Transport', 7.2), [cite: 261]
(2024, 'SECTEUR TERTIAIRE', 'Poste et télécommunication', 13.4), [cite: 261]
(2025, 'SECTEUR TERTIAIRE', 'Poste et télécommunication', 13.7), [cite: 261]
(2024, 'SECTEUR TERTIAIRE', 'Banque, assurance', 5.3), [cite: 261]
(2025, 'SECTEUR TERTIAIRE', 'Banque, assurance', 6.1), [cite: 261]
(2024, 'SECTEUR TERTIAIRE', 'Services aux entreprises', 2.3), [cite: 261]
(2025, 'SECTEUR TERTIAIRE', 'Services aux entreprises', 2.4), [cite: 261]
(2024, 'SECTEUR TERTIAIRE', 'Administration', 1.7), [cite: 261]
(2025, 'SECTEUR TERTIAIRE', 'Administration', 1.9), [cite: 261]
(2024, 'SECTEUR TERTIAIRE', 'Éducation', 1.7), [cite: 261]
(2025, 'SECTEUR TERTIAIRE', 'Éducation', 1.8), [cite: 261]
(2024, 'SECTEUR TERTIAIRE', 'Santé', 1.8), [cite: 261]
(2025, 'SECTEUR TERTIAIRE', 'Santé', 1.9), [cite: 261]
(2024, 'SECTEUR TERTIAIRE', 'Services rendus aux ménages', 1.3), [cite: 261]
(2025, 'SECTEUR TERTIAIRE', 'Services rendus aux ménages', 1.4); [cite: 261]