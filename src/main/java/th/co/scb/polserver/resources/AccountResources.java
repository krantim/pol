package th.co.scb.polserver.resources;

import th.co.scb.polserver.core.Account;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by bon on 4/8/2015 AD.
 */

@Path("/users")
@Produces(MediaType.APPLICATION_JSON)
public class AccountResources {

    @Path("/{userId}/accounts")
    @GET
    public List<Account> getAllAccounts(@PathParam("userId") String userId) {
        List<Account> lstAccount = new ArrayList<Account>();
        lstAccount.add(new Account("aaa", "Saving", "12345"));

        return lstAccount;
    }
}
