# 🚀 Migration SSIS → Snowflake + dbt

## 🌟 Objectif du projet

Ce projet personnel a pour objectif de démontrer comment moderniser un flux ETL traditionnel (par exemple développé avec SSIS) vers une architecture cloud-native basée sur Snowflake et dbt.

Dans un premier temps, je réalise des **tests exploratoires avec dbt connecté à Snowflake**, pour :
- Explorer la structure de dbt (models, seeds, snapshots, tests).
- Comprendre l’interaction avec Snowflake (charges, transformations).
- Tester les fonctionnalités de transformation, documentation et validation des données.

Dans un second temps (prochaines étapes), je construirai un **cas pratique complet** basé sur des jeux de données inspirés du secteur environnemental (collecte de déchets, facturation, services publics), similaire aux cas rencontrés chez Tradim.

---

## 🛠️ Stack technique

- **dbt** (data build tool) — pour les transformations ELT, tests, documentation.
- **Snowflake** — comme entrepôt de données cloud.
- **GitHub** — pour versionner le code dbt et suivre les évolutions.

---

## 📂 Organisation du projet

