@IsTest
private class WeatherServiceTest {

    @IsTest
    static void testFetchAndSaveWeather() {
        Test.setMock(HttpCalloutMock.class, new OpenWeatherMock());

        Test.startTest();
        Weather__c result =
            WeatherService.fetchAndSaveWeather('São Paulo');
        Test.stopTest();

        System.assertEquals('São Paulo', result.City__c);
        System.assertEquals(25.5, result.Temperature__c);
        System.assertEquals('BR', result.Country__c);
    }
}
