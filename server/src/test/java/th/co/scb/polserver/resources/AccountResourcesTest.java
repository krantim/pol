package th.co.scb.polserver.resources;

import org.junit.Test;
import th.co.scb.polserver.client.POLClient;
import th.co.scb.polserver.core.Account;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Matchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * Created by bon on 4/8/2015 AD.
 */
public class AccountResourcesTest {

    @Test
    public void shouldReturnAccountList() throws Exception {
        POLClient mockClient = mock(POLClient.class);
        final Account account = new Account("aaa", "Saving", "12345", "Active");
        Account[] expectedAccounts = new Account[]{account};

        when(mockClient.fetchJson(any(String.class), any(Class.class))).thenReturn(expectedAccounts);

        List<Account> actualAccounts = new AccountResources(mockClient).getAllAccounts("blah");
        assertThat(actualAccounts.get(0)).isEqualTo(account);
    }
}
