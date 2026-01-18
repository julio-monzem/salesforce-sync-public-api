global class WeatherSyncScheduler implements Schedulable{
    global void execute(SchedulableContext sc) {
        WeatherService.syncDefaultCities();
    }
}