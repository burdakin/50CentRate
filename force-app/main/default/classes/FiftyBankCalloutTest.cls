@isTest
public with sharing class FiftyBankCalloutTest {
    @isTest
    public static void BankCalloutTest() {
        FiftyTestDataFactory.createCustomSettingData();
        Test.setMock(HttpCalloutMock.class, new FiftyCalloutToBankServiceMock());
        Integer counter = 0;
        Test.startTest();
        FiftyCalloutToBankService.calloutToBank();
        counter++;
        Test.stopTest();
        
        System.assertEquals(1, counter, 'Callout Failed. Check developers console');
    }
}
