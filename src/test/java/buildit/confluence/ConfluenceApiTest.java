//package buildit.confluence;
//
//import buildit.ComponentFactory;
//import buildit.confluence.domain.*;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import okhttp3.OkHttpClient;
//import org.junit.Before;
//import org.junit.Test;
//import retrofit2.Response;
//import retrofit2.Retrofit;
//
//import java.io.IOException;
//
//public class ConfluenceApiTest {
//
//    ConfluenceApi confluenceApi;
//
//    @Before
//    public void setUp() throws Exception {
//        final ComponentFactory.BasicAuthInterceptor basicAuthInterceptor = ComponentFactory.basicAuthInterceptor("api-account", "admin");
//        final OkHttpClient okHttpClient = ComponentFactory.okHttpClient(basicAuthInterceptor, 3000, 3000);
//        final ObjectMapper objectMapper = ComponentFactory.objectMapper();
//        final Retrofit retrofit = ComponentFactory.retrofit(okHttpClient, objectMapper, "https://ricardoksl.atlassian.net/wiki/rest/api/");
//        confluenceApi = retrofit.create(ConfluenceApi.class);
//    }
//
//    @Test
//    public void testAuthorizationHeaderIsSent() throws IOException {
//        Response<SearchContentResults> response = confluenceApi.search("AC", "test").execute();
//        System.out.println(response.body());
//    }
//
//    @Test
//    public void testCreateContent() throws IOException {
//        Storage storage = new Storage.Builder()
//                .withRepresentation("wiki")
//                .withValue("h1. /products/\\{api\\} {children:all=true|style=h3}")
//                .build();
//
//        Content content = new Content.Builder()
//                .withType("page")
//                .withTitle("ricardo " + System.currentTimeMillis())
//                .withSpace(new Space.Builder().withKey("AC").build())
//                .withBody(new Body.Builder().withStorage(storage).build())
//                .build();
//
//        Response<Content> response = confluenceApi.create(content).execute();
//        System.out.println(response.errorBody().string());
//        System.out.println(response.body());
//    }
//
//}