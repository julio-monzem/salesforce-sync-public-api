public with sharing class OpenWeatherClient {
    
     public static WeatherResponse fetchCurrentWeather(String city) {
        validateCity(city);

        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(
            'callout:OpenWeather_API/weather?q=' +
            EncodingUtil.urlEncode(city, 'UTF-8') +
            '&units=metric'
        );

        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() != 200) {
            throw new CalloutException(
                'OpenWeather error: ' + res.getBody()
            );
        }

        return (WeatherResponse) JSON.deserialize(
            res.getBody(),
            WeatherResponse.class
        );
    }

    private static void validateCity(String city) {
        if (String.isBlank(city)) {
            throw new IllegalArgumentException('City is required');
        }
    }

    // ===== DTOs =====
    public class WeatherResponse {
        public List<WeatherInfo> weather;
        public MainInfo main;
        public SysInfo sys;
        public String name;
    }

    public class WeatherInfo {
        public String main;
        public String description;
        public String icon;
        public Integer id;
    }

    public class MainInfo {
        public Decimal temp;
        public Decimal feels_like;
        public Integer humidity;
    }

    public class SysInfo {
        public String country;
    }

}