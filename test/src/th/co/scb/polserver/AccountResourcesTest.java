package th.co.scb.polserver;

import static io.dropwizard.testing.FixtureHelpers.*;
import static org.assertj.core.api.Assertions.assertThat;
import com.fasterxml.jackson.databind.ObjectMapper;
import io.dropwizard.jackson.Jackson;
import org.junit.Test;
import th.co.scb.polserver.core.Account;

/**
 * Created by bon on 4/8/2015 AD.
 */
public class AccountResourcesTest {

        private static final ObjectMapper MAPPER = Jackson.newObjectMapper();

        @Test
        public void serializesToJSON() throws Exception {
            final Account account = new Account("aaa", "Saving", "12345");
            assertThat(MAPPER.writeValueAsString(account))
                    .isEqualTo(fixture("account.json"));
        }
}
