# Portfolio de Chaïma Ahamada Madi
Projet de programmation web réalisé en BUT Science des données (IUT de Besançon). Il s'agit d'un site portfolio qui présente ma personne, mes compétences, mes projets ainsi que ma formation.

## I.Analyse des besoins
## Objectif du site

Ce portfolio a pour but de me faire recruter : pour un stage ou un emploi dans le domaine de la data et appuyer mes candidatures en master.

Le site doit permettre à un recruteur ou à un responsable de formation de comprendre rapidement :
- qui je suis (parcours, qualités, centres d'intérêt) ;
- les compétences que je maîtrise, et le temps de formation consacré à chacune ;
- ma formation, le BUT Science des données ;
- mes expériences professionnelles et mon stage ;
- les projets que j'ai réalisés ;
- comment me contacter.

## Public visé
- Recruteurs et entreprises (stage, emploi)
- Responsables de formation (master)

## Fonctionnalités

Navigation : Menu présent sur toutes les pages (Accueil, Projets, Stage, BUT, Contact) et lien de retour vers l'accueil

Présentation personnelle : Page d'accueil avec mon nom, titre, présentation, chiffres clés, téléchargement de mon CV

Présentation du BUT SD et des compétences : Description du BUT et des 4 compétences, avec un graphique du nombre d'heures par compétence filtrable par année de BUT

Présentation BUT1 / BUT2 / BUT3 : Résumé de chaque année et liens vers les fiches des enseignements

Stage : Présentation du stage réalisé en BUT2

Projets : Liste des SAÉ et des projets, avec une page de détail pour chacun

A propos de moi : Parcours : brevet, bac (spécialités, options), expériences professionnelles

Contact : Moyen de me contacter

Connexion (envisagée) : Page de connexion donnant accès à un espace réservé. À confirmer selon l'avancement

## Organisation du contenu (arborescence)
A définir


## II.Maquette
La maquette montre l'organisation des pages et des éléments cliquables.
Les modifications importantes apportées à la maquette seront notées ici, avec la raison du changement.

## Évolution de la maquette

21/10/2026 : recentrage du site sur ma personne. La première version était centrée sur le BUT Science des données. Suite au retour de ma professeure, le site est recentré sur moi : ma personne, mes compétences, mes expériences et mes projets. Je conserve cependant une page dédiée au BUT SD (avec les pages BUT1/BUT2/BUT3) ainsi que le graphique du nombre d'heures par compétence, qui montrent concrètement ce que ma formation m'a apporté.

## III. Base de données
## Données utilisées

Les données sont celles de mon propre parcours : mes projets, mes expériences, mes compétences et les heures de formation par compétence. Elles sont saisies par mes soins dans la base de données.

Compétences et formation
- Liste des compétences (nom, catégorie)
- Nombre d'heures par compétence et par année de BUT
- Moyenne des notes par compétence
- Liste des enseignements (nom, année de BUT, nombre d'heures)
- Compétences associées à chaque enseignement
- Liens vers les fiches des enseignements
- Liens vers les documents de présentation du BUT
Outils et technologies
- Liste des outils et technologies maîtrisés
Projets et SAÉ
- Liste des projets et des SAÉ (titre, description, année, type)
- Compétences mobilisées par chaque projet ou SAÉ
- Enseignements associés à chaque projet ou SAÉ
- Technologies utilisées dans chaque projet
- Extraits de chaque projet (captures, aperçus)
- Livrables de chaque projet (rapport, code, présentation...)
Parcours et expériences
- Brevet
- Baccalauréat (spécialités, options)
- Certification Cambridge
- SNU
- Expériences professionnelles (poste, organisme, dates, description)
Stage
- Missions réalisées
- Compétences mobilisées
- Technologies utilisées
- Rapport de stage
Profil
- Soft skills
- Centres d'intérêt
Contact
- CV
- Lien LinkedIn
- Lien GitHub

## Schéma relationnel
(Choix en cours)

Mon souhait concernant les projet et expriences est de pouvoir y intégrer un lien vers des compétences développé dans le BUT SD.

Tables envisagées (à confirmer) :
- competence (id, nom, catégorie)
- enseignement (id, nom, année de BUT, nombre d'heure, lien vers la fiche, compétences associé)
- projet (id, id de la compétence, titre, description, année, type, compétences associés, enseignement associé)
- experience (id, titre, organisme, date de début, date de fin, description, compétences associé)
- (utilisateur (id, identifiant, mot de passe) : uniquement si la connexion est conservée)


