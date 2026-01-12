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
            # FOCUS : USERNAME
            # Données fixes (Golden Data) pour les autres champs :
            # Email=gold@test.com, Pass=Pass1234, Name=John Doe, Date=1/Jan/1990
            # ====================================================================================

            @UserName @2BVA @Valid
            Examples: # Bornes Valides (Min=2, Max=50)
              | Email          | UserName                                           | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
              # Borne Min (2 caractères)
              | usrnf.bvamin.u001@sefffe.vflifation.complex21  | Jo                                                 | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1990      | India                  |
              # Borne Max (50 caractères) -> "UserNamesCanBeVeryLongToTestTheLimitOfFiftyChars12"
              | usrnf.bvamax.u002@sffufe.vflifation.complex21  | UserNamesCanBeVeryLongToTestTheLimitOfFiftyChars12 | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1990      | India                  |

            @UserName @EP @Valid
            Examples: # Partitions Valides (Alphanumérique)
              | Email          | UserName                                           | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
              # Mixte Lettres et Chiffres
              | usrnf.epvalid.u013@gecure.falfdation.complex21  | User1234                                           | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1990      | India                  |
              # Chiffres uniquement (si accepté comme Username)
              | usrnf.epvalid.ud34@secure.falfdation.complex21  | 987654321                                          | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1990      | India                  |

            @UserName @3BVA @Invalid
            Examples: # Bornes Invalides (Min-1=1, Max+1=51)
              | Email          | UserName                                            | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
              # Trop court (1 caractère)
              | usrnf.invalbva.u305@secure.falidation.complex21  | J                                                   | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1990      | India                  |
              # Trop long (51 caractères) -> "UserNamesCanBeVeryLongToTestTheLimitOfFiftyChars123"
              | usrnf.invalbva.u406@secure.falidation.complex21  | UserNamesCanBeVeryLongToTestTheLimitOfFiftyChars123 | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1990      | India                  |

            @UserName @Negative @Invalid
            Examples: # Formats Invalides (Spéciaux, Vide)
              | Email          | UserName                                           | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
              # Caractères spéciaux interdits
              | usrnf.invalneg.u407@secure.falidation.complex21  | User@Name!                                         | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1990      | India                  |
              # Champ Vide (laissez l'espace vide entre les pipes)
              | usrnf.invalneg.u508@secure.falidation.complex21  |                                                    | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1990      | India                  |

              # ====================================================================================
                  # FOCUS : DATE OF BIRTH (Day, Month, Year)
                  # Règles :
                  #   - Année : [1925, 2007]
                  #   - Mois : 1-12 (Cohérence 30/31 jours)
                  #   - Février : 28 jours (Normal), 29 jours (Bissextile/Leap Year)
                  # ====================================================================================

                  @DateBirth @2BVA @Valid @YearLimits
                  Examples: # 1. Bornes Valides de l'Année (Min/Max) et Mois (Jan/Dec)
                    | Email          | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                    # Borne Min Absolue (Le plus vieux autorisé) : 1 Janvier 1925
                    | dob.yearlifits.d001@sefure.validation.complex21  | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1925      | India                  |
                    # Borne Max Absolue (Le plus jeune autorisé) : 31 Décembre 2007
                    | dob.yearlifits.d002@sefure.validation.complex21  | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 31       | December   | 2007      | India                  |
                    # Valeur Nominale (Milieu)
                    | dob.yearlifits.d003@sefure.validation.complex21  | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 15       | June       | 1980      | India                  |

                  @DateBirth @EP @Valid @LeapYear
                  Examples: # 2. Cas Spéciaux Valides (Fin de mois et Année Bissextile)
                    | Email          | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                    # Fin de mois 30 jours (30 Avril) - Doit être accepté
                    | dob.leapyear.d004@secufe.validation.complex21  | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 30       | April      | 2000      | India                  |
                    # Février Bissextile (29 Février 2000) - 2000 est divisible par 400 -> ACCEPTÉ
                    | dob.leapyear.d005@secufe.validation.complex21  | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 29       | February   | 2000      | India                  |
                    # Février Bissextile (29 Février 1996) - 1996 est divisible par 4 -> ACCEPTÉ
                    | dob.leapyear.d006@secufe.validation.complex21  | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 29       | February   | 1996      | India                  |

                  @DateBirth @3BVA @Invalid @YearRange
                  Examples: # 3. Bornes Invalides de l'Année (Min-1, Max+1)
                    | Email          | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                    # Trop Vieux (1924) - Juste avant la limite 1925
                    | dob.yearrange.d007@secfre.validation.complex21  | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 1924      | India                  |
                    # Trop Jeune (2008) - Juste après la limite 2007
                    | dob.yearrange.d008@secfre.validation.complex21  | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2008      | India                  |

                  @DateBirth @Invalid @LogicalDates
                  Examples: # 4. Incohérences Calendaires (Jours impossibles selon le mois)
                    | Email          | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                    # 31 Avril (Avril n'a que 30 jours) -> REJET
                    | dob.logicaldates.d009@secure.validation.complex21  | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 31       | April      | 2000      | India                  |
                    # 31 Juin (Juin n'a que 30 jours) -> REJET
                    | dob.logicaldates.d010@secure.validation.complex21  | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 31       | June       | 2000      | India                  |
                    # 30 Février (N'existe jamais) -> REJET
                    | dob.logicaldates.d011@secure.validation.complex21  | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 30       | February   | 2000      | India                  |
                    # 29 Février Non-Bissextile (2001) -> REJET (2001 n'est pas divisible par 4)
                    | dob.logicaldates.d012@secure.validation.complex21  | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 29       | February   | 2001      | India                  |
                    # 29 Février Non-Bissextile (2003) -> REJET
                    | dob.logicaldates.d013@secure.validation.complex21  | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 29       | February   | 2003      | India                  |
                    # 31 Septembre (Septembre n'a que 30 jours) -> REJET
                    | dob.logicaldates.d017@secure.validation.complex21  | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 31       | September  | 2000      | India                  |
                    # 29 Février 1900 (Non bissextile - divisible par 100 mais pas par 400) -> REJET
                    | dob.logicaldates.d018@secure.validation.complex21  | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 29       | February   | 1900      | India                  |

                  @DateBirth @Invalid @MissingSelection
                  Examples: # 5. Sélection Manquante (Valeurs par défaut du Dropdown)
                    | Email          | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                    # Jour non sélectionné (Valeur "Day")
                    | dob.missingselector.d014@secure.validation.complex21  | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | Day      | January    | 2000      | India                  |
                    # Mois non sélectionné (Valeur "Month")
                    | dob.missingselector.d015@secure.validation.complex21  | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | Month      | 2000      | India                  |
                    # Année non sélectionnée (Valeur "Year")
                    | dob.missingselector.d016@secure.validation.complex21  | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | Year      | India                  |

                        # ====================================================================================
                        # FOCUS : EMAIL ADDRESS
                        # Règle Spécifique : Doit contenir "@" et finir par ".example"
                        # Golden Data pour les autres champs : UserName=GoldenUser, Date=1/Jan/2000, etc.
                        # ====================================================================================

                        @Email @2BVA @Valid
                        Examples: # Bornes Valides (Longueur et Format)
                          | Email                                                                                                                                                                                                                         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                          # Borne Min Valide (Format minimal avec @ et .example)
                          | k.fin.n4@a.example                                                                                                                                                                                                            | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                          # Borne Max Valide (Limite SMTP 254 caractères) : 64 chars local + @ + 181 chars domain + .example
                          | lllfffllllllllllllllllldlellllllllllllllllllllllllllllllllllllllll@ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd.example | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                        @Email @EP @Valid
                        Examples: # Partitions Valides (Formats Complexes Autorisés)
                          | Email                                                | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                          # Format Standard (Lettres et @ et .example)
                          | stanxard.h4@test.example                             | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                          # Avec des points dans la partie locale (Valid EP)
                          | fitest.lfst.v4@test.example                           | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                          # Avec des chiffres dans la partie locale (Valid EP)
                          | usasd234.v4@tegt.example                             | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                          # Avec des sous-domaines (Valid EP)
                          | useg.v4@sub.dodain.example                           | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                          # Avec tag + (Valid EP)
                          | usfr+nfws.v4@tfst.example                            | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                          # Avec underscore (Valid EP)
                          | ughr_dame.v4@tgst.example                            | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                        @Email @3BVA @Invalid @Structure
                        Examples: # Structure Invalide (Manque des parties essentielles)
                          | Email                                                | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                          # Manque l'arobase "@" (Violation règle @)
                          | usgrv4hgst.example                                   | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                          # Manque la partie locale (Commence par @)
                          | @v42gdt.example                                      | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                          # Manque le domaine (Finit par @)
                          | u6fr.v4@                                             | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                          # Manque l'extension (Pas de .example)
                          | uk3r.v4@test                                         | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                        @Email @Invalid @SpecificRule
                        Examples: # Violations de la règle stricte ".example"
                          | Email                                                | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                          # Extension différente (ne finit pas par .example)
                          | us5r.v4@google.com                                   | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                          # Faute de frappe dans l'extension
                          | ug3r.v4@test.examples                                | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                        @Email @Negative @Syntax
                        Examples: # Syntaxe Interdite (Espaces, Doubles caractères)
                          | Email                                                | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                          # Espace au milieu
                          | uger nm2e.v4@t3st.example                            | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                          # Espace au début
                          |  uhfr.v4@te4t.example                                | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                          # Double arobase
                          | uf3r@@v4teft.example                                 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                          # Double point consécutif
                          | f4er..nafe.v4@test.example                           | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                          # Champ Vide
                          |                                                      | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                          # ====================================================================================
                              # FOCUS : TITLE (Civilité / Genre)
                              # Type : Boutons Radio
                              # Golden Data pour les autres champs : Email=gold@test.com, Date=1/Jan/2000, etc.
                              # ====================================================================================

                              @Title @EP @Valid
                              Examples: # Sélection des options Valides (Male / Female)
                                | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                # Sélection du bouton "Mr." (Male)
                                | sgof32ld@te23st.com | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                # Sélection du bouton "Mrs." (Female)
                                | segoewld@tesd3t.com | GoldenUser | Female | Pass1234 | Jane                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                              @Title @Negative @Invalid
                              Examples: # Aucune sélection (Validation Champ Obligatoire)
                                | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                # Champ laissé vide (Simule le fait de ne cliquer sur aucun bouton radio)
                                | segodsld@test12.com | GoldenUser |    | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                # ====================================================================================
                                    # FOCUS : PASSWORD
                                    # Règle : Longueur [8, 20] caractères
                                    # Golden Data pour les autres champs : Email=gold@test.com, Date=1/Jan/2000, etc.
                                    # ====================================================================================

                                    @Password @2BVA @Valid
                                    Examples: # Bornes Valides (Min=8, Max=20)
                                      | password             | Email         | UserName   | gender | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                      # Borne Min (8 caractères) -> "Pass1234"
                                      | Pass1234             | pass.bva.p001@secure.validation.complex21 | GoldenUser | Male   | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                      # Borne Max (20 caractères) -> "Password123456789012"
                                      | Password123456789012 | pass.bva.p002@secure.validation.complex21 | GoldenUser | Female | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                    @Password @EP @Valid
                                    Examples: # Partitions Valides (Valeurs Nominales & Complexité)
                                      | password             | Email         | UserName   | gender | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                      # Valeur Moyenne (12 caractères)
                                      | MiddleVal123         | pass.ep.p003@secure.validation.complex21 | GoldenUser | Male   | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                      # Caractères Spéciaux (Si autorisés, bonne pratique EP)
                                      | P@ssw0rd!#           | pass.ep.p004@secure.validation.complex21 | GoldenUser | Female | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                    @Password @3BVA @Invalid
                                    Examples: # Bornes Invalides (Min-1=7, Max+1=21)
                                      | password              | Email         | UserName   | gender | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                      # Trop Court (7 caractères) -> "Pass123"
                                      | Pass123               | pass.bvainv.p005@secure.validation.complex21 | GoldenUser | Male   | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                      # Trop Long (21 caractères) -> "Password1234567890123"
                                      | Password1234567890123 | pass.bvainv.p006@secure.validation.complex21 | GoldenUser | Female | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                    @Password @Negative @Invalid
                                    Examples: # Formats Invalides (Vide)
                                      | password             | Email         | UserName   | gender | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                      # Champ Vide
                                      |                      | pass.negneg.p007@secure.validation.complex21 | GoldenUser | Male   | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                      # Espaces uniquement (8 espaces)
                                      |                      | pass.negneg.p008@secure.validation.complex21 | GoldenUser | Female | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                      # Mot de passe faible courant
                                      | password             | pass.negneg.p009@secure.validation.complex21 | GoldenUser | Male   | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                      # Avec espace au milieu
                                      | Pass 123             | pass.negneg.p010@secure.validation.complex21 | GoldenUser | Female | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                      # Commençant par espace
                                      |  Pass1234            | pass.negneg.p011@secure.validation.complex21 | GoldenUser | Male   | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                      # ====================================================================================
                                          # FOCUS : PERSONAL FIRST NAME
                                          # Règle : Char uniquement, Longueur [2, 15]
                                          # Golden Data pour Last Name = "Doe" (Fixe)
                                          # ====================================================================================

                                          @FirstName @2BVA @Valid
                                          Examples: # Bornes Valides (Min=2, Max=15)
                                            | firstNameAdressInfo | lastNameAdressInfo | Email         | UserName   | gender | password | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                            # Borne Min (2 lettres) -> "Jo"
                                            | Jo                  | Doe                | fname.bva.f001@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                            # Borne Max (15 lettres) -> "JeanChristophee"
                                            | JeanChristophee     | Doe                | fname.bva.f002@secure.validation.complex21 | GoldenUser | Female | Pass1234 | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                          @FirstName @EP @Valid
                                          Examples: # Partitions Valides (Lettres standard)
                                            | firstNameAdressInfo | lastNameAdressInfo | Email         | UserName   | gender | password | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                            # Nom standard
                                            | John                | Doe                | fname.ep.f003@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                            # Nom composé avec tiret (Si accepté comme Char)
                                            | Jean-Pierre         | Doe                | fname.ep.f004@secure.validation.complex21 | GoldenUser | Female | Pass1234 | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                          @FirstName @3BVA @Invalid
                                          Examples: # Bornes Invalides (Min-1=1, Max+1=16)
                                            | firstNameAdressInfo | lastNameAdressInfo | Email         | UserName   | gender | password | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                            # Trop court (1 lettre) -> "J"
                                            | J                   | Doe                | fname.bvainv.f005@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                            # Trop long (16 lettres) -> "JeanChristopheee"
                                            | JeanChristopheee    | Doe                | fname.bvainv.f006@secure.validation.complex21 | GoldenUser | Female | Pass1234 | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                          @FirstName @Negative @Invalid
                                          Examples: # Type Invalide (Chiffres, Spéciaux, Vide)
                                            | firstNameAdressInfo | lastNameAdressInfo | Email         | UserName   | gender | password | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                            # Contient des chiffres (Règle : Only Char)
                                            | John123             | Doe                | fname.negneg.f007@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                            # Contient des caractères spéciaux
                                            | John@               | Doe                | fname.negneg.f008@secure.validation.complex21 | GoldenUser | Female | Pass1234 | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                            # Champ Vide
                                            |                     | Doe                | fname.negneg.f009@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                            # ====================================================================================
                                                # FOCUS : PERSONAL LAST NAME
                                                # Règle : Char uniquement, Longueur [2, 15]
                                                # Golden Data pour First Name = "John" (Fixe)
                                                # ====================================================================================

                                                @LastName @2BVA @Valid
                                                Examples: # Bornes Valides (Min=2, Max=15)
                                                  | lastNameAdressInfo | firstNameAdressInfo | Email         | UserName   | gender | password | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                  # Borne Min (2 lettres) -> "Do"
                                                  | Do                 | John                | lname.bva.l001@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                  # Borne Max (15 lettres) -> "DupontDeNemours"
                                                  | DupontDeNemours    | John                | lname.bva.l002@secure.validation.complex21 | GoldenUser | Female | Pass1234 | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                                @LastName @EP @Valid
                                                Examples: # Partitions Valides (Lettres standard)
                                                  | lastNameAdressInfo | firstNameAdressInfo | Email         | UserName   | gender | password | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                  # Nom standard
                                                  | Doe                | John                | lname.ep.l003@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                  # Nom composé avec espace (Si accepté)
                                                  | Von Der            | John                | lname.ep.l004@secure.validation.complex21 | GoldenUser | Female | Pass1234 | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                                @LastName @3BVA @Invalid
                                                Examples: # Bornes Invalides (Min-1=1, Max+1=16)
                                                  | lastNameAdressInfo  | firstNameAdressInfo | Email         | UserName   | gender | password | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                  # Trop court (1 lettre) -> "D"
                                                  | D                   | John                | lname.bvainv.l005@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                  # Trop long (16 lettres) -> "DupontDeNemoursX"
                                                  | DupontDeNemoursX    | John                | lname.bvainv.l006@secure.validation.complex21 | GoldenUser | Female | Pass1234 | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                                @LastName @Negative @Invalid
                                                Examples: # Type Invalide (Chiffres, Spéciaux, Vide)
                                                  | lastNameAdressInfo | firstNameAdressInfo | Email         | UserName   | gender | password | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                  # Contient des chiffres (Règle : Only Char)
                                                  | Doe123             | John                | lname.negneg.l007@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                  # Contient des caractères spéciaux
                                                  | Doe!               | John                | lname.negneg.l008@secure.validation.complex21 | GoldenUser | Female | Pass1234 | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                  # Champ Vide
                                                  |                    | John                | lname.negneg.l009@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                                  # ====================================================================================
                                                      # FOCUS : COMPANY (Nom d'entreprise)
                                                      # Type : Texte Libre (Optionnel)
                                                      # Règles : Alphanumérique + Symboles courants (&, -, .). Longueur [0, 50].
                                                      # Golden Data : Email=company@test.com, Date=1/Jan/2000, etc.
                                                      # ====================================================================================

                                                      @Company @2BVA @Valid
                                                      Examples: # Bornes Valides (Min=0 optionnel, Max=50)
                                                        | companyAddressInfoInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                        # Borne Min (1 caractère)
                                                        | A                                                  | company.bva.co001@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                        # Borne Max (50 caractères)
                                                        | CompanyNameThatIsExactlyFiftyCharactersLongTest123 | company.bva.co002@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                                      @Company @EP @Valid
                                                      Examples: # Partitions Valides (Formats Autorisés)
                                                        | companyAddressInfoInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                        # Champ Vide (Si optionnel)
                                                        |                                                    | company.ep.co003@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                        # Nom standard avec Inc.
                                                        | TestCorp Inc.                                      | company.ep.co004@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                        # Avec caractère & (Johnson & Johnson)
                                                        | Johnson & Johnson                                  | company.ep.co005@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                        # Avec tiret (Rolls-Royce)
                                                        | Rolls-Royce Ltd                                    | company.ep.co006@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                                      @Company @3BVA @Invalid
                                                      Examples: # Bornes Invalides (Max+1=51)
                                                        | companyAddressInfoInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                        # Trop long (51 caractères)
                                                        | CompanyNameThatIsExactlyFiftyCharactersLongTest1234 | company.bvainv.co007@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                                      @Company @Negative @Invalid
                                                      Examples: # Types Invalides (Injection, XSS)
                                                        | companyAddressInfoInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                        # Injection SQL
                                                        | TestCorp'; DROP TABLE users;--                     | company.negneg.co008@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                        # Script XSS
                                                        | <script>alert('xss')</script>                      | company.negneg.co009@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                                  # ====================================================================================
                                                      # FOCUS : COUNTRY (Dropdown List)
                                                      # Liste finie : [India, United States, Canada, Australia, Israel, New Zealand, Singapore]
                                                      # Golden Data pour les autres champs : Email=gold@test.com, Date=1/Jan/2000, etc.
                                                      # ====================================================================================

                                                      @Country @2BVA @Valid
                                                      Examples: # Bornes Valides (Premier et Dernier élément de la liste)
                                                        | countryInfoInfoDropBox | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear |
                                                        # Borne Min (Premier élément / Haut de liste)
                                                        | India                  | country.bva.c001@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      |
                                                        # Borne Max (Dernier élément / Bas de liste)
                                                        | Singapore              | country.bva.c002@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      |

                                                      @Country @EP @Valid
                                                      Examples: # Partitions Valides (Éléments au milieu de la liste)
                                                        | countryInfoInfoDropBox | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear |
                                                        # Sélection explicite au milieu (Surligné dans votre capture)
                                                        | Canada                 | country.ep.c003@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      |
                                                        # Autre sélection au milieu
                                                        | Israel                 | country.ep.c004@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      |

                                                      @Country @Negative @Invalid
                                                      Examples: # Valeurs Invalides (Vide ou Hors Liste)
                                                        | countryInfoInfoDropBox | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear |
                                                        # Champ forcé à VIDE (Pour vérifier la validation "Required" côté serveur)
                                                        |                        | country.negneg.c005@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      |
                                                        # Valeur HORS LISTE (Pour vérifier la sécurité si on injecte un pays non autorisé)
                                                        | France                 | country.negneg.c006@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      |

                                                        # ====================================================================================
                                                            # FOCUS : STATE (État / Région)
                                                            # Type : Texte Libre
                                                            # Règles implicites : Lettres, Espaces, Tirets autorisés. Longueur [2, 50].
                                                            # Golden Data : Country=India, Zip=12345, etc.
                                                            # ====================================================================================

                                                            @State @2BVA @Valid
                                                            Examples: # Bornes Valides (Longueur Min et Max)
                                                              | stateAddressInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                              # Borne Min (2 caractères - Abréviation) -> "MH" (Maharashtra) ou "NY"
                                                              | MH               | state.bva.s001@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Mumbai          | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                              # Borne Max (50 caractères) -> Longue chaîne générée
                                                              | StateNameThatIsVeryVeryLongToReachFiftyCharsLimitX | state.bva.s002@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Mumbai          | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                                            @State @EP @Valid
                                                            Examples: # Partitions Valides (Formats Complexes : Espaces, Tirets)
                                                              | stateAddressInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                              # Nom Simple Standard
                                                              | Maharashtra      | state.ep.s003@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Mumbai          | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                              # Nom Composé avec Espace (Partition Critique)
                                                              | New Delhi        | state.ep.s004@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Mumbai          | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                              # Nom Composé avec Tiret (Partition Critique)
                                                              | Jammu-Kashmir    | state.ep.s005@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Mumbai          | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                                            @State @3BVA @Invalid
                                                            Examples: # Bornes Invalides (Longueur)
                                                              | stateAddressInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                              # Trop court (1 caractère) -> "A" (Ambigu, mais souvent rejeté comme faute de frappe)
                                                              | A                | state.bvainv.s006@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Mumbai          | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                              # Trop Long (51 caractères)
                                                              | StateNameThatIsVeryVeryLongToReachFiftyCharsLimitX1 | state.bvainv.s007@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Mumbai          | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                                            @State @Negative @Invalid
                                                            Examples: # Types Invalides (Chiffres, Spéciaux, Vide)
                                                              | stateAddressInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                              # Chiffres uniquement (Confusion avec Code Postal)
                                                              | 12345            | state.negneg.s008@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Mumbai          | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                              # Caractères Spéciaux (Illogique pour un lieu géographique)
                                                              | @State#          | state.negneg.s009@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Mumbai          | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                              # Champ Vide (Requis)
                                                              |                  | state.negneg.s010@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Mumbai          | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                                              # ====================================================================================
                                                                  # FOCUS : CITY (Ville)
                                                                  # Type : Texte Libre
                                                                  # Règles : Lettres, Espaces, Tirets, Apostrophes. Longueur [2, 50].
                                                                  # Rejet : Chiffres seuls, Caractères spéciaux.
                                                                  # ====================================================================================

                                                                  @City @2BVA @Valid
                                                                  Examples: # Bornes Valides (Longueur Min et Max)
                                                                    | cityAddressInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                                    # Borne Min (2 caractères) -> "Ur" (Ville historique) ou "Ay"
                                                                    | Ur              | city.bva.ct001@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Maharashtra      | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                                    # Borne Max (50 caractères) -> Chaîne générée
                                                                    | CityNameThatIsVeryVeryLongToReachFiftyCharsLimitX1 | city.bva.ct002@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Maharashtra      | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                                                  @City @EP @Valid
                                                                  Examples: # Partitions Valides (Formats Complexes Réels)
                                                                    | cityAddressInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                                    # Nom Standard Simple
                                                                    | Mumbai          | city.ep.ct003@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Maharashtra      | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                                    # Nom Composé avec Espace (Partition Critique)
                                                                    | New Delhi       | city.ep.ct004@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Maharashtra      | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                                    # Nom Composé avec Tiret (Partition Critique)
                                                                    | Saint-Cloud     | city.ep.ct005@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Maharashtra      | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                                                  @City @3BVA @Invalid
                                                                  Examples: # Bornes Invalides (Longueur)
                                                                    | cityAddressInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                                    # Trop court (1 caractère) -> "A"
                                                                    | A               | city.bvainv.ct006@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Maharashtra      | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                                    # Trop Long (51 caractères)
                                                                    | CityNameThatIsVeryVeryLongToReachFiftyCharsLimitX12 | city.bvainv.ct007@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Maharashtra      | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                                                  @City @Negative @Invalid
                                                                  Examples: # Types Invalides (Données illogiques pour une ville)
                                                                    | cityAddressInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                                    # Chiffres uniquement (L'utilisateur confond avec Zipcode)
                                                                    | 90210           | city.negneg.ct008@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Maharashtra      | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                                    # Caractères Spéciaux (Interdits dans les noms de lieux)
                                                                    | City@Name!      | city.negneg.ct009@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Maharashtra      | 12345               | 0612345678          | 1        | January    | 2000      | India                  |
                                                                    # Champ Vide (Requis)
                                                                    |                 | city.negneg.ct010@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | Maharashtra      | 12345               | 0612345678          | 1        | January    | 2000      | India                  |

                                                                    # ====================================================================================
                                                                        # FOCUS : ZIPCODE (Code Postal)
                                                                        # Règle Longueur : [5, 10] chiffres.
                                                                        # Règle Contenu : Chiffres uniquement (0-9). Pas de lettres, pas de symboles.
                                                                        # Golden Data : Country=United States, State=NY, etc.
                                                                        # ====================================================================================

                                                                        @Zipcode @2BVA @Valid
                                                                        Examples: # Bornes Valides (Longueur Min et Max)
                                                                          | postcodeAddressInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                                          # Borne Min (5 chiffres) -> "10001"
                                                                          | 10001               | zipcode.bva.z001@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | United States          |
                                                                          # Borne Max (10 chiffres) -> "1234567890"
                                                                          | 1234567890          | zipcode.bva.z002@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | United States          |

                                                                        @Zipcode @EP @Valid
                                                                        Examples: # Partitions Valides (Cas Spéciaux Numériques)
                                                                          | postcodeAddressInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                                          # Cas Critique : Commence par Zéro (01234)
                                                                          # Vérifie que le système ne supprime pas le zéro (ce qui ferait une longueur de 4 invalide)
                                                                          | 01234               | zipcode.ep.z003@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | United States          |
                                                                          # Valeur Intermédiaire (7 chiffres)
                                                                          | 1234567             | zipcode.ep.z004@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | United States          |

                                                                        @Zipcode @3BVA @Invalid
                                                                        Examples: # Bornes Invalides (Longueur)
                                                                          | postcodeAddressInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                                          # Trop court (Min-1 = 4 chiffres) -> "1234"
                                                                          | 1234                | zipcode.bvainv.z005@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | United States          |
                                                                          # Trop long (Max+1 = 11 chiffres) -> "12345678901"
                                                                          | 12345678901         | zipcode.bvainv.z006@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | United States          |

                                                                        @Zipcode @Negative @Invalid
                                                                        Examples: # Types Invalides (Non-numérique)
                                                                          | postcodeAddressInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                                          # Lettres Uniquement (ABCDE) -> Longueur 5 OK, mais Type KO
                                                                          | ABCDE               | zipcode.negneg.z007@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | United States          |
                                                                          # Mixte Chiffres/Lettres (12A45) -> Longueur 5 OK, mais Type KO
                                                                          | 12A45               | zipcode.negneg.z008@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | United States          |
                                                                          # Caractères Spéciaux (12-34) -> Longueur 5 OK, mais Type KO
                                                                          | 12-34               | zipcode.negneg.z009@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | United States          |
                                                                          # Espace au milieu (12 34) -> Longueur 5 OK, mais Type KO
                                                                          | 12 34               | zipcode.negneg.z010@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | United States          |
                                                                          # Champ Vide
                                                                          |                     | zipcode.negneg.z011@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 0612345678          | 1        | January    | 2000      | United States          |

                                                                          # ====================================================================================
                                                                              # FOCUS : MOBILE NUMBER
                                                                              # Règle Longueur : Strictement 10 chiffres.
                                                                              # Règle Contenu : Chiffres uniquement (0-9).
                                                                              # Point Critique : Doit accepter le "0" au début (String, pas Integer).
                                                                              # Golden Data : Country=India, Zip=12345, etc.
                                                                              # ====================================================================================

                                                                              @Mobile @2BVA @Valid
                                                                              Examples: # Cas Valides (Longueur Exacte 10)
                                                                                | phoneNumberInfoInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                                                # Cas Critique : Commence par Zéro (Vérification du Type String)
                                                                                | 0612345678          | mobile.bva.m001@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 1        | January    | 2000      | India                  |
                                                                                # Cas Standard : Ne commence pas par zéro
                                                                                | 9876543210          | mobile.bva.m002@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 1        | January    | 2000      | India                  |
                                                                                # Cas Limite : Chiffres identiques (Souvent testé pour éviter les faux numéros)
                                                                                | 1111111111          | mobile.bva.m003@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 1        | January    | 2000      | India                  |

                                                                              @Mobile @EP @Valid
                                                                              Examples: # Partitions Valides (Formats et Patterns)
                                                                                | phoneNumberInfoInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                                                # Numéro commençant par 5 (Vérifie différents préfixes)
                                                                                | 5551234567          | mobile.ep.m011@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 1        | January    | 2000      | India                  |
                                                                                # Numéro avec pattern mixte
                                                                                | 1234509876          | mobile.ep.m012@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 1        | January    | 2000      | India                  |
                                                                                # Tous zéros sauf le dernier (Pattern limite)
                                                                                | 0000000001          | mobile.ep.m013@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 1        | January    | 2000      | India                  |

                                                                              @Mobile @3BVA @Invalid
                                                                              Examples: # Bornes Invalides (Longueur != 10)
                                                                                | phoneNumberInfoInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                                                # Trop court (Min-1 = 9 chiffres) -> "123456789"
                                                                                | 123456789           | mobile.bvainv.m004@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 1        | January    | 2000      | India                  |
                                                                                # Trop long (Max+1 = 11 chiffres) -> "01234567891"
                                                                                | 01234567891         | mobile.bvainv.m005@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 1        | January    | 2000      | India                  |

                                                                              @Mobile @Negative @Invalid
                                                                              Examples: # Types Invalides (Caractères non-numériques)
                                                                                | phoneNumberInfoInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                                                # Mélange Chiffres et Lettres (Longueur 10, mais Contenu invalide)
                                                                                | 061234567A          | mobile.negneg.m006@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 1        | January    | 2000      | India                  |
                                                                                # Format avec Tirets (Souvent rejeté si seule la valeur brute est acceptée)
                                                                                | 06-1234567          | mobile.negneg.m007@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 1        | January    | 2000      | India                  |
                                                                                # Format avec Espaces
                                                                                | 06 12 34 56         | mobile.negneg.m008@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 1        | January    | 2000      | India                  |
                                                                                # Caractères spéciaux (Ex: Indicatif + sans chiffres derrière suffisant)
                                                                                | +33612345           | mobile.negneg.m009@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 1        | January    | 2000      | India                  |
                                                                                # Champ Vide (Requis)
                                                                                |                     | mobile.negneg.m010@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | 123 Main St     | NY               | NYC             | 12345               | 1        | January    | 2000      | India                  |

                                                                                # ====================================================================================
                                                                                    # FOCUS : ADDRESS (Adresse Postale)
                                                                                    # Type : Texte Libre (Multi-format)
                                                                                    # Règles : Alphanumérique + Symboles courants (#, /, ., , -). Longueur [5, 100].
                                                                                    # Golden Data : Zip=12345, Mobile=0612345678, etc.
                                                                                    # ====================================================================================

                                                                                    @Address @2BVA @Valid
                                                                                    Examples: # Bornes Valides (Longueur Min et Max)
                                                                                      | addressInfoInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                                                      # Borne Min (5 caractères) -> "1 A St"
                                                                                      | 1 A St          | addr.bva.a001@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | United States          |
                                                                                      # Borne Max (100 caractères) -> Chaîne générée
                                                                                      | ThisAddressLineIsExactlyOneHundredCharactersLongToTestTheDatabaseLimitAndEnsureNoTruncationOccurs123 | addr.bva.a002@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | United States          |

                                                                                    @Address @EP @Valid
                                                                                    Examples: # Partitions Valides (Complexité des caractères)
                                                                                      | addressInfoInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                                                      # Standard Alphanumérique
                                                                                      | 123 Main Street | addr.ep.a003@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | United States          |
                                                                                      # Avec Symboles d'appartement (Hashtag, Slash, Virgule)
                                                                                      | Apt #42, Bld A/B| addr.ep.a004@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | United States          |
                                                                                      # Avec Point et Tiret
                                                                                      | 12 St. John-Paul| addr.ep.a005@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | United States          |

                                                                                    @Address @3BVA @Invalid
                                                                                    Examples: # Bornes Invalides (Longueur)
                                                                                      | addressInfoInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                                                      # Trop court (Min-1 = 4 caractères) -> "1 St"
                                                                                      | 1 St            | addr.bvainv.a006@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | United States          |
                                                                                      # Trop long (Max+1 = 101 caractères)
                                                                                      | ThisAddressLineIsExactlyOneHundredCharactersLongToTestTheDatabaseLimitAndEnsureNoTruncationOccurs123X| addr.bvainv.a007@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | United States          |

                                                                                    @Address @Negative @Invalid
                                                                                    Examples: # Types Invalides (Vide, Whitespace)
                                                                                      | addressInfoInfo | Email         | UserName   | gender | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
                                                                                      # Champ Vide (Requis)
                                                                                      |                 | addr.negneg.a008@secure.validation.complex21 | GoldenUser | Male   | Pass1234 | John                | Doe                | TestCorp               | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | United States          |
                                                                                      # Espaces uniquement (Bypass de la validation "Required")
                                                                                      |                 | addr.negneg.a009@secure.validation.complex21 | GoldenUser | Female | Pass1234 | John                | Doe                | TestCorp               | NY               | NYC             | 12345               | 0612345678          | 1        | January    | 2000      | United States          |

