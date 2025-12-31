public with sharing class ViaCepClient {
    
    public static ViaCepResponse fetchAddress(String cep) {
        validateCep(cep);

        HttpRequest request = new HttpRequest();
        Request.setMethod('GET');
        Request.setEndpoint('callout:ViaCEP_API/ws/' + cep + '/json/');

        Http http = new Http();
        HttpResponse response = http.send(request);

        if (response.getStatusCode() != 200) throw new CalloutException( 'ViaCEP error. Status: ' + response.getStatusCode());

        ViaCepResponse result = (ViaCepResponse) JSON.deserialize( response.getBody(), ViaCepResponse.class);

        if (result == null || result.uf == null) throw new CalloutException('Invalid CEP');

        return result;
    }

    private static void validateCep(String cep) {
        if (String.isBlank(cep) || cep.length() != 8) throw new IllegalArgumentException('CEP must contain 8 digits');
    }

    public class ViaCepResponse {
        public String cep;
        public String logradouro;
        public String complemento;
        public String bairro;
        public String localidade;
        public String uf;
    }
}