# POM Test Automation Framework - Version Avancée 🚀

Ce projet est un framework d'automatisation de tests avancé utilisant Selenium WebDriver avec le modèle Page Object Model (POM), intégrant des techniques de tests boîte noire conformes aux normes ISTQB.

## 🚀 Technologies utilisées

- **Java 17** - Langage de programmation
- **Selenium WebDriver 4.16.1** - Automatisation des tests web
- **Maven** - Gestion des dépendances et build
- **Cucumber** - Tests BDD (Behavior Driven Development)
- **TestNG** - Framework de tests et rapports
- **AssertJ** - Assertions fluides et expressives
- **WebDriverManager** - Gestion automatique des drivers

## 📁 Structure du projet

```
POM-Test-Automation/
├── src/
│   ├── main/
│   │   └── java/
│   │       └── Pages/
│   │           ├── ContactUsPage.java
│   │           ├── DelateAccountPage.java
│   │           ├── DriverManager.java        # Singleton Pattern
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
│           ├── TestCases/                    # 8 cas de tests isolés
│           │   ├── TC1.java                  # Enregistrement + Suppression
│           │   ├── TC2.java                  # Login valide
│           │   ├── TC3.java                  # Login invalide
│           │   ├── TC4.java                  # Logout
│           │   ├── TC5.java                  # Email existant
│           │   ├── TC6.java                  # Contact Us
│           │   ├── TC7.java                  # Page Test Cases
│           │   └── TC8.java                  # Page Products
│           └── TestPages/
│               ├── TestBase.java
│               ├── TestContactUsPage.java
│               ├── TestDelatePage.java
│               ├── TestPoroductsPage.java
│               ├── TestRegistrationCSV.java
│               ├── TestSignUpLoginPage.java
│               └── TestUserRegistrationPage.java
├── testng.xml                               # Configuration TestNG
└── pom.xml
```

## 🏗️ Architecture Avancée

### Pattern Singleton - DriverManager
Le projet implémente un **DriverManager singleton** avec support ThreadLocal pour l'exécution parallèle des tests :

```java
public class DriverManager {
    private static ThreadLocal<WebDriver> driverThreadLocal = new ThreadLocal<>();
    
    public static WebDriver getDriver() {
        if (driverThreadLocal.get() == null) {
            WebDriver driver = new EdgeDriver();
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
- **TestCases** : 8 cas de tests isolés et indépendants
- **TestPages** : Classes de tests réutilisables
- **TestBase** : Configuration commune pour tous les tests

## ✨ Nouvelles Fonctionnalités

### 📋 8 Cas de Tests Complets
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
- **Edge/Chrome/Firefox** browser
- **Git** pour le clonage du repository

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
- **Cucumber Reports** : `target/cucumber-html-report.html`
- **Logs détaillés** : Console et fichiers de logs

### 📋 Métriques de Qualité
- **Couverture fonctionnelle** : 8 cas de tests critiques
- **Techniques ISTQB** : BVA, Partitions d'équivalence, États
- **Assertions robustes** : Validations multiples par test

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

## 🏆 Fonctionnalités Futures

### 🔮 Roadmap
- [ ] **API Testing** avec REST Assured
- [ ] **Performance Testing** avec JMeter
- [ ] **Mobile Testing** avec Appium
- [ ] **Visual Testing** avec Selenium Visual
- [ ] **CI/CD Pipeline** avec Jenkins/GitHub Actions

### 💡 Améliorations Prévues
- Intégration base de données pour données de test
- Génération automatique de données de test
- Rapports avancés avec graphiques
- Support multi-langues
- Configuration cloud (Selenium Grid)

## 📄 Changelog

### Version 2.0 (Janvier 2026)
- ✅ Implémentation DriverManager Singleton
- ✅ 8 nouveaux cas de tests isolés
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

