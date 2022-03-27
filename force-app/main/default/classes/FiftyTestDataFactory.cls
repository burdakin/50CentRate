@isTest
public with sharing class FiftyTestDataFactory {
    @isTest
    public static void createCustomSettingData() {
        priceOfFifty__c pof = new priceOfFifty__c();
        pof.Name = 'Test';
        pof.PriceTag__c = 10;
        pof.OldPriceTag__c = 15;
        insert pof;
    }
}
