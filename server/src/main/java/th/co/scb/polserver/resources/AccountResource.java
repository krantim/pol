package th.co.scb.polserver.resources;

import th.co.scb.polserver.client.POLClient;
import th.co.scb.polserver.core.Account;
import th.co.scb.polserver.easynet.AccountMapper;
import th.co.scb.polserver.easynet.EasyNetAccount;
import th.co.scb.polserver.easynet.EasyNetUser;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.Arrays;
import java.util.List;

/**
 * Created by bon on 4/8/2015 AD.
 */

@Path("/users")
@Produces(MediaType.APPLICATION_JSON)
public class AccountResource {

    private static final String ACCOUNT_URL = "account";
    private final POLClient client;
    private final AccountMapper mapper;

    public AccountResource(POLClient client, AccountMapper mapper) {
        this.client = client;
        this.mapper = mapper;
    }

    @Path("/{userId}/accounts")
    @GET
    public List<Account> getAllAccounts(@PathParam("userId") String userId) {
        EasyNetUser user = (EasyNetUser) client.fetchJson("login?username=" + userId, EasyNetUser.class);
        EasyNetAccount[] easyNetAccounts = (EasyNetAccount[]) client.fetchJson(ACCOUNT_URL, EasyNetAccount[].class);

        Account[] accounts = mapper.mapAccount(user, easyNetAccounts);
        return Arrays.asList(accounts);
    }
}
