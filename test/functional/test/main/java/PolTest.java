import org.junit.*;

public class PolTest {
    PolDriver driver;

    @Before
    public void setUp() {
        driver = new PolDriver();
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
