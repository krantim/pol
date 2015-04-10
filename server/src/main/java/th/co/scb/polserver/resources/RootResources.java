package th.co.scb.polserver.resources;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.awt.*;

/**
 * Created by bon on 4/8/2015 AD.
 */

@Path("/")
@Produces(MediaType.APPLICATION_JSON)
public class RootResources {

    @Path("/")
    @GET
    public String root() {
        return "";
    }
}
