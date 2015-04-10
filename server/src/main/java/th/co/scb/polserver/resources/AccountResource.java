package th.co.scb.polserver.resources;

import th.co.scb.polserver.client.POLClient;
import th.co.scb.polserver.core.Account;

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

    private static final String ACCOUNT_URL = "localhost:8081/account";
    private final POLClient client;

    public AccountResource(POLClient client) {
        this.client = client;
    }

    @Path("/{userId}/accounts")
    @GET
    public List<Account> getAllAccounts(@PathParam("userId") String userId) {
        Account[] accounts = (Account[]) client.fetchJson(ACCOUNT_URL, Account[].class);
        return Arrays.asList(accounts);
    }
}
