package th.co.scb.polserver.resources;

import org.junit.Ignore;
import org.junit.Test;
import th.co.scb.polserver.client.POLClient;
import th.co.scb.polserver.core.Account;
import th.co.scb.polserver.easynet.AccountMapper;
import th.co.scb.polserver.easynet.EasyNetAccount;
import th.co.scb.polserver.easynet.EasyNetUser;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Matchers.any;
import static org.mockito.Matchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * Created by bon on 4/8/2015 AD.
 */
public class AccountResourceTest {


    @Test
    public void shouldReturnAllUserAccounts() throws Exception {
        POLClient mockClient = mock(POLClient.class);
        AccountMapper mockMapper = mock(AccountMapper.class);

        final Account account = new Account("", "Saving", "12345", "", 0);

        EasyNetUser easyNetUser = new EasyNetUser("userid", "12345","2");
        EasyNetAccount[] easyNetAccounts = new EasyNetAccount[]{
                new EasyNetAccount(" 123;1,259,353.93;+;1,259,353.93;+;0.00;+;0.00;+;0.00;+;0.00;+;0.00;+;2,883.63;+;27/03/2015;17/09/2014;นางสาว ทดสอบ ทดสอบ;;000;;;1;101;+2,000,000.0")
        };

        when(mockClient.fetchJson(eq("login"), any(Class.class))).thenReturn(easyNetUser);
        when(mockClient.fetchJson(eq("account"), any(Class.class))).thenReturn(easyNetAccounts);
        when(mockMapper.mapAccount(any(EasyNetUser.class), any(EasyNetAccount[].class))).thenReturn(new Account[]{account});

        List<Account> actualAccounts = new AccountResource(mockClient, mockMapper).getAllAccounts("userid");
        assertThat(actualAccounts.get(0)).isEqualTo(account);
    }
}
