import io.appium.java_client.AppiumDriver;
import io.appium.java_client.ios.IOSDriver;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.net.MalformedURLException;
import java.net.URL;

public class PolDriver {
    public static final int WAIT_IN_SECONDS = 30;
    public static final int INTERVAL_IN_MILLIS = 1000;

//    private static final String APP_HOME = System.getenv("HOME") + "/LoginViewExample.app";
    private static final String APP_HOME = "";

    private AppiumDriver driver;

    private URL getUrl(String str) {
        URL url = null;
        try {
            url = new URL(str);
        } catch (MalformedURLException e) {
        }
        return url;
    }

    private AppiumDriver getDriver() {
        if (driver == null) {
            DesiredCapabilities capabilities = new DesiredCapabilities();
            capabilities.setCapability("platformName", "iOS");
            capabilities.setCapability("platformVersion", "8.2");
            capabilities.setCapability("deviceName", "iPhone 6");
            capabilities.setCapability("app", APP_HOME);
            driver = new IOSDriver(getUrl("http://127.0.0.1:4723/wd/hub"), capabilities);
        }
        return driver;
    }

    public WebElement findElementByAccessibilityLabel(final String label) {
        WebDriverWait wait = new WebDriverWait(getDriver(), WAIT_IN_SECONDS, INTERVAL_IN_MILLIS);
        try {
            wait.until(new ExpectedCondition<Object>() {
                @Override
                public Object apply(WebDriver input) {
                    return driver.findElementByAccessibilityId(label);
                }
            });
        } catch(TimeoutException te) {
            return null;
        }
        return driver.findElementByAccessibilityId(label);
    }

    public void quit() {
        getDriver().quit();
    }
}

