-- Suppression des tables si existantes (et cascade pour les dépendances)
DROP TABLE IF EXISTS ACTIVITE_PEDAGOGIQUE CASCADE;
DROP TABLE IF EXISTS APPRENTISSAGE_CRITIQUE CASCADE;
DROP TABLE IF EXISTS COMPETENCE CASCADE;
DROP TABLE IF EXISTS ANNEE CASCADE;
DROP TABLE IF EXISTS PREUVE_AC CASCADE;
DROP TABLE IF EXISTS COMPETENCE_PREUVE CASCADE;
DROP TABLE IF EXISTS PREUVES CASCADE;
DROP TABLE IF EXISTS SAE CASCADE;
DROP TABLE IF EXISTS PROJET CASCADE;
DROP TABLE IF EXISTS TECHNOLOGIE CASCADE;
DROP TABLE IF EXISTS CONTACT CASCADE;
-- puis tes DROP existants (ACTIVITE_PEDAGOGIQUE, APPRENTISSAGE_CRITIQUE, COMPETENCE, ANNEE)
-- ============================================================
-- TABLE DES COMPÉTENCES DU BUT SCIENCES DES DONNÉES
-- ============================================================
CREATE TABLE IF NOT EXISTS COMPETENCE (
    id_competence CHAR(2) PRIMARY KEY,  -- C1 à C4
    intitule TEXT NOT NULL,
    description TEXT NOT NULL
);

INSERT INTO COMPETENCE (id_competence, intitule, description) VALUES
('C1', 'Traiter des données à des fins décisionnelles', $$
En intervenant à toutes les étapes du cycle de vie de la donnée (insertion, modification, extraction, suppression)
En utilisant le modèle de données adapté aux besoins
En s’inscrivant dans une démarche de documentation des réalisations adaptée au public visé
En traduisant correctement les demandes métier en programmes, avec le respect du cahier des charges s'il existe
En écrivant un programme correctement structuré et documenté, respectant les bonnes pratiques
En identifiant les librairies et langages dédiés
$$),
('C2', 'Analyser statistiquement les données', $$
En tenant compte du contexte de l’étude (économique, socio-démographique, commerciale, clinique...)
En mettant en évidence les grandes tendances et les informations principales
En identifiant et en mettant en œuvre les techniques adaptées aux attentes du client ou de l’instance décisionnaire
En identifiant et en mettant en œuvre les techniques adaptées aux données complexes (données massives, données mal structurées, flux de données…)
En tenant compte du contexte inférentiel (variabilité de l’échantillon)
$$),
('C3', 'Valoriser une production dans un contexte professionnel', $$
En s’adaptant au niveau d’expertise, à la culture et au statut du destinataire
En s’exprimant correctement, aussi bien en français qu’en anglais, à l'oral comme à l'écrit
En veillant aux aspects éthiques, déontologiques et réglementaires d’utilisation et de diffusion des données
En interprétant et contextualisant les résultats (citations, vérification des sources, esprit critique)
En utilisant la forme de restitution adaptée
En tenant compte des réalités économiques et managériales des entreprises
$$),
('C4', 'Développer un outil décisionnel', $$
En mettant en œuvre une structuration des données adaptée à leurs caractéristiques (type, volume...)
En assurant la qualité des données et minimisant les biais liés à l’incertitude et l’imprécision dans les sources
En étant sensible aux aspects éthiques, déontologiques et juridiques d’utilisation et de diffusion des données
En réalisant des solutions de visualisation spécifiques aux données métier
En intervenant à différents niveaux de la chaîne décisionnelle
En utilisant des méthodes de développement logiciel
$$)
ON CONFLICT DO NOTHING;


-- ============================================================
-- TABLE DES ANNÉES
-- ============================================================
CREATE TABLE IF NOT EXISTS ANNEE (
    id_annee CHAR(4) PRIMARY KEY,  -- ex: BUT1, BUT2, BUT3
    intitule TEXT NOT NULL,
);

INSERT INTO ANNEE (id_annee, intitule) VALUES
('BUT1', 'Traiter des données structurées / Mettre en œuvre une analyse descriptive / Contextualiser et présenter les données'),
('BUT2', 'Automatiser le traitement de données multidimensionnelles / Mettre en œuvre une analyse exploratoire / Restituer et argumenter ses résultats / Développer un composant d’une solution décisionnelle'),
('BUT3', 'Intégrer le traitement de données complexes / Mettre en œuvre l''analyse exploratoire de données complexes / Intégrer et valoriser sa production dans l''écosystème de l''entreprise / Participer au déploiement d''une solution décisionnelle')
ON CONFLICT DO NOTHING;



-- ============================================================
-- TABLE DES ACTIVITÉS PÉDAGOGIQUES
-- ============================================================
CREATE TABLE IF NOT EXISTS ACTIVITE_PEDAGOGIQUE (
    num INT PRIMARY KEY,
    semestre INT NOT NULL,
    heure INT NOT NULL,
    skill TEXT NOT NULL,
    id_competence CHAR(2) NOT NULL,
    FOREIGN KEY (id_competence) REFERENCES COMPETENCE(id_competence)
);

INSERT INTO ACTIVITE_PEDAGOGIQUE (semestre, heure, skill, id_competence) VALUES
-- SEMESTRE 1
(1, 15, 'Etude données envt ent & éco (intro marketing)', 'C3'),
(1, 22, 'Base de données relationnelles 1', 'C1'),
(1, 40, 'Statistique descriptive 1', 'C2'),
(1, 19, 'Bases de la programmation 2', 'C4'),
(1, 4, 's1 Analyse des données d''une enquete', 'C2'),
(1, 15, 'Bases de l''algèbre', 'C2'),
(1, 22, 'Probabilités 1', 'C2'),
(1, 15, 'Bases de la programmation 1', 'C4'),
(1, 38, 'Découverte données entrepreunarial et économique', 'C3'),
(1, 6, 'Statistique descriptive 1 (TP)', 'C2'),
(1, 7, 'PPP - tutorat 1P', 'C3'),
(1, 4, 'Projet Personnel et Professionnel 1', 'C3'),
(1, 1, 'Bases de l''algèbre', 'C2'),
(1, 3, 'Probabilités 1 (machine)', 'C2'),
(1, 5, 'Bases de la programmation 1', 'C4'),
(1, 4, 'Statistique descriptive 1', 'C2'),
(1, 10, 'Bases de la programmation 1 (TP)', 'C4'),
(1, 8, 'Base de données relationnelles 1 (TP)', 'C1'),
(1, 4, 'Probabilités 1', 'C2'),
(1, 6, 's1 Communication de l''information : l''enquête', 'C3'),
(1, 2, 'Découverte données entrepreunarial et économique', 'C3'),
(1, 7, 'Projet Personnel et Professionnel 1 (autonomie)', 'C3'),
(1, 8, 's1 Communication de l''information et recherche documentaire', 'C3'),
(1, 6, 'Bases de la programmation 2 (TP)', 'C4'),
(1, 2, 'Projet Personnel et Professionnel 1 : fiches métiers', 'C3'),
(1, 2, 'Bases de la programmation 2', 'C4'),
(1, 6, 'Découverte données entrepreunarial et économique (autonomie)', 'C3'),
(1, 2, 'Bases de la programmation 1 (CJ)', 'C4'),
(1, 12, 'Tableur et reporting', 'C3'),
(1, 4, 'Analyse des données d''une enquete (projet)', 'C2'),
(1, 26, 'Mathématiques - Analyse (CJ)', 'C2'),
(1, 28, 'Statistique inférentielle', 'C2'),
(1, 7, 'Régression sur données réelles', 'C2'),
(1, 5, 'Ecriture et lecture de fichiers de données', 'C1'),
(1, 8, 'Reporting et datavisualisation CF', 'C3'),
(1, 2, 'dataviz rentrée', 'C3'),
(1, 8, 'Estimation par échantillonnage', 'C2'),
(1, 8, 'Communication et sémiologie - Suite office', 'C3'),
(1, 2, 'dataviz rentrée restit', 'C3'),
(1, 9, 'Analyse des données d''une enquete', 'C2'),
(1, 6, 'Ecriture et lecture de fichiers de données (non encadré)', 'C1'),
(1, 3, 'Reporting données stockées dans SGBD relationnel (projet)', 'C3'),
(1, 7, 'Mathématiques - Analyse (CF)', 'C2'),
(1, 12, 'Mathématiques - Analyse (DC)', 'C2'),
(1, 4, 'Mathématiques - Analyse (TP)', 'C2'),
(1, 16, 'Communication et sémiologie', 'C3'),
(1, 10, 'Tableur et reporting (TP)', 'C3'),
(1, 3, 'Analyse de données reporting et datavisualisation (restitution)', 'C3'),
(1, 9, 'Conception et implémentation d''une base de données (non encadré)', 'C1'),
(1, 9, 'Datavisualisation', 'C3'),
(1, 2, 'Préparation et synthèse tableau de données pour analyse (lancemen t)', 'C1'),
(1, 20, 'Apprendre en situation la prod°de données en entreprise', 'C3'),
(1, 6, 'Energie - environnement (POL)', 'C3'),
(1, 19, 'Communication de l''information et recherche documentaire (A.Morea ux)', 'C3'),
(1, 6, 'Programmation statistique (VBA)', 'C4'),
(1, 3, 'Apprendre en situation la prod°de données en entreprise (autonomi e)', 'C3'),
(1, 1, 'Méthodologie du travail universitaire', 'C3'),
(1, 3, 'Conférence métier (INSEE stat)', 'C3'),
(1, 2, 'PPP2 : Le métier d''Enseigant-Chercheur', 'C3'),
(1, 1, 'Présentation alternance (par mme Joly)', 'C3'),
(1, 3, 'Présentation en anglais territoire economique culturel', 'C3'),
(1, 3, 'Reporting et datavisualisation CJ', 'C3'),
(1, 2, 'rentrée PEC SD', 'C3'),
(1, 3, 'Présentation en anglais territoire économique culturel', 'C3'),

-- SEMESTRE 2
(2, 4, 'Projet Personnel et Professionnel 2 (autonomie)', 'C3'),
(2, 8, 'Statistique descriptive 2', 'C2'),
(2, 21, 'Probabilités 2', 'C2'),
(2, 2, 'Statistique descriptive 2', 'C2'),
(2, 22, 'Approfondissement de l''anglais de spécialité', 'C3'),
(2, 2, 'Ecriture et lecture de fichiers de données (soutenances)', 'C1'),
(2, 2, 'Projet Personnel et Professionnel 2', 'C3'),
(2, 16, 'Base de données relationnelles 2', 'C1'),
(2, 6, 'Portfolio (soutenance)', 'C3'),
(2, 6, 'Soutenances PPP S2', 'C3'),
(2, 6, 'Probabilités 2 - simulation', 'C2'),
(2, 6, 'Base de données relationnelles 2 (TP)', 'C1'),
(2, 8, 'Participation aux soutenances', 'C3'),
(2, 2, 'Base de données relationnelles 2', 'C1'),
(2, 1, 'PPP - tutorat 2P', 'C3'),
(2, 3, 'Analyse de données reporting et datavisualisation (soutenance mét ier)', 'C3'),
(2, 4, 'Analyse de données reporting et datavisualisation (soutenance tec hnique)', 'C3'),
(2, 2, 'Probabilités 2', 'C2'),
(2, 93, 'Analyse de données reporting et datavisualisation (Non encadré)', 'C3'),
(2, 7, 'Portfolio (autonomie)', 'C3'),
(2, 32, 'Etude données environnement entrepreunarial & écononique', 'C3'),
(2, 12, 'Analyse de données reporting et datavisualisation (CdP)', 'C3'),
(2, 3, 'Energie - environnement', 'C3'),
(2, 10, 'Conception et implémentation d''une base de données', 'C1'),
(2, 8, 'enquête - administration terrain', 'C3'),
(2, 9, 'Reporting données stockées dans SGBD relationnel (projet)', 'C3'),
(2, 8, 'Analyse de données reporting et datavisualisation (tutorat CJ)', 'C3'),
(2, 14, 'Mise en oeuvre d''une enquête - projet non encadré', 'C2'),
(2, 6, 'Préparation et synthèse tableau de données pour analyse', 'C1'),
(2, 5, 'Programmation statistique (R TD)', 'C4'),
(2, 25, 'Anglais de spécialité', 'C3'),
(2, 10, 'Portfolio (non encadré)', 'C3'),
(2, 6, 'Programmation statistique (QGIS)', 'C4'),
(2, 8, 'Reporting et datavisualisation CJ TP', 'C3'),
(2, 12, 'Analyse des données d''une enquete (non encadré)', 'C2'),
(2, 4, 'PPP1 Presentation', 'C3'),
(2, 10, 'Mise en oeuvre d''une enquête', 'C2'),
(2, 7, 'Mise en oeuvre d''une enquête - projet', 'C2'),
(2, 2, 'Cours Moodle : Être étudiant\, ça s''apprend', 'C3'),
(2, 1, 'Estimation par échantillonnage (projet)', 'C2'),
(2, 10, 'Journées portes ouvertes Dole', 'C3'),
(2, 12, 'Analyse de données reporting et datavisualisation (tutorat)', 'C3'),
(2, 3, 'Présentation en anglais territoire economique culturel', 'C3'),
(2, 12, 'Construction et présentation d''indicateurs de performance', 'C3'),
(2, 2, 'Ecriture et lecture de fichiers de données (projet)', 'C1'),
(2, 4, 'Conférence métier (BD issus de capteurs)', 'C3'),
(2, 5, 'Alternance dating', 'C3'),
(2, 8, 'Communication et sémiologie - image de marque', 'C3'),
(2, 4, 'Communication et sémiologie TP', 'C3'),
(2, 5, 'Portfolio', 'C3'),
(2, 5, 'Reporting données stockées dans SGBD relationnel', 'C3'),
(2, 4, 'Programmation statistique (VBA)', 'C4'),
(2, 4, 'Analyse de données reporting et datavisualisation (rapport)', 'C3'),
(2, 1, 'Préparation et synthèse tableau de données pour analyse (projet)', 'C1'),
(2, 1, 'Mathématiques - Analyse (CJ)', 'C2'),
(2, 3, 'Fresque du climat', 'C3'),
(2, 1, 'Reporting et datavisualisation CF', 'C3'),
(2, 3, 'Conception et implémentation d''une base de données (projet)', 'C1'),
(2, 4, 'Programmation statistique (R TP)', 'C4'),
(2, 1, 'Conseil de département', 'C3'),
(2, 1, 'Prog - bonnes pratiques', 'C4'),
(2, 3, 'Préparation et synthèse tableau de données pour analyse', 'C1'),
(2, 2, 'Energie - environnement (POL)', 'C3'),
(2, 2, 'Apprendre en situation la prod°de données en entreprise (projet)', 'C3'),
(2, 2, 'Estimation par échantillonnage (non encadré)', 'C2'),
(2, 3, 'Communication de l''information et recherche documentaire', 'C3'),
(2, 2, 'retard ouverture gymnase', 'C3'),
(2, 2, 'Préparation et synthèse tableau de données pour analyse', 'C1'),
(2, 5, 'Dolesup', 'C3'),
(2, 2, 'dataviz rentrée (avec S3)', 'C3'),
(2, 2, 'Statistique inférentielle', 'C2'),
(2, 2, 'Mathématiques - Analyse (CF)', 'C2'),
(2, 2, 'Tableur et reporting', 'C3'),

-- SEMESTRE 3
(3, 24, 'SAÉ 3.03 - Description et prévision de données temporelles', 'C2'),
(3, 28, 's3 Communication organisationnelle et professionnelle', 'C3'),
(3, 12, 'SAÉ 3.01 - Collecte automatisée de données web (Autonomie)', 'C4'),
(3, 6, 'SAÉ 3.02 - Intégration de données dans un Datawarehouse (projet)', 'C1'),
(3, 3, 'SAÉ 3.01 - Collecte automatisée de données web (projet CJ)', 'C4'),
(3, 12, 'SAÉ 3.01 - Collecte automatisée de données web (CJ)', 'C4'),
(3, 3, 'SAÉ 3.01 - Collecte automatisée de données web (projet DT)', 'C4'),
(3, 12, 'SAÉ 3.01 - Collecte automatisée de données web (DT)', 'C4'),
(3, 20, 'SAÉ 3.02 - Intégration de données dans un Datawarehouse', 'C1'),
(3, 6, 'Introduction aux techniques de sondage', 'C2'),
(3, 18, 'SAÉ 3.02 - Intégration de données dans un Datawarehouse (autonomi e)', 'C1'),
(3, 2, 'dataviz rentrée (avec S3)', 'C3'),
(3, 12, 'Introduction à la cybersécurité des données', 'C1'),
(3, 12, 'Introduction aux données textuelles', 'C2'),
(3, 17, 'SAÉ 3.04 - Conformité réglementaire pour traiter des données', 'C1'),
(3, 1, 'Introduction aux techniques de sondage - test', 'C2'),
(3, 2, 'Technologie web', 'C4'),
(3, 10, 'Anglais scientifique et argumentation', 'C3'),
(3, 28, 'Sport', 'C3'),
(3, 10, 'Technologie web', 'C4'),
(3, 20, 'Algèbre linéaire', 'C2'),
(3, 12, 'Exploration et valorisation de la donnée cadre juridique/éco', 'C3'),
(3, 13, 'Automatisation et test', 'C4'),
(3, 12, 'Classification automatique', 'C2'),
(3, 2, 'Données de l''environnement (autonomie)', 'C3'),
(3, 6, 'Programmation objet (projet autonomie)', 'C4'),
(3, 22, 'Test d''hypothèses pour analyse bi-variée', 'C2'),
(3, 4, 'Projet personnel et professionnel : PE', 'C3'),
(3, 3, 'Projet personnel et professionnel : connaissance de soi', 'C3'),
(3, 2, 'dataviz rentrée restit', 'C3'),
(3, 8, 'Projet personnel et professionnel : Posture professionnelle', 'C3'),
(3, 8, 'Explor. et valor. cadre juridique/éco - partie RSE', 'C3'),
(3, 10, 'Journées portes ouvertes Dole', 'C3'),
(3, 1, 'rentrée PEC SD', 'C3'),
(3, 6, 'Projet personnel et professionnel', 'C3'),
(3, 2, 'Méthodes factorielles', 'C2'),
(3, 6, 'Automatisation et test (projet)', 'C4'),
(3, 13, 'Système d''information géographique', 'C3'),

-- SEMESTRE 4
(4, 10, 'SAÉ 4.02 - Reporting d''une analyse multivariée (autonomie)', 'C3'),
(4, 7, 'SAÉ 4.01 - Développement composant solution décisionnelle (projet )', 'C4'),
(4, 4, 'Programmation statistique avancée (projet autonomie)', 'C4'),
(4, 18, 'Utilisation d''outils de reporting 2', 'C3'),
(4, 16, 'Utilisation avancée d''outils de reporting', 'C3'),
(4, 11, 'SAÉ 4.02 - Reporting d''une analyse multivariée (ACM)', 'C3'),
(4, 9, 'SAÉ 4.02 - Reporting d''une analyse multivariée (RShiny)', 'C3'),
(4, 2, 'Programmation statistique avancée (projet)', 'C4'),
(4, 2, 'SAÉ 4.02 - Reporting d''une analyse multivariée (ACM)', 'C3'),
(4, 18, 'Programmation statistique avancée', 'C4'),
(4, 3, 'Projet personnel et professionnel : soutenance', 'C3'),
(4, 3, 'SAÉ 4.02 - Reporting d''une analyse multivariée (projet CJ)', 'C3'),
(4, 3, 'soutenances PPP s4', 'C3'),
(4, 27, 'SAÉ 4.01 - Développement composant solution décisionnelle (autono mie)', 'C4'),
(4, 8, 'soutenances alternance', 'C3'),
(4, 6, 'SAÉ 4.01 - Développement composant solution décisionnelle', 'C4'),
(4, 4, 'Portfolio s4', 'C3'),
(4, 4, 'soutenances Portfolio s4', 'C3'),
(4, 2, 'SAÉ 4.01 - Développement composant solution décisionnelle (souten ance)', 'C4'),
(4, 20, 'Programmation objet', 'C4'),
(4, 4, 'Portfolio', 'C3'),
(4, 31, 'Données de l''environnement entreprena et éco pour aide décis', 'C1'),
(4, 24, 'Anglais professionnel', 'C3'),
(4, 20, 'Systèmes d''information décisionnels', 'C4'),
(4, 3, 'Portfolio (autonomie)', 'C3'),
(4, 16, 'Méthodes factorielles', 'C2'),
(4, 16, 'Préparation / Intégration de données', 'C1'),
(4, 8, 'Communication scientifique et argumentation', 'C3'),
(4, 4, 'Projet personnel et professionnel : IA génératives', 'C2'),
(4, 6, 'Classification automatique (compléments)', 'C2'),
(4, 10, 'Droit', 'C3'),
(4, 12, 'Programmation web', 'C4'),
(4, 2, 'Programmation objet (projet)', 'C4'),
(4, 2, 'Présentation règles de l''alternance', 'C3'),
(4, 2, 'Test d''hypothèses pour analyse bi-variée', 'C2'),
(4, 4, 'Mon alternance en anglais', 'C3'),
(4, 1, 'Conseil de département', 'C3'),
(4, 2, 'Test d''hypothèses pour analyse bi-variée', 'C2'),

-- SEMESTRE 5
(5, 12, 'SAÉ 5.01 - Analyse et conception d''un outil décisionnel', 'C4'),
(5, 7, 'SAÉ 5.01 - Analyse et conception d''un outil décisionnel (projet)', 'C4'),
(5, 14, 'SAÉ 5.01 - Analyse et conception d''un outil décisionnel JA', 'C4'),
(5, 12, 'SAÉ 5.02 - Migration NoSQL', 'C1'),
(5, 21, 'SAÉ 5.01 - Analyse et conception d''un outil décisionnel (projet a utonomie)', 'C4'),
(5, 12, 'SAÉ 5.03 - Datamining', 'C2'),
(5, 15, 's5 Communication des données', 'C3'),
(5, 18, 'Traitement des données textuelles', 'C2'),
(5, 20, 'Méthodes statistiques pour le big data', 'C2'),
(5, 10, 'Anglais pour la communication d''entreprise', 'C3'),
(5, 20, 'Big Data : enjeux\, stockage et extraction', 'C1'),
(5, 24, 'Développement logiciel', 'C4'),
(5, 15, 'base de données NoSQL DT', 'C1'),
(5, 6, 'Classification de données textuelles', 'C2'),
(5, 2, 'base de données NoSQL CJ', 'C1'),
(5, 12, 'Apprentissage automatique pour l''IA', 'C2'),
(5, 8, 'Projet personnel et professionnel', 'C3'),
(5, 3, 'Data Mining', 'C2'),
(5, 3, 'Portfolio (autonomie)', 'C3'),
(5, 10, 'Communication pour le management', 'C3'),
(5, 1, 'Conseil de département', 'C3'),
(5, 6, 'Data Mining (MS)', 'C2'),

-- SEMESTRE 6
(6, 28, 'SAÉ 6.01 - Développement et test d''un outil décisionnel', 'C4'),
(6, 8, 'SAÉ 6.01 - Développement et test d''un outil décisionnel (projet)', 'C4'),
(6, 12, 'Applications en économie et gestion 2', 'C3'),
(6, 22, 'SAÉ 6.01 - Développement et test d''un outil décisionnel (projet a utonomie))', 'C4'),
(6, 30, 'Approfondissement en Big Data', 'C1'),
(6, 8, 'soutenances alternance', 'C3'),
(6, 8, 'soutenances stage BUT2 / ALT BUT3', 'C3'),
(6, 1, 'soutenances Portfolio s6 FI', 'C3'),
(6, 12, 'Anglais de spécialité (MC)', 'C3'),
(6, 16, 'Data Mining', 'C2'),
(6, 2, 'rentrée PEC SD', 'C3'),
(6, 30, 'Programmation web pour la visualisation', 'C4'),
(6, 10, 'Classification automatique (Réseaux de neurones)', 'C2'),
(6, 13, 'base de données NoSQL CJ', 'C1'),
(6, 6, 'Classification de données textuelles', 'C2'),
(6, 18, 'Applications en économie et gestion (A. Delachaux)', 'C3'),
(6, 4, 'Portfolio', 'C3'),
(6, 5, 'Dolesup', 'C3'),
(6, 7, 'Classification automatique (renforcements)', 'C2');

-- ============================================================
-- TABLE DES APPRENTISSAGES CRITIQUES
-- ============================================================
CREATE TABLE IF NOT EXISTS APPRENTISSAGE_CRITIQUE (
    id_ac VARCHAR(12) PRIMARY KEY,      -- ex: AC11.01, AC24.02VCOD
    intitule TEXT NOT NULL,             -- description complète
    id_annee CHAR(4) NOT NULL,         -- référence au BUT
    niveau INT,                         -- optionnel, 1 à 3
    FOREIGN KEY (id_annee) REFERENCES ANNEE(id_annee)
);

    
-- BUT1 : Traiter des données structurées
INSERT INTO APPRENTISSAGE_CRITIQUE (id_ac, intitule, id_annee) VALUES
('AC11.01', 'Correctement interpréter et prendre en compte le besoin du commanditaire ou du client', 'BUT1'),
('AC11.02', 'Respecter les formalismes de notation', 'BUT1'),
('AC11.03', 'Connaître la syntaxe des langages et savoir l’utiliser', 'BUT1'),
('AC11.04', 'Mesurer l’importance de maîtriser la structure des données à exploiter', 'BUT1'),
('AC11.05', 'Comprendre les structures algorithmiques de base et leur contexte d’usage', 'BUT1'),
('AC11.06', 'Prendre conscience de l’intérêt de la programmation', 'BUT1'),
('AC12.01', 'Réaliser que les sources de données ont des caractéristiques propres à considérer (variation, précision, mise à jour...)', 'BUT1'),
('AC12.02', 'Comprendre qu’une analyse correcte ne peut émaner que de données propres et préparées', 'BUT1'),
('AC12.03', 'Comprendre l’intérêt des synthèses numériques et graphiques pour décrire une variable statistique', 'BUT1'),
('AC12.04', 'Comprendre l’intérêt des synthèses numériques et graphiques pour mettre en évidence des liaisons entre variables.', 'BUT1'),
('AC12.05', 'Comprendre l''intérêt de l’utilisation d’un modèle probabiliste', 'BUT1'),
('AC12.06', 'Appréhender la notion de fluctuation d''échantillonnage, notamment à l’aide de simulations probabilistes', 'BUT1'),
('AC13.01', 'Prendre connaissance des biais rencontrés dans la mise en place d’une enquête', 'BUT1'),
('AC13.02', 'Identifier l’importance de contextualiser ses données', 'BUT1'),
('AC13.03', 'Mesurer l’importance de mettre en évidence des résultats clés par l’utilisation d’indicateurs pertinents', 'BUT1'),
('AC13.04', 'Lors de la restitution des résultats, mesurer l’importance d’expliciter également la démarche suivie', 'BUT1'),
('AC13.05', 'Comprendre les intérêts de la data visualisation et de l’infographie', 'BUT1'),
('AC13.06', 'Mesurer l’importance d’une expression précise et nuancée dans la communication en français et dans une langue étrangère des résultats', 'BUT1')
ON CONFLICT DO NOTHING;

-- BUT2 : Automatiser le traitement de données multidimensionnelles
INSERT INTO APPRENTISSAGE_CRITIQUE (id_ac, intitule, id_annee) VALUES
('AC21.01', 'Comprendre l''organisation des données de l''entreprise', 'BUT2'),
('AC21.02', 'Réaliser le rôle central et spécifique de l''entrepôt de données dans la chaine décisionnelle', 'BUT2'),
('AC21.03', 'Identifier et résoudre les problèmes d’intégration de sources complémentaires et hétérogènes', 'BUT2'),
('AC21.04', 'Comprendre la nécessité de tester, corriger et documenter un programme', 'BUT2'),
('AC21.05', 'Apprécier l’intérêt de briques logicielles existantes et savoir les utiliser', 'BUT2')
ON CONFLICT DO NOTHING;

INSERT INTO APPRENTISSAGE_CRITIQUE (id_ac, intitule, id_annee) VALUES
('AC22.01', 'Prendre conscience de la différence entre modélisation statistique et analyse exploratoire', 'BUT2'),
('AC22.02', 'Saisir la spécificité de l’analyse des données temporelles', 'BUT2'),
('AC22.03', 'Comprendre l’intérêt des analyses multivariées pour synthétiser et résumer l’information portée par plusieurs variables', 'BUT2'),
('AC22.04', 'Appréhender l’idée de confronter une hypothèse avec la réalité pour prendre une décision', 'BUT2'),
('AC22.05', 'Apprécier les limites de validité et les conditions d’application d’une analyse', 'BUT2')
ON CONFLICT DO NOTHING;

INSERT INTO APPRENTISSAGE_CRITIQUE (id_ac, intitule, id_annee) VALUES
('AC23.01', 'Saisir l’intérêt de mobiliser de manière proactive des ressources métiers liées à l''environnement (y compris économique, international…)', 'BUT2'),
('AC23.02', 'Savoir défendre ses choix d’analyses', 'BUT2'),
('AC23.03', 'Saisir la nécessité de choisir des indicateurs pertinents pour communiquer sur les résultats', 'BUT2'),
('AC23.04', 'Prendre conscience de la rigueur requise dans ses productions et dans la communication à leur propos', 'BUT2'),
('AC23.05', 'Comprendre les enjeux des relations en milieu professionnel adaptées à l’interlocuteur et à sa culture', 'BUT2')
ON CONFLICT DO NOTHING;

INSERT INTO APPRENTISSAGE_CRITIQUE (id_ac, intitule, id_annee) VALUES
('AC24.01VCOD', 'Comprendre le rôle fondamental de l’analyse des besoins et de l’existant dans un projet décisionnel (architecture, visualisation...)', 'BUT2'),
('AC24.02VCOD', 'Percevoir les enjeux de l’automatisation et de l''interopérabilité d’un ensemble de tâches', 'BUT2'),
('AC24.03VCOD', 'Prendre conscience des différences entre outils (logiciels, langages) pour choisir le plus adapté', 'BUT2'),
('AC24.04VCOD', 'Comprendre le cycle de vie d’un projet informatique', 'BUT2')
ON CONFLICT DO NOTHING;

-- BUT3 : Intégrer le traitement de données complexes
INSERT INTO APPRENTISSAGE_CRITIQUE (id_ac, intitule, id_annee) VALUES
('AC31.01', 'Identifier les solutions technologiques permettant la collecte et la diffusion de données', 'BUT3'),
('AC31.02', 'Comprendre les spécificités des données complexes et de leur exploitation', 'BUT3'),
('AC31.03', 'Savoir mener une veille technologique', 'BUT3')
ON CONFLICT DO NOTHING;

INSERT INTO APPRENTISSAGE_CRITIQUE (id_ac, intitule, id_annee) VALUES
('AC32.01', 'Prendre conscience des différences entre des outils statistiques pour choisir le plus adapté', 'BUT3'),
('AC32.02', 'Saisir l’importance de la mise en œuvre de méthodes adaptées à des domaines et des données spécifiques (Marketing, Biostatistique, Statistique spatiale, Gestion …)', 'BUT3'),
('AC32.03', 'Prendre conscience des limites des méthodes classiques pour l’analyse des données complexes (données massives, données mal structurées…)', 'BUT3'),
('AC32.04', 'Comprendre les mécanismes de bases de l’intelligence artificielle (apprentissage statistique supervisé, échantillons d''apprentissage et échantillons de test…)', 'BUT3')
ON CONFLICT DO NOTHING;

INSERT INTO APPRENTISSAGE_CRITIQUE (id_ac, intitule, id_annee) VALUES
('AC33.01', 'Savoir transformer la donnée pour la mettre en conformité avec des normes (anonymisation, normalisation)', 'BUT3'),
('AC33.02', 'Mesurer l''impact d''un respect de la législation en terme de droit des données.', 'BUT3'),
('AC33.03', 'Identifier les clés d''une bonne communication (procédures et techniques utilisées)', 'BUT3'),
('AC33.04', 'Mesurer l’importance de comprendre et de répondre à l''ensemble des problématiques posées', 'BUT3'),
('AC33.05', 'Être force de proposition', 'BUT3'),
('AC33.06', 'Prendre conscience de la nécessité d’intégrer la vision de l’interlocuteur (transversalité, international, multiculture, niveau d’expertise…)', 'BUT3')
ON CONFLICT DO NOTHING;

INSERT INTO APPRENTISSAGE_CRITIQUE (id_ac, intitule, id_annee) VALUES
('AC34.01VCOD', 'Prendre conscience de la nécessité d’utiliser des moyens spécifiques pour exploiter les Big Data ou les flux de données', 'BUT3'),
('AC34.02VCOD', 'Défendre ses choix de solution par un argumentaire éclairé', 'BUT3'),
('AC34.03VCOD', 'Réaliser l’intérêt d’appliquer les méthodes de développement dans la réalisation d’un projet informatique', 'BUT3'),
('AC34.04VCOD', 'Apprécier l’intérêt de l’utilisation d’un gestionnaire de versions de code', 'BUT3')
ON CONFLICT DO NOTHING;

-- ============================================================
-- TABLE DES PREUVES
-- ============================================================
CREATE TABLE IF NOT EXISTS PREUVES (
    id_preuve VARCHAR(10) PRIMARY KEY,   -- ex: P1, P2, P3
    intitule TEXT NOT NULL,
    document TEXT    -- nom du fichier
);

INSERT INTO PREUVES (id_preuve, intitule, document) VALUES
('P1', 'Images', 'test0.jpg'),
('P2', 'Capture blabla', 'test4.jpg'),
('P3', 'Rapport truc', 'test22.jpg'),
('P4', 'Schéma', 'test1.png')
ON CONFLICT DO NOTHING;
    
-- ============================================================
-- ASSOCIATION COMPÉTENCE <-> PREUVES
-- ============================================================
CREATE TABLE IF NOT EXISTS COMPETENCE_PREUVE (
    id_competence CHAR(2) NOT NULL,
    id_preuve VARCHAR(10) NOT NULL,
    PRIMARY KEY (id_competence, id_preuve),
    FOREIGN KEY (id_competence) REFERENCES COMPETENCE(id_competence) ON DELETE CASCADE,
    FOREIGN KEY (id_preuve) REFERENCES PREUVES(id_preuve) ON DELETE CASCADE
);

INSERT INTO COMPETENCE_PREUVE (id_competence, id_preuve) VALUES
('C1', 'P1'),
('C1', 'P2'),   -- C1 a deux preuves
('C2', 'P2'),   -- P2 sert aussi à C2
('C3', 'P3'),
('C4', 'P4')
ON CONFLICT DO NOTHING;
    
-- ============================================================
-- ASSOCIATION PREUVES <-> APPRENTISSAGES CRITIQUES
-- ============================================================
CREATE TABLE IF NOT EXISTS PREUVE_AC (
    id_preuve VARCHAR(10) NOT NULL,
    id_ac VARCHAR(12) NOT NULL,
    PRIMARY KEY (id_preuve, id_ac),
    FOREIGN KEY (id_preuve) REFERENCES PREUVES(id_preuve) ON DELETE CASCADE,
    FOREIGN KEY (id_ac) REFERENCES APPRENTISSAGE_CRITIQUE(id_ac) ON DELETE CASCADE
);

INSERT INTO PREUVE_AC (id_preuve, id_ac) VALUES
('P1', 'AC11.01'),
('P2', 'AC12.03'),
('P2', 'AC12.04'),   -- P2 illustre deux AC
('P3', 'AC33.03'),
('P3', 'AC33.04'),
('P4', 'AC13.05')
ON CONFLICT DO NOTHING;

-- ============================================================
-- TABLE DES SAES
-- ============================================================
CREATE TABLE IF NOT EXISTS SAE (
    id_sae CHAR(7) PRIMARY KEY,  -- ex: SAE4.01, SAE2.02, SAE3.01
    intitule TEXT NOT NULL,
    id_annee CHAR(4),
    description TEXT NOT NULL,
    id_tech CHAR (12),
    id_competence CHAR (2),
    id_preuve VARCHAR(10),
    
);

INSERT INTO ANNEE (id_annee, intitule) VALUES
('BUT1', 'Traiter des données structurées / Mettre en œuvre une analyse descriptive / Contextualiser et présenter les données'),
('BUT2', 'Automatiser le traitement de données multidimensionnelles / Mettre en œuvre une analyse exploratoire / Restituer et argumenter ses résultats / Développer un composant d’une solution décisionnelle'),
('BUT3', 'Intégrer le traitement de données complexes / Mettre en œuvre l''analyse exploratoire de données complexes / Intégrer et valoriser sa production dans l''écosystème de l''entreprise / Participer au déploiement d''une solution décisionnelle')
ON CONFLICT DO NOTHING;

