import org.junit.*;

public class BalanceTest {
    BalanceDriver driver;

    @Before
    public void setUp() {
        driver = new BalanceDriver();
    }

    @Ignore("To be implemented: our first UI test!")
    @Test
    public void shouldDoSomething() {
        Assert.fail();
    }

    @After
    public void tearDown() {
        driver.quit();
    }
}
