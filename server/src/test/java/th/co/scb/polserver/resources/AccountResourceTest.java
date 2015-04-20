package th.co.scb.polserver.resources;

import org.junit.Test;
import th.co.scb.polserver.client.POLClient;
import th.co.scb.polserver.core.Account;
import th.co.scb.polserver.easynet.AccountMapper;
import th.co.scb.polserver.easynet.EasyNetAccount;

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
    public void shouldReturnDetailForGivenAccount() throws Exception {
        Account expectedAccount = new Account("123", 123.00);

        POLClient mockClient = mock(POLClient.class);
        EasyNetAccount mockEasyNetResponse = new EasyNetAccount(" 123;123.00;+;123.00;+;0.00;+;0.00;+;0.00;+;0.00;+;0.00;+;2,883.63;+;27/03/2015;17/09/2014;นางสาว ทดสอบ ทดสอบ;;000;;;1;101;+2,000,000.0");
        when(mockClient.fetch(eq("account/123"), any(Class.class))).thenReturn(mockEasyNetResponse);

        AccountMapper mockMapper = mock(AccountMapper.class);
        when(mockMapper.mapAccount(eq(mockEasyNetResponse))).thenReturn(expectedAccount);

        Account actualAccount = new AccountResource(mockClient, mockMapper).getAccountDetail("userid", "123");
        assertThat(actualAccount).isEqualToComparingFieldByField(expectedAccount);
    }
}
