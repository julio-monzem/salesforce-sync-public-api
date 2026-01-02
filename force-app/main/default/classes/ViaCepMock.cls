@IsTest
global class ViaCepMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setBody(
            '{"cep":"01001000","logradouro":"Praça da Sé","bairro":"Sé","localidade":"São Paulo","uf":"SP"}'
        );
        return res;
    }
}
