# Archives FFJM (format structuré)

Ce dépôt propose une réorganisation des énigmes du "Championnat de jeux mathématiques et logiques" organisé annuellement depuis 1987 par la
Fédération Française des Jeux Mathématiques (FFJM). Les énigmes sont dans un format structuré, exploitable automatiquement.

## Source

Les exercices proviennent des sujets du championnat de la FFJM :

https://www.ffjm.org/

La FFJM est une association dont l’objectif est de développer le goût des mathématiques par le jeu, notamment à travers un championnat international
rassemblant des participants de tous âges. :contentReference[oaicite:1]{index=1}

Les épreuves sont constituées d’énigmes mathématiques variées, à résoudre en temps limité, sans rédaction détaillée (seule la réponse est attendue). :contentReference[oaicite:2]{index=2}

---

## Objectif du projet

L’objectif de ce dépôt est de proposer une **alternative structurée à l'archive existante** :

- structuration des exercices (Typst + TOML)
- séparation entre :
  - énoncé
  - solution
  - explication
  - figures
- ajout de métadonnées (tags, thèmes, techniques)

---

## Pourquoi ?

Les archives actuelles (PDF) sont riches mais difficiles à exploiter :

- pas de recherche fine (par type de raisonnement, notion, technique)
- pas de réutilisation automatisée
- difficile de construire des parcours d’entraînement ciblés

Ce dépôt vise à permettre :

### Recherche avancée
- par notion (arithmétique, logique…)
- par technique (élimination, contradiction…)
- par niveau

### Analyse des exercices
- typologie des raisonnements
- identification des structures récurrentes

### Génération automatique
- création de sujets d’entraînement
- sélection d’exercices par critères
- génération de variantes


