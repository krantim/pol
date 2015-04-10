package th.co.scb.polserver.utils;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ProtocolVersion;
import org.apache.http.entity.StringEntity;
import org.apache.http.message.BasicHttpResponse;
import org.apache.http.message.BasicStatusLine;

/**
 * Created by bon on 4/9/2015 AD.
 */
public class Utils {

    public static HttpResponse createHttpResponseWithBody(String body) throws Exception {
        HttpEntity entity = new StringEntity(body);
        HttpResponse httpResponse = new BasicHttpResponse(new BasicStatusLine(new ProtocolVersion("",0,0), 200, ""));
        httpResponse.setEntity(entity);
        return httpResponse;
    }

}
