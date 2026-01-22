# POM Test Automation Framework - Version Avancée 🚀

Ce projet est un framework d'automatisation de tests avancé utilisant Selenium WebDriver avec le modèle Page Object Model (POM), intégrant des techniques de tests boîte noire conformes aux normes ISTQB.

## 🆕 Nouveautés de cette version (Branche feature/brave-browser-reporting)

### 🌐 Changement de Navigateur : Brave Browser
- **Navigateur par défaut changé** de Microsoft Edge vers **Brave Browser**
- **Avantage principal** : Blocage automatique des publicités du site web testé
- **Délai d'attente de 5 secondes** implémenté pour permettre à Brave de détecter et bloquer les publicités

### 📊 Amélioration du Reporting Cucumber
- Mise à jour vers **Cucumber Reporting 5.8.2** (nouvelle version)
- Génération de rapports HTML avancés avec `net.masterthought:cucumber-reporting`
- Rapports timeline interactifs disponibles dans `target/cucumber-timeline/`
- Rapports HTML détaillés dans `target/cucumber-html-reports/`

### 🐛 Documentation des Bugs
- **Nouveau fichier** : `BugRepport_TC1.pdf` - Rapport de bugs détaillé pour le premier cas de test
- Respect des normes de documentation de bugs (Priorité, Sévérité, Steps to Reproduce, etc.)

### 🧪 5 Nouveaux Cas de Tests Ajoutés
| Test Case | Description | Fonctionnalité |
|-----------|-------------|----------------|
| **TC9** | Recherche de produits | Validation de la fonctionnalité de recherche |
| **TC10** | Subscription Homepage | Vérification de l'inscription newsletter sur la page d'accueil |
| **TC11** | Subscription Cart Page | Vérification de l'inscription newsletter sur la page panier |
| **TC12** | Ajout de produits au panier | Validation de l'ajout multiple de produits |
| **TC13** | Quantité produit dans panier | Vérification de la quantité après ajout du même produit |

### 📄 Nouvelle Page Object : CartPage
- Classe `CartPage.java` pour gérer les éléments de la page panier
- Méthodes de vérification des produits ajoutés, quantités, prix et totaux

## 🚀 Technologies utilisées

- **Java 17** - Langage de programmation
- **Selenium WebDriver 4.16.1** - Automatisation des tests web
- **Maven** - Gestion des dépendances et build
- **Cucumber 7.15.0** - Tests BDD (Behavior Driven Development)
- **Cucumber Reporting 5.8.2** - Rapports avancés
- **TestNG 7.10.2** - Framework de tests et rapports
- **AssertJ** - Assertions fluides et expressives
- **WebDriverManager 6.3.3** - Gestion automatique des drivers
- **Brave Browser** - Navigateur avec blocage de publicités intégré

## 📁 Structure du projet

```
POM-Test-Automation/
├── BugRepport_TC1.pdf                       # Rapport de bugs TC1
├── src/
│   ├── main/
│   │   └── java/
│   │       └── Pages/
│   │           ├── CartPage.java            # NOUVEAU - Page Panier
│   │           ├── ContactUsPage.java
│   │           ├── DelateAccountPage.java
│   │           ├── DriverManager.java       # Modifié - Brave Browser
│   │           ├── HomePage.java
│   │           ├── PageBase.java            # Classe base commune
│   │           ├── ProductsPage.java
│   │           ├── SignUpLoginPage.java
│   │           ├── TestCasePage.java
│   │           └── UserRegistrationPages.java
│   └── test/
│       └── java/
│           ├── features/
│           │   └── UserRegistration.feature  # Tests BDD avancés
│           ├── runner/
│           │   └── TestRunner.java
│           ├── steps/
│           │   └── UserRegistration.java
│           ├── TestCases/                    # 13 cas de tests (5 nouveaux)
│           │   ├── TC1.java                  # Enregistrement + Suppression
│           │   ├── TC2.java                  # Login valide
│           │   ├── TC3.java                  # Login invalide
│           │   ├── TC4.java                  # Logout
│           │   ├── TC5.java                  # Email existant
│           │   ├── TC6.java                  # Contact Us
│           │   ├── TC7.java                  # Page Test Cases
│           │   ├── TC8.java                  # Page Products
│           │   ├── TC9.java                  # NOUVEAU - Recherche produits
│           │   ├── TC10.java                 # NOUVEAU - Subscription Home
│           │   ├── TC11.java                 # NOUVEAU - Subscription Cart
│           │   ├── TC12.java                 # NOUVEAU - Ajout produits
│           │   └── TC13.java                 # NOUVEAU - Quantité panier
│           └── TestPages/
│               ├── TestBase.java
│               ├── TestContactUsPage.java
│               ├── TestDelatePage.java
│               ├── TestPoroductsPage.java
│               ├── TestRegistrationCSV.java
│               ├── TestSignUpLoginPage.java
│               └── TestUserRegistrationPage.java
├── target/
│   ├── cucumber-html-reports/               # Rapports HTML Cucumber
│   └── cucumber-timeline/                   # Timeline interactive
├── testng.xml                               # Configuration TestNG
└── pom.xml
```

## 🏗️ Architecture Avancée

### Pattern Singleton - DriverManager avec Brave Browser
Le projet implémente un **DriverManager singleton** avec support ThreadLocal pour l'exécution parallèle des tests, utilisant **Brave Browser** pour bloquer les publicités :

```java
public class DriverManager {
    private static ThreadLocal<WebDriver> driverThreadLocal = new ThreadLocal<>();
    
    public static WebDriver getDriver() {
        if (driverThreadLocal.get() == null) {
            ChromeOptions options = new ChromeOptions();
            // Chemin vers l'exécutable Brave (blocage des publicités)
            options.setBinary("C:\\Program Files\\BraveSoftware\\Brave-Browser\\Application\\brave.exe");
            
            WebDriver driver = new ChromeDriver(options);
            driver.manage().window().maximize();
            driverThreadLocal.set(driver);
        }
        return driverThreadLocal.get();
    }
}
```

### Page Object Model (POM) Optimisé
- **PageBase** : Classe abstraite avec méthodes communes (click, sendKeys, assertions)
- **Pages séparées** : Chaque page web a sa propre classe (HomePage, SignUpLoginPage, etc.)
- **Encapsulation** : Logique des tests séparée de la structure des pages
- **Réutilisabilité** : Méthodes communes partagées entre toutes les pages

### Architecture de Tests Modulaire
- **TestCases** : 13 cas de tests isolés et indépendants
- **TestPages** : Classes de tests réutilisables
- **TestBase** : Configuration commune pour tous les tests

## ✨ Fonctionnalités Complètes

### 📋 13 Cas de Tests Complets
| Test Case | Description | Objectif |
|-----------|-------------|----------|
| **TC1** | Enregistrement + Suppression | Test end-to-end complet |
| **TC2** | Login avec identifiants valides | Validation authentification |
| **TC3** | Login avec identifiants invalides | Gestion erreurs |
| **TC4** | Logout utilisateur | Déconnexion sécurisée |
| **TC5** | Enregistrement email existant | Validation unicité |
| **TC6** | Page Contact Us | Navigation et formulaire |
| **TC7** | Page Test Cases | Validation contenu |
| **TC8** | Page Products | Catalogue produits |
| **TC9** | Recherche de produits | Fonctionnalité de recherche |
| **TC10** | Subscription Homepage | Inscription newsletter (accueil) |
| **TC11** | Subscription Cart Page | Inscription newsletter (panier) |
| **TC12** | Ajout produits au panier | Ajout multiple de produits |
| **TC13** | Quantité produit dans panier | Vérification quantité |

### 🧪 Tests BDD Conformes ISTQB
Le fichier `.feature` intègre des techniques de tests boîte noire avancées :

#### ✅ **Techniques Implémentées :**
- **Partitions d'Équivalence** - Données valides/invalides
- **Boundary Value Analysis (BVA)** - Tests aux limites (min=2, max=50 caractères)
- **Transition d'États** - Flux utilisateur complet
- **Tableau de Décision** - Combinaisons de conditions

#### 📊 **Documentation Technique :**
Analyse détaillée disponible : [Tests Boîte Noire - Google Sheets](https://docs.google.com/spreadsheets/d/18mKEhHWsQ2UGU84bZ22aSy5wcPJxQaMutFGm5U2aZfI/edit?usp=sharing)

### 🔧 Améliorations Techniques
- **ThreadLocal WebDriver** : Support exécution parallèle
- **Gestion centralisée des drivers** via DriverManager
- **Assertions expressives** avec AssertJ
- **Configuration TestNG** optimisée
- **Maintenance du code** améliorée avec séparation des responsabilités

## 📋 Prérequis

- **Java JDK 17** ou supérieur
- **Maven 3.8+** 
- **Brave Browser** (navigateur par défaut - blocage des publicités)
- **Git** pour le clonage du repository

> **Note** : Le chemin par défaut de Brave est `C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe`. Modifiez le chemin dans `DriverManager.java` si nécessaire.

## 🔧 Installation

1. **Cloner le repository** :
```bash
git clone https://github.com/zouhairElMa/POM-Test-Automation.git
cd POM-Test-Automation
```

2. **Installer les dépendances** :
```bash
mvn clean install
```

3. **Vérifier la configuration** :
```bash
mvn compile
```

## ▶️ Exécution des Tests

### Tests Individuels
```bash
# Exécuter un test case spécifique
mvn test -Dtest=TC1
mvn test -Dtest=TC2
# ... jusqu'à TC8
```

### Tests par Catégorie
```bash
# Tous les tests TestNG
mvn test

# Tests avec configuration personnalisée
mvn test -DsuiteXmlFile=testng.xml
```

### Tests Cucumber BDD
```bash
# Tests avec tags spécifiques
mvn test -Dcucumber.options="--tags @UserName"
mvn test -Dcucumber.options="--tags @Valid"
mvn test -Dcucumber.options="--tags @BVA"
```

### Tests Parallèles
```bash
# Exécution parallèle (grâce au DriverManager ThreadLocal)
mvn test -DthreadCount=3 -Dparallel=methods
```

## 📊 Rapports et Résultats

### 📈 Rapports Générés
- **TestNG Reports** : `target/surefire-reports/index.html`
- **Cucumber HTML Reports** : `target/cucumber-html-reports/` (nouveau reporting avancé)
- **Cucumber Timeline** : `target/cucumber-timeline/index.html` (timeline interactive)
- **Cucumber JSON** : `target/cucumber-report.json`
- **Logs détaillés** : Console et fichiers de logs

### 📋 Métriques de Qualité
- **Couverture fonctionnelle** : 13 cas de tests critiques
- **Techniques ISTQB** : BVA, Partitions d'équivalence, États
- **Assertions robustes** : Validations multiples par test
- **Documentation bugs** : Rapport PDF disponible

## 🎯 Cas d'Usage

### 🔄 Tests de Régression
```bash
# Suite complète de régression
mvn test -Dgroups=regression
```

### 🧪 Tests de Validation
```bash
# Tests de validation des formulaires
mvn test -Dtest=TestUserRegistrationPage
mvn test -Dtest=TestContactUsPage
```

### 🌐 Tests Cross-Browser
Le framework supporte multiple navigateurs via configuration DriverManager.

## 📚 Documentation Technique

### 🗂️ Structure des Classes
- **Pages/** : Objects des pages web
- **TestCases/** : Scénarios de tests isolés  
- **TestPages/** : Classes de tests réutilisables
- **features/** : Scénarios BDD Cucumber

### 📖 Guides de Référence
- [Analyse Tests Boîte Noire](https://docs.google.com/spreadsheets/d/18mKEhHWsQ2UGU84bZ22aSy5wcPJxQaMutFGm5U2aZfI/edit?usp=sharing)
- Documentation interne dans le code
- Commentaires explicatifs dans les classes principales

## 🔄 Intégration Continue

Le projet est configuré pour s'intégrer facilement dans des pipelines CI/CD :
- **Maven** pour le build automatisé
- **TestNG** pour l'exécution et les rapports
- **Configuration flexible** via profils Maven

## 🤝 Contribution

Les contributions sont les bienvenues ! Pour contribuer :

1. **Fork** le projet
2. **Créer une branche** pour votre fonctionnalité (`git checkout -b feature/AmazingFeature`)
3. **Commiter** vos changements (`git commit -m 'Add: Amazing Feature'`)
4. **Pusher** vers la branche (`git push origin feature/AmazingFeature`)
5. **Ouvrir une Pull Request**

### 📝 Guidelines de Contribution
- Suivre les conventions de code existantes
- Ajouter des tests pour les nouvelles fonctionnalités
- Documenter les changements dans le README
- Respecter l'architecture POM établie


## 📄 Changelog

### Version 3.0 (Janvier 2026) - feature/brave-browser-reporting
- ✅ Migration vers **Brave Browser** pour le blocage des publicités
- ✅ Délai d'attente de 5 secondes pour la détection des publicités
- ✅ Intégration **Cucumber Reporting 5.8.2** (rapports HTML avancés)
- ✅ 5 nouveaux cas de tests (TC9 à TC13)
- ✅ Nouvelle **CartPage** pour la gestion du panier
- ✅ **Rapport de bugs PDF** pour TC1 (BugRepport_TC1.pdf)
- ✅ Rapports timeline interactifs

### Version 2.0 (Janvier 2026)
- ✅ Implémentation DriverManager Singleton
- ✅ 8 cas de tests isolés
- ✅ Tests BDD conformes ISTQB
- ✅ Architecture POM optimisée
- ✅ Support ThreadLocal pour tests parallèles

### Version 1.0 (Version initiale)
- ✅ Framework POM de base
- ✅ Tests Cucumber basiques
- ✅ Configuration Maven

## 📝 Licence

Ce projet est sous **licence MIT** - voir le fichier [LICENSE](LICENSE) pour plus de détails.

## 👤 Auteur

**Zouhair El Mattad** - *Ingénieur QA & Test Automation*

- 🌐 **GitHub** : [@zouhairElMa](https://github.com/zouhairElMa)
- 📧 **Email** : [zoumattad@gmail.com](mailto:zoumattad@gmail.com)
- 💼 **LinkedIn** : [Zouhair El Mattad](https://www.linkedin.com/in/zouhair-el-mattad)
- 📊 **Documentation** : [Tests Analysis](https://docs.google.com/spreadsheets/d/18mKEhHWsQ2UGU84bZ22aSy5wcPJxQaMutFGm5U2aZfI/edit?usp=sharing)

### 🎯 Expertise
- **Test Automation** : Selenium, TestNG, Cucumber
- **Design Patterns** : Page Object Model, Singleton
- **Test Techniques** : ISTQB, Boîte Noire, BDD
- **Languages** : Java, Python, JavaScript
- **CI/CD** : Jenkins, GitHub Actions, Maven

---

⭐ **N'hésitez pas à donner une étoile si ce projet vous aide !** ⭐

---

*Développé avec ❤️ pour la communauté QA & Test Automation*

