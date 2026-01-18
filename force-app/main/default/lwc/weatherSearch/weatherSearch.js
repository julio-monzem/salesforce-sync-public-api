import { LightningElement, track } from 'lwc';
import getWeatherByCity from '@salesforce/apex/WeatherService.getWeatherByCity';

export default class WeatherSearch extends LightningElement {
    city;
    @track weather;

    handleChange(event) {
        this.city = event.target.value;
    }

    handleSearch() {
        getWeatherByCity({ city: this.city })
            .then(result => {
                this.weather = result;
            })
            .catch(error => {
                console.error(error);
            });
    }
}
