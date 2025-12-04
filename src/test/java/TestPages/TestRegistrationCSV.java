package TestPages;

import Pages.HomePage;
import Pages.UserRegistrationPages;
import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvValidationException;
import org.testng.annotations.Test;

import java.io.FileReader;
import java.io.IOException;

public class TestRegistrationCSV extends TestBase{
    HomePage homeObj;
    UserRegistrationPages userRegObj;
    // Cree un objet de CSVReader
    CSVReader reader;
    @Test
    public void testuserregistrationpages() throws IOException, CsvValidationException {
        // appeler le path de fichier CSV
        String CSV_File = System.getProperty("user.dir")+"\\src\\main\\resources\\Registration.csv";
        reader = new CSVReader(new FileReader(CSV_File));

        String[] csvCell;

        // while Loop will be execute the last value of CSV file

        while ((csvCell=reader.readNext()) != null){
            String userName = csvCell[0];
            String password = csvCell[1];
            String email = csvCell[2];
        }


        homeObj = new HomePage(driver);
        homeObj.OpenLoginRegistrationPage();
        userRegObj = new UserRegistrationPages(driver);
        userRegObj.SignUpUser("csdcs", "wikdsxdwok@fe.cow","dsfdsf");

        // RegistrationSteps

        userRegObj.CreateAccount(
                "dwdw",
                "dfdf",
                "fdf",
                "cxd",
                "fdsf",
                "dsfd",
                "dsfds",
                "fdsf",
                "0658412181",
                "1",
                "January",
                "1987",
                "India",
                "sdfdsf");
    }
}
