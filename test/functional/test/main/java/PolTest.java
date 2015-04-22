import org.junit.*;
import org.junit.Assert;
import org.openqa.selenium.WebElement;

public class PolTest {
    PolDriver driver;

    @Before
    public void setUp() {
        driver = new PolDriver();
    }

    @Test
    public void shouldHaveAccountNumberLabel() {
        String expectAccountNumber = "XXX-XXX789-0";
        WebElement accountNumberLabel = driver.findElementByAccessibilityId("accountNumberLabel");
        String actualAccountNumber = accountNumberLabel.getText();
        Assert.assertEquals(expectAccountNumber, actualAccountNumber);
    }

    @After
    public void tearDown() {
        driver.quit();
    }
}
