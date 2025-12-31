public with sharing class AddressService {
    
    @AuraEnabled
    public static Address__c searchAndSave(String cep) {
        ViaCepClient.ViaCepResponse apiResponse = ViaCepClient.fetchAddress(cep);

        Address__c address = new Address__c(
            CEP__c = apiResponse.cep,
            Street__c = apiResponse.logradouro,
            Neighborhood__c = apiResponse.bairro,
            City__c = apiResponse.localidade,
            State__c = apiResponse.uf,
            Source__c = 'ViaCEP'
        );

        insert address;
        return address;
    }

}