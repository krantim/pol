package th.co.scb.polserver.resources;

import th.co.scb.polserver.client.POLClient;
import th.co.scb.polserver.configuration.EasyNetEndpoints;
import th.co.scb.polserver.core.Account;
import th.co.scb.polserver.easynet.AccountMapper;
import th.co.scb.polserver.easynet.EasyNetAccount;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 * Created by bon on 4/8/2015 AD.
 */

@Path("/users")
@Produces(MediaType.APPLICATION_JSON)
public class AccountResource {

    private final EasyNetEndpoints endpoints;
    private final POLClient client;
    private final AccountMapper mapper;

    public AccountResource(POLClient client, AccountMapper mapper, EasyNetEndpoints endpoints) {
        this.client = client;
        this.mapper = mapper;
        this.endpoints = endpoints;
    }

    @Path("/{userId}/accounts/{accountNumber}")
    @GET
    public Account getAccountDetail(@PathParam("userId") String userId, @PathParam("accountNumber") String accountNumber) {
        String fetchUrl = endpoints.getAccountUrl() + "/" + accountNumber;
        EasyNetAccount easyNetAccount = (EasyNetAccount) client.fetch(fetchUrl, EasyNetAccount.class);
        Account account = mapper.mapAccount(easyNetAccount);
        return account;
    }

}
