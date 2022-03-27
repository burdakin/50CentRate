@isTest
public with sharing class FiftyCalloutToBankServiceMockTest {
    @isTest
    public static void CalloutToBankServiceMockTest() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://api.exchangeratesapi.io/v1/latest?access_key=cfa55f41071f8ad5b4aa1c30f87daab5&symbols=USD,RUB&format=1');
        req.setMethod('GET');
        Test.setMock(HttpCalloutMock.class, new FiftyCalloutToBankServiceMock());
        Test.startTest();
        FiftyCalloutToBankServiceMock c = new FiftyCalloutToBankServiceMock();
        HTTPResponse result = c.respond(req);
        Test.stopTest();

        System.assertNotEquals(null, result);
    }
}
