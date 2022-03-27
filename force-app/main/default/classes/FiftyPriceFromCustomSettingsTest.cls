@isTest
public with sharing class FiftyPriceFromCustomSettingsTest {
    @isTest
    public static void PriceFromCustomSettingsTest() {
        FiftyTestDataFactory.createCustomSettingData();
        Test.startTest();
        List<Double> result = FiftyPriceFromCustomSettings.callToCS();
        Test.stopTest();

        System.assertEquals(10, result[0], 'Something went wrong');
        System.assertEquals(15, result[1], 'Something went wrong');
    }
}
