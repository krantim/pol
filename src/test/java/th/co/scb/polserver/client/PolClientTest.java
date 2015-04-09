package th.co.scb.polserver.client;

import org.apache.http.*;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.junit.Test;
import th.co.scb.polserver.StubObject;
import th.co.scb.polserver.utils.Utils;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.junit.Assert.assertThat;
import static org.mockito.Matchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * Created by bon on 4/9/2015 AD.
 */
public class PolClientTest {

    @Test
    public void shouldDeserializeResponseFromExternalService() throws Exception {
        HttpClient mockClient = mock(HttpClient.class);
        HttpResponse mockResponse = Utils.createHttpResponseWithBody("{\"value\":\"blah\"}");
        when(mockClient.execute(any(HttpGet.class))).thenReturn(mockResponse);

        POLClient client = new POLClient(mockClient);
        StubObject result = (StubObject) client.fetchJson("url", StubObject.class);
        assertThat(result.getValue(), equalTo("blah"));
    }

}

