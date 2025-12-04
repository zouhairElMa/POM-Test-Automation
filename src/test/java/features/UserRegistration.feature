#Feature: User Registration
#
#    Scenario Outline: User Registration
#        Given the user in the Home/Login Page
#        When i Click on Resgister Link
#        And i Fill the "<UserName>", "<Email>"
#        And Move to the Next Page Registration
#        And The user in Registration Page
#        And i Fill All the Registration Form "<password>", "<firstNameAdressInfo>", "<lastNameAdressInfo>", "<companyAddressInfoInfo>", "<addressInfoInfo>", "<stateAddressInfo>", "<cityAddressInfo>", "<postcodeAddressInfo>", "<phoneNumberInfoInfo>", "<birthday>", "<birthMonth>", "<birthYear>", "<countryInfoInfoDropBox>"
#        And i Click on Registration Button
#        Then Get the Succesful Registration Page
#
#    Examples:
#    | Email           | UserName  | password | firstNameAdressInfo | lastNameAdressInfo | companyAddressInfoInfo | addressInfoInfo | stateAddressInfo | cityAddressInfo | postcodeAddressInfo | phoneNumberInfoInfo | birthday | birthMonth | birthYear | countryInfoInfoDropBox |
#    | oe28Ss1aoe@gmail.com | oko@fkef | lkdl;    | plpdls              | dfsfds             | lksdlksdl              | kdskds          | ;l;lsa           | ijasijsa        | 8456464             | 06584845448         | 2        | January    | 1929      | India                  |
#    | wls7Adaw@okefe.cowd   | okwdokwpl | 56454sd@;| pl54wdls              | l,kds  54           | lkds834$              | skjdk84(          | ;l;kh@           | lkjsad@;kj9d)        | 87@87s             | 06548as454q         | 10        | January    | 2000      | India        |
#    | dwl7aSdee@kfje.com | kodekodke | kls5wq@,;| sdd8ss              | dfsfds   sd          | lkds/;wke2              | kdskds          | ;l;lskad9875           | kljsdd*&/        | 5a4s1*             | +212 654 5454 654         | 30        | January    | 2008      | India |
