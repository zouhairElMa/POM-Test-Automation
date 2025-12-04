# POM Test Automation

Ce projet est un framework d'automatisation de tests utilisant Selenium WebDriver avec le modèle Page Object Model (POM).

## 🚀 Technologies utilisées

- **Java** - Langage de programmation
- **Selenium WebDriver** - Automatisation des tests web
- **Maven** - Gestion des dépendances et build
- **Cucumber** - Tests BDD (Behavior Driven Development)
- **TestNG/JUnit** - Framework de tests

## 📁 Structure du projet

```
POM-Test-Automation/
├── src/
│   ├── main/
│   │   └── java/
│   │       └── Pages/
│   │           ├── HomePage.java
│   │           ├── PageBase.java
│   │           └── UserRegistrationPages.java
│   └── test/
│       └── java/
│           ├── features/
│           │   └── UserRegistration.feature
│           ├── runner/
│           │   └── TestRunner.java
│           ├── steps/
│           │   └── UserRegistration.java
│           └── TestPages/
│               ├── TestBase.java
│               ├── TestRegistrationCSV.java
│               └── TestUserRegistrationPages.java
└── pom.xml
```

## 🏗️ Architecture

Le projet suit le modèle **Page Object Model (POM)** qui permet de :
- Séparer la logique des tests de la structure des pages
- Améliorer la maintenabilité du code
- Réduire la duplication de code
- Faciliter l'évolution des tests

## 📋 Prérequis

- Java JDK 8 ou supérieur
- Maven 3.6+
- Chrome/Firefox/Edge browser
- WebDriver correspondant au navigateur

## 🔧 Installation

1. Cloner le repository :
```bash
git clone https://github.com/zouhairElMa/POM-Test-Automation.git
cd POM-Test-Automation
```

2. Installer les dépendances :
```bash
mvn clean install
```

## ▶️ Exécution des tests

Pour exécuter tous les tests :
```bash
mvn test
```

Pour exécuter un test spécifique :
```bash
mvn test -Dtest=TestUserRegistrationPages
```

Pour exécuter les tests Cucumber :
```bash
mvn test -Dcucumber.options="--tags @YourTag"
```

## 📊 Rapports

Les rapports de tests sont générés dans le dossier `target/` après l'exécution des tests.

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à ouvrir une issue ou soumettre une pull request.

## 📝 Licence

Ce projet est sous licence MIT.

## 👤 Auteur

**Zouhair El Mattad**
- GitHub: [@zouhairElMa](https://github.com/zouhairElMa)
- Email: zoumattad@gmail.com

