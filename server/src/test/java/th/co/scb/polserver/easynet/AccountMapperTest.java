package th.co.scb.polserver.easynet;

import org.junit.Test;
import th.co.scb.polserver.core.Account;

import static org.assertj.core.api.Assertions.assertThat;

public class AccountMapperTest {

    @Test
    public void shouldMapEasyNetAccountToAccount() {
        EasyNetUser user = new EasyNetUser("userid", "123", "2");
        EasyNetAccount[] easyNetAccount = new EasyNetAccount[]{
                new EasyNetAccount(" 123;1,259,353.93;+;1,259,353.93;+;0.00;+;0.00;+;0.00;+;0.00;+;0.00;+;2,883.63;+;27/03/2015;17/09/2014;นางสาว ทดสอบ ทดสอบ;;000;;;1;101;+2,000,000.0")
        };
        Account expectedAccount = new Account("", "Savings", "123", "", 1259353.93);

        Account[] actualAccounts = new AccountMapper().mapAccount(user, easyNetAccount);

        assertThat(actualAccounts[0]).isEqualToComparingFieldByField(expectedAccount);
    }

}
