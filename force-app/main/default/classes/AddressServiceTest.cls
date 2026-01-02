@IsTest
private class AddressServiceTest {
    @IsTest
    static void testSearchAndSave() {
        Test.setMock(HttpCalloutMock.class, new ViaCepMock());

        Test.startTest();
        Address__c result =
            AddressService.searchAndSave('01001000');
        Test.stopTest();

        System.assertNotEquals(null, result.Id);
        System.assertEquals('São Paulo', result.City__c);
        System.assertEquals('SP', result.State__c);
    }
}
