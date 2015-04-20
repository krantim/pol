package th.co.scb.polserver.client;


import com.fasterxml.jackson.databind.ObjectMapper;
import io.dropwizard.jackson.Jackson;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.util.EntityUtils;

import java.io.*;

/**
 * Created by bon on 4/9/2015 AD.
 */
public class POLClient {

    private HttpClient httpClient;
    private final String EASY_NET_HOST;

    public POLClient(HttpClient httpClient, String host) {
        this.httpClient = httpClient;
        this.EASY_NET_HOST = host;
    }

    public Object fetch(String path, Class clazz) {
        try {
            String url = EASY_NET_HOST + "/" + path;
            HttpResponse response = httpClient.execute(new HttpGet(url));
            String content = EntityUtils.toString(response.getEntity());
            final ObjectMapper MAPPER = Jackson.newObjectMapper();
            Object parsedObject = MAPPER.readValue(content, clazz);
            return parsedObject;
        } catch (IOException ioe) {
            ioe.printStackTrace();
            //TODO error handling
        }
        return null;
    }
}
