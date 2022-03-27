public class FiftyPriceFromCustomSettings {
    @AuraEnabled (cacheable=true)
    public static List<Double> callToCS() {
        priceOfFifty__c cs = [SELECT Id, Name, PriceTag__c, OldPriceTag__c FROM priceOfFifty__c LIMIT 1];
        List<Double> result = new List<Double>();
        result.add(Math.round(cs.PriceTag__c));
        result.add(Math.round(cs.OldPriceTag__c));
        return result;
    }
}
