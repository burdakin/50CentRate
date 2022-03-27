@isTest
public with sharing class FiftyScheduleCallClassTest {
    public static final String CRON_EXP = '0 0 0 15 3 ? 2032';
    @isTest
    public static void ScheduleCallClassTest() {
        FiftyTestDataFactory.createCustomSettingData();
        Test.setMock(HttpCalloutMock.class, new FiftyCalloutToBankServiceMock());
        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new FiftyScheduleCallClass());
        Test.stopTest();

        System.assertNotEquals(null, jobId, 'Schedule was not initiated');
    }
}
