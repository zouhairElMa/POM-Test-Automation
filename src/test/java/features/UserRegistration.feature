Feature: User Registration

    Scenario Outline: User Registration
        Given the user in the Home/Login Page
        When i Click on Resgister Link
        And i Fill the "<UserName>", "<Email>"
        And Move to the Next Page Registration
        And The user in Registration Page
        And i Fill All the Registration Form "<gender>", "<password>", "<firstNameAdressInfo>", "<lastNameAdressInfo>", "<companyAddressInfoInfo>", "<addressInfoInfo>", "<stateAddressInfo>", "<cityAddressInfo>", "<postcodeAddressInfo>", "<phoneNumberInfoInfo>", "<birthday>", "<birthMonth>", "<birthYear>", "<countryInfoInfoDropBox>"
        And i Click on Registration Button and Delete the Account
        Then Get the Succesful Registration Page

# ====================================================================================
#     FOCUS : USERNAME
#     Données fixes (Golden Data) pour les autres champs :
#     Email=gold@test.com, Pass=Pass1234, Name=John Doe, Date=1/Jan/1990
#     ====================================================================================
@UserName @2BVA @Valid
Examples:
# Bornes Valides (Min=2, Max=50)
| Email         | UserName                                           | gender  | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo  | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Borne Min (2 caractères)
| username.bva.min.2chars@test.com | Jo                                                 | MALE    | Pass1234 | John                | Doe                | TestCorp               | 123 Main St      | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1990      | India                   |
# Borne Max (50 caractères) -> "UserNamesCanBeVeryLongToTestTheLimitOfFiftyChars12"
| username.bva.max.50chars@test.com | UserNamesCanBeVeryLongToTestTheLimitOfFiftyChars12 | FEMALE  | Pass1234 | John                | Doe                | TestCorp               | 123 Main St      | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1990      | India                   |

@UserName @EP @Valid
Examples:
# Partitions Valides (Alphanumérique)
| Email          | UserName                                           | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Mixte Lettres et Chiffres
| username.ep.mixed.alphanumeric@test.com  | User1234                                           | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1990      | India                  |
# Chiffres uniquement (si accepté comme Username)
| username.ep.digits.only@test.com  | 987654321                                          | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1990      | India                  |

@UserName @3BVA @Invalid
Examples:
# Bornes Invalides (Min-1=1, Max+1=51)
| Email          | UserName                                            | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Trop court (1 caractère)
| username.bva.invalid.too.short@test.com  | J                                                   | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1990      | India                  |
# Trop long (51 caractères) -> "UserNamesCanBeVeryLongToTestTheLimitOfFiftyChars123"
| username.bva.invalid.too.long@test.com  | UserNamesCanBeVeryLongToTestTheLimitOfFiftyChars123 | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St      | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1990      | India                  |

@UserName @Negative @Invalid
Examples:
# Formats Invalides (Spéciaux, Vide)
| Email          | UserName                                           | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Caractères spéciaux interdits
| username.negative.special.chars@test.com  | User@Name!                                         | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1990      | India                  |
# Champ Vide (laissez l'espace vide entre les pipes)
| username.negative.empty.field@test.com  |                                                    | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1990      | India                  |

# ====================================================================================
#     FOCUS : DATE OF BIRTH (Day, Month, Year)
#     Règles :
#       - Année : [1925, 2007]
#       - Mois : 1-12 (Cohérence 30/31 jours)
#       - Février : 28 jours (Normal), 29 jours (Bissextile/Leap Year)
#     ====================================================================================

@DateBirth @2BVA @Valid @YearLimits
Examples:
# 1. Bornes Valides de l'Année (Min/Max) et Mois (Jan/Dec)
| Email          | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Borne Min Absolue (Le plus vieux autorisé) : 1 Janvier 1925
| date.bva.min.year.1925@test.com  | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1925      | India                  |
# Borne Max Absolue (Le plus jeune autorisé) : 31 Décembre 2007
| date.bva.max.year.2007@test.com  | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 31       | December   | 2007      | India                  |
# Valeur Nominale (Milieu)
| date.bva.nominal.1980@test.com  | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 15       | June       | 1980      | India                  |

@DateBirth @EP @Valid @LeapYear
Examples:
# 2. Cas Spéciaux Valides (Fin de mois et Année Bissextile)
| Email          | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Fin de mois 30 jours (30 Avril) - Doit être accepté
| date.ep.april.30days@test.com  | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 30       | April      | 2000      | India                  |
# Février Bissextile (29 Février 2000) - 2000 est divisible par 400 -> ACCEPTÉ
| date.ep.leap.feb29.2000@test.com  | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 29       | February   | 2000      | India                  |
# Février Bissextile (29 Février 1996) - 1996 est divisible par 4 -> ACCEPTÉ
| date.ep.leap.feb29.1996@test.com  | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 29       | February   | 1996      | India                  |

@DateBirth @3BVA @Invalid @YearRange
Examples:
# 3. Bornes Invalides de l'Année (Min-1, Max+1)
| Email          | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Trop Vieux (1924) - Juste avant la limite 1925
| date.bva.invalid.year.1924@test.com  | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1924      | India                  |
# Trop Jeune (2008) - Juste après la limite 2007
| date.bva.invalid.year.2008@test.com  | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2008      | India                  |

@DateBirth @Invalid @LogicalDates
Examples:
# 4. Incohérences Calendaires (Jours impossibles selon le mois)
| Email          | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# 31 Avril (Avril n'a que 30 jours) -> REJET
| date.invalid.april.31@test.com  | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 31       | April      | 2000      | India                  |
# 31 Juin (Juin n'a que 30 jours) -> REJET
| date.invalid.june.31@test.com  | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 31       | June       | 2000      | India                  |
# 30 Février (N'existe jamais) -> REJET
| date.invalid.feb.30@test.com  | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 30       | February   | 2000      | India                  |
# 29 Février Non-Bissextile (2001) -> REJET (2001 n'est pas divisible par 4)
| date.invalid.feb29.2001@test.com  | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 29       | February   | 2001      | India                  |
# 29 Février Non-Bissextile (2003) -> REJET
| date.invalid.feb29.2003@test.com  | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 29       | February   | 2003      | India                  |

@DateBirth @Invalid @MissingSelection
Examples:
# 5. Sélection Manquante (Valeurs par défaut du Dropdown)
| Email          | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Jour non sélectionné (Valeur "Day")
| date.invalid.missing.day@test.com  | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | Day      | January    | 2000      | India                  |
# Mois non sélectionné (Valeur "Month")
| date.invalid.missing.month@test.com  | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | Month      | 2000      | India                  |
# Année non sélectionnée (Valeur "Year")
| date.invalid.missing.year@test.com  | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | Year      | India                  |

# ====================================================================================
    # FOCUS : EMAIL ADDRESS
    # Règle Spécifique : Doit contenir "@" et finir par ".example"
    # Golden Data pour les autres champs : UserName=GoldenUser, Date=1/Jan/2000, etc.
    # ====================================================================================
@Email @2BVA @Valid
Examples:
# Bornes Valides (Longueur et Format)
| Email                                                | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Borne Min Valide (1 caractère locale + @ + 1 caractère domaine + .example)
# Longueur totale minimale logique : a@b.example
| a@b.example                                          | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
# Borne Max Valide (Limite standard SMTP ~254 caractères)
# On génère une longue chaîne qui finit obligatoirement par .example
| aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb.example | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

@Email @EP @Valid
Examples:
# Partitions Valides (Formats Complexes Autorisés)
| Email                                                | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Format Standard
| standardUser@test.example                            | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
# Avec des points dans la partie locale (Valid EP)
| first.last@test.example                              | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
# Avec des chiffres dans la partie locale (Valid EP)
| user1234@test.example                                | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
# Avec des sous-domaines (Valid EP)
| user@sub.domain.example                              | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

@Email @3BVA @Invalid @Structure
Examples:
# Structure Invalide (Manque des parties essentielles)
| Email                                                | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Manque l'arobase "@"
| usertest.example                                     | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
# Manque la partie locale (Commence par @)
| @test.example                                        | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
# Manque le domaine (Finit par @)
| user@                                                | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
# Manque l'extension (Pas de .example)
| user@test                                            | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

@Email @Invalid @SpecificRule
Examples:
# Violations de la règle stricte ".example"
| Email                                                | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Extension différente (Standard valide, mais Invalide ici selon votre règle)
| usfeg342er@google.com                                      | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
# Faute de frappe dans l'extension
| user@test.examples                                   | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
# Borne Max Valide (Limite standard SMTP ~254 caractères) mais avec domaine incorrect
| aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa@bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb.example | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

@Email @Negative @Syntax
Examples:
# Syntaxe Interdite (Espaces, Doubles caractères)
| Email                                                | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Espace au milieu
| user name@test.example                               | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
# Double arobase
| user@@test.example                                   | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
# Double point consécutif
| user.name@test..example                              | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
| user..name@test.example                              | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
# Champ Vide
|                                                      | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

# ====================================================================================
#     FOCUS : TITLE (Civilité / Genre)
#     Type : Boutons Radio
#     Golden Data pour les autres champs : Email=gold@test.com, Date=1/Jan/2000, etc.
#     ====================================================================================
@Title @EP @Valid
Examples:
# Sélection des options Valides (Male / Female)
| Title | Email | UserName | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Sélection du bouton "Mr." (Male)
| Mr. | title.ep.male@test.com | GoldenUser | FEMALE | Pass1234 | John | Doe | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |
# Sélection du bouton "Mrs." (Female)
| Mrs. | title.ep.female@test.com | GoldenUser | FEMALE | Pass1234 | Jane | Doe | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

@Title @Negative @Invalid
Examples:
# Aucune sélection (Validation Champ Obligatoire)
| Title | Email | UserName | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Champ laissé vide (Simule le fait de ne cliquer sur aucun bouton radio)
| | title.negative.empty@test.com | GoldenUser | FEMALE | Pass1234 | John | Doe | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

# ====================================================================================
#     FOCUS : PASSWORD
#     Règle : Longueur [8, 20] caractères
#     Golden Data pour les autres champs : Email=gold@test.com, Date=1/Jan/2000, etc.
#     ====================================================================================
@Password @2BVA @Valid
Examples:
# Bornes Valides (Min=8, Max=20)
| gender | password | Email | UserName | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Borne Min (8 caractères) -> "Pass1234"
| FEMALE | Pass1234 | password.bva.min.8chars@test.com | GoldenUser | John | Doe | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |
# Borne Max (20 caractères) -> "Password123456789012"
| FEMALE | password123456789012 | password.bva.max.20chars@test.com | GoldenUser | John | Doe | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

@Password @EP @Valid
Examples:
# Partitions Valides (Valeurs Nominales & Complexité)
| gender | password | Email | UserName | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Valeur Moyenne (12 caractères)
| FEMALE | MiddleVal123 | password.ep.middle.12chars@test.com | GoldenUser | John | Doe | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |
# Caractères Spéciaux (Si autorisés, bonne pratique EP)
| FEMALE | P@ssw0rd!# | password.ep.special.chars@test.com | GoldenUser | John | Doe | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

@Password @3BVA @Invalid
Examples:
# Bornes Invalides (Min-1=7, Max+1=21)
| gender | password | Email | UserName | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Trop Court (7 caractères) -> "Pass123"
| FEMALE | Pass123 | password.bva.invalid.too.short@test.com | GoldenUser | John | Doe | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |
# Trop Long (21 caractères) -> "Password1234567890123"
| FEMALE | password1234567890123 | password.bva.invalid.too.long@test.com | GoldenUser | John | Doe | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

@Password @Negative @Invalid
Examples:
# Formats Invalides (Vide)
| gender | password | Email | UserName | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Champ Vide
| FEMALE | | password.negative.empty@test.com | GoldenUser | John | Doe | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

# ====================================================================================
#     FOCUS : PERSONAL FIRST NAME
#     Règle : Char uniquement, Longueur [2, 15]
#     Golden Data pour Last Name = "Doe" (Fixe)
#     ====================================================================================
@FirstName @2BVA @Valid
Examples:
# Bornes Valides (Min=2, Max=15)
| firstNameAdressInfo | lastNameAdressInfo | Email | UserName | gender | password | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Borne Min (2 lettres) -> "Jo"
| Jo | Doe | firstname.bva.min.2chars@test.com | GoldenUser | FEMALE | Pass1234 | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |
# Borne Max (15 lettres) -> "JeanChristophee"
| JeanChristophee | Doe | firstname.bva.max.15chars@test.com | GoldenUser | FEMALE | Pass1234 | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

@FirstName @EP @Valid
Examples:
# Partitions Valides (Lettres standard)
| firstNameAdressInfo | lastNameAdressInfo | Email | UserName | gender | password | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Nom standard
| John | Doe | firstname.ep.standard@test.com | GoldenUser | FEMALE | Pass1234 | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |
# Nom composé avec tiret (Si accepté comme Char)
| Jean-Pierre | Doe | firstname.ep.composed.hyphen@test.com | GoldenUser | FEMALE | Pass1234 | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

@FirstName @3BVA @Invalid
Examples:
# Bornes Invalides (Min-1=1, Max+1=16)
| firstNameAdressInfo | lastNameAdressInfo | Email | UserName | gender | password | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Trop court (1 lettre) -> "J"
| J | Doe | firstname.bva.invalid.too.short@test.com | GoldenUser | FEMALE | Pass1234 | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |
# Trop long (16 lettres) -> "JeanChristopheee"
| JeanChristopheee | Doe | firstname.bva.invalid.too.long@test.com | GoldenUser | FEMALE | Pass1234 | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

@FirstName @Negative @Invalid
Examples:
# Type Invalide (Chiffres, Spéciaux, Vide)
| firstNameAdressInfo | lastNameAdressInfo | Email | UserName | gender | password | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Contient des chiffres (Règle : Only Char)
| John123 | Doe | firstname.negative.with.digits@test.com | GoldenUser | FEMALE | Pass1234 | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |
# Contient des caractères spéciaux
| John@ | Doe | firstname.negative.special.char@test.com | GoldenUser | FEMALE | Pass1234 | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |
# Champ Vide
| | Doe | firstname.negative.empty@test.com | GoldenUser | FEMALE | Pass1234 | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

# ====================================================================================
#     FOCUS : PERSONAL LAST NAME
#     Règle : Char uniquement, Longueur [2, 15]
#     Golden Data pour First Name = "John" (Fixe)
#     ====================================================================================
@LastName @2BVA @Valid
Examples:
# Bornes Valides (Min=2, Max=15)
| lastNameAdressInfo | firstNameAdressInfo | Email | UserName | gender | password | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Borne Min (2 lettres) -> "Do"
| Do | John | lastname.bva.min.2chars@test.com | GoldenUser | FEMALE | Pass1234 | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |
# Borne Max (15 lettres) -> "DupontDeNemours"
| DupontDeNemours | John | lastname.bva.max.15chars@test.com | GoldenUser | FEMALE | Pass1234 | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

@LastName @EP @Valid
Examples:
# Partitions Valides (Lettres standard)
| lastNameAdressInfo | firstNameAdressInfo | Email | UserName | gender | password | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Nom standard
| Doe | John | lastname.ep.standard@test.com | GoldenUser | FEMALE | Pass1234 | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |
# Nom composé (D'Arcy)
| D'Arcy | John | lastname.ep.composed.apostrophe@test.com | GoldenUser | FEMALE | Pass1234 | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

@LastName @3BVA @Invalid
Examples:
# Bornes Invalides (Min-1=1, Max+1=16)
| lastNameAdressInfo | firstNameAdressInfo | Email | UserName | gender | password | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Trop court (1 lettre) -> "D"
| D | John | lastname.bva.invalid.too.short@test.com | GoldenUser | FEMALE | Pass1234 | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |
# Trop long (16 lettres) -> "DupontDeNemourss"
| DupontDeNemourss | John | lastname.bva.invalid.too.long@test.com | GoldenUser | FEMALE | Pass1234 | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

@LastName @Negative @Invalid
Examples:
# Type Invalide (Chiffres, Spéciaux, Vide)
| lastNameAdressInfo | firstNameAdressInfo | Email | UserName | gender | password | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Contient des chiffres
| Doe123 | John | lastname.negative.with.digits@test.com | GoldenUser | FEMALE | Pass1234 | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |
# Contient des caractères spéciaux interdits
| Doe# | John | lastname.negative.special.char@test.com | GoldenUser | FEMALE | Pass1234 | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |
# Champ Vide
| | John | lastname.negative.empty@test.com | GoldenUser | FEMALE | Pass1234 | TestCorp | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

# ====================================================================================
#     FOCUS : COMPANY NAME
#     Règle : Longueur Max 30, Type Alphanumérique (Facultatif ou non)
#     Golden Data pour les autres champs : Email=gold@test.com, Date=1/Jan/2000, etc.
#     ====================================================================================
@Company @2BVA @Valid
Examples:
# Bornes Valides (Max=30)
| companyAddressInfoInfo | Email | UserName | gender | password | firstNameAdressInfo | lastNameAdressInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Borne Min (1 carac)
| A | company.bva.min.1char@test.com | GoldenUser | FEMALE | Pass1234 | John | Doe | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |
# Borne Max (30 carac)
| TestCorpInternationalServicesL | company.bva.max.30chars@test.com | GoldenUser | FEMALE | Pass1234 | John | Doe | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

@Company @EP @Valid
Examples:
# Partitions Valides (Alphanumérique)
| companyAddressInfoInfo | Email | UserName | gender | password | firstNameAdressInfo | lastNameAdressInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Lettres + Chiffres
| TestCorp 123 | company.ep.alphanumeric@test.com | GoldenUser | FEMALE | Pass1234 | John | Doe | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |
# Champ Vide (Si facultatif)
| | company.ep.empty.optional@test.com | GoldenUser | FEMALE | Pass1234 | John | Doe | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

@Company @3BVA @Invalid
Examples:
# Bornes Invalides (Max+1=31)
| companyAddressInfoInfo | Email | UserName | gender | password | firstNameAdressInfo | lastNameAdressInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Trop long (31 carac)
| TestCorpInternationalServicesLt | company.bva.invalid.too.long@test.com | GoldenUser | FEMALE | Pass1234 | John | Doe | 123 Main St | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

# ====================================================================================
#     FOCUS : ADDRESS
#     Règle : Alphanumérique, Longueur Max 50
#     ====================================================================================
@Address @2BVA @Valid
Examples:
# Bornes Valides (Max=50)
| addressInfoInfo | Email | UserName | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Borne Min (1 carac)
| 1 | address.bva.min.1char@test.com | GoldenUser | FEMALE | Pass1234 | John | Doe | TestCorp | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |
# Borne Max (50 carac)
| 1234 Main Street Boulevard North West Suite 100 ABC | address.bva.max.50chars@test.com | GoldenUser | FEMALE | Pass1234 | John | Doe | TestCorp | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

@Address @EP @Valid
Examples:
# Partitions Valides (Standard)
| addressInfoInfo | Email | UserName | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
| 123 Main St | address.ep.standard@test.com | GoldenUser | FEMALE | Pass1234 | John | Doe | TestCorp | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

@Address @3BVA @Invalid
Examples:
# Bornes Invalides (Max+1=51)
| addressInfoInfo | Email | UserName | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
| 1234 Main Street Boulevard North West Suite 100 ABCD | address.bva.invalid.too.long@test.com | GoldenUser | FEMALE | Pass1234 | John | Doe | TestCorp | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |

@Address @Negative @Invalid
Examples:
# Champ Vide (Si obligatoire)
|  | address.negative.empty@test.com | GoldenUser | FEMALE | Pass1234 | John | Doe | TestCorp | NY | NYC | 12345 | 0612345678 | 1 | January | 2000 | India |


# ====================================================================================
#     FOCUS : CITY
#     Règle : Lettres uniquement, Longueur Max 30
#     ====================================================================================
@City @2BVA @Valid
Examples:
# Bornes Valides (Max=30)
| cityAddressInfo | Email | UserName | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Borne Min (1 lettre)
| A | city.bva.min.1char@test.com | GoldenUser | FEMALE | Pass1234 | John | Doe | TestCorp | 123 Main St | NY | 12345 | 0612345678 | 1 | January | 2000 | India |
# Borne Max (30 lettres)
| CityNameWithExactlyThirtyChars | city.bva.max.30chars@test.com | GoldenUser | FEMALE | Pass1234 | John | Doe | TestCorp | 123 Main St | NY | 12345 | 0612345678 | 1 | January | 2000 | India |

@City @EP @Valid
Examples:
| cityAddressInfo | Email | UserName | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
| New York | city.ep.standard@test.com | GoldenUser | FEMALE | Pass1234 | John | Doe | TestCorp | 123 Main St | NY | 12345 | 0612345678 | 1 | January | 2000 | India |

@City @3BVA @Invalid
Examples:
# Trop long (31 lettres)
| CityNameWithExactlyThirtyCharsA | city.bva.invalid.too.long@test.com | GoldenUser | FEMALE | Pass1234 | John | Doe | TestCorp | 123 Main St | NY | 12345 | 0612345678 | 1 | January | 2000 | India |

@City @Negative @Invalid
Examples:
# Chiffres dans la ville
| NYC123 | city.negative.with.digits@test.com | GoldenUser | FEMALE | Pass1234 | John | Doe | TestCorp | 123 Main St | NY | 12345 | 0612345678 | 1 | January | 2000 | India |
# Champ Vide
| | city.negative.empty@test.com | GoldenUser | FEMALE | Pass1234 | John | Doe | TestCorp | 123 Main St | NY | 12345 | 0612345678 | 1 | January | 2000 | India |

# ====================================================================================
#     FOCUS : POSTCODE (Zip Code)
#     Règle : Numérique uniquement, Longueur Fixe 5 (Format US supposé)
#     ====================================================================================
@Postcode @2BVA @Valid
Examples:
# Bornes Valides (Longueur = 5)
| postcodeAddressInfo | Email | UserName | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
| 12345               | postcode.bva.standard.12345@test.com | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | India          |
# Valeur Limite Basse (00000)
| 00000               | postcode.bva.min.00000@test.com | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | India          |
# Valeur Limite Haute (99999)
| 99999               | postcode.bva.max.99999@test.com | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | India          |

@Postcode @EP @Valid
Examples:
# Partitions Valides (5 chiffres)
| postcodeAddressInfo | Email | UserName | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
| 75001               | postcode.ep.standard.75001@test.com | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | India          |

@Postcode @3BVA @Invalid
Examples:
# Bornes Invalides (Longueur != 5)
| postcodeAddressInfo | Email | UserName | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Trop court (4 chiffres)
| 1234                | postcode.bva.invalid.too.short@test.com | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | India          |
# Trop long (6 chiffres)
| 123456              | postcode.bva.invalid.too.long@test.com | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | India          |

@Postcode @Negative @Invalid
Examples:
# Type Invalide (Alphanumérique, Spéciaux, Vide)
| postcodeAddressInfo | Email | UserName | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
# Lettres (ABCDE) -> Longueur 5 OK, mais Type KO
| ABCDE               | postcode.negative.letters@test.com | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | United States          |
# Mixte Chiffres/Lettres (12A45) -> Longueur 5 OK, mais Type KO
| 12A45               | postcode.negative.alphanumeric@test.com | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | United States          |
# Caractères Spéciaux (12-34) -> Longueur 5 OK, mais Type KO
| 12-34               | postcode.negative.hyphen@test.com | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | United States          |
# Espace au milieu (12 34) -> Longueur 5 OK, mais Type KO
| 12 34               | postcode.negative.space@test.com | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | United States          |
# Champ Vide
|                     | postcode.negative.empty@test.com | GoldenUser | FEMALE | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | United States          |
