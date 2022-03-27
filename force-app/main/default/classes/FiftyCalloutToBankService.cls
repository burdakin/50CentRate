public with sharing class FiftyCalloutToBankService {
    @Future(callout=true)
    public static void calloutToBank() {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://api.exchangeratesapi.io/v1/latest?access_key=cfa55f41071f8ad5b4aa1c30f87daab5&symbols=USD,RUB&format=1');
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        if (res.getStatusCode() == 200) {
            wrapResponse incomingResult = (wrapResponse)JSON.deserialize(res.getBody(), wrapResponse.class);
            Double rouble = incomingResult.rates.get('RUB');
            Double dollar = incomingResult.rates.get('USD');
            Double price = rouble - ((rouble / 100) * ((dollar * 100) - 100));
            priceOfFifty__c cs = [SELECT Id, Name, PriceTag__c, OldPriceTag__c FROM priceOfFifty__c LIMIT 1];
            cs.OldPriceTag__c = cs.PriceTag__c;
            cs.PriceTag__c = price/2;
            update cs;
        }
    }

    public class wrapResponse {
        public String base;
        public String dates;
        public Map<String, Double> rates = new Map<String, Double>();
        public Boolean success;
        public Integer timestamp;
    }
}
