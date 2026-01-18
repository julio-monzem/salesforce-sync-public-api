public with sharing class WeatherService {
    @AuraEnabled
    public static Weather__c fetchAndSaveWeather(String city) {
        OpenWeatherClient.WeatherResponse response =
            OpenWeatherClient.fetchCurrentWeather(city);

        Weather__c weather = new Weather__c(
            City__c = response.name,
            Country__c = response.sys.country,
            Temperature__c = response.main.temp,
            FeelsLike__c = response.main.feels_like,
            Humidity__c = response.main.humidity,
            Condition__c = response.weather[0].description,
            ConditionCode__c = String.valueOf(response.weather[0].id),
            CollectedAt__c = System.now(),
            Source__c = 'OpenWeather'
        );

        insert weather;
        return weather;
    }

    public static void syncDefaultCities() {
        List<String> cities = new List<String>{
            'São Paulo', 'Rio de Janeiro', 'Belo Horizonte'
        };

        for (String city : cities) {
            fetchAndSaveWeather(city);
        }
    }
}