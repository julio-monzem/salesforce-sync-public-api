import { LightningElement, track } from 'lwc';
import searchAndSave from '@salesforce/apex/AddressService.searchAndSave';

export default class AddressSearch extends LightningElement {
    cep;
    @track address;

    handleChange(event) {
        this.cep = event.target.value;
    }

    handleSearch() {
        searchAndSave({ cep: this.cep })
            .then(result => {
                this.address = result;
            })
            .catch(error => {
                console.error(error);
            });
    }

}