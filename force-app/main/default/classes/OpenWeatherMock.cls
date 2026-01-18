@IsTest
global class OpenWeatherMock implements HttpCalloutMock {

    global HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setBody(
            '{"name":"São Paulo","sys":{"country":"BR"},' +
            '"main":{"temp":25.5,"feels_like":26.1,"humidity":70},' +
            '"weather":[{"id":800,"description":"clear sky"}]}'
        );
        return res;
    }
}
