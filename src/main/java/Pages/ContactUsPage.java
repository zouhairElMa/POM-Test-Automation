package Pages;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class ContactUsPage extends PageBase {

    public ContactUsPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(name = "name")
    WebElement ContactUsNameInput;
    @FindBy(name = "email")
    WebElement ContactUsEmailInput;
    @FindBy(name = "subject")
    WebElement ContactUsSubjectInput;
    @FindBy(name = "message")
    WebElement ContactUsMessageInput;
    @FindBy(name = "upload_file")
    WebElement ContactUsUploadFileInput;
    @FindBy(name = "submit")
    WebElement ContactUsSubmitButton;
    @FindBy(css = "div.status.alert.alert-success")
    WebElement ContactUsSuccessMessage;

    public void FillContactUsForm(String name, String email, String subject, String message, String filePath)
    {
        SendKeys(ContactUsNameInput, name);
        SendKeys(ContactUsEmailInput, email);
        SendKeys(ContactUsSubjectInput, subject);
        SendKeys(ContactUsMessageInput, message);
        SendKeys(ContactUsUploadFileInput, filePath);
    }

    public void SubmitContactUsForm(){
        click(ContactUsSubmitButton);
    }

    public void AssertContactUsSuccessMessage(String expectedText){
        AssertionElement(ContactUsSuccessMessage, expectedText);
    }
}
