public with sharing class FiftyScheduleCallClass implements Schedulable {

    public void execute (SchedulableContext ctx) {
        FiftyCalloutToBankService.calloutToBank();
    }

}

//Anonymous apex for post instll class to initiate Schedulable job

    // ScheduleCallClass scheduleCallToBank = new ScheduleCallClass();
    // String sch = '0 * * * *';
    // String jobID = System.schedule('Schedulable call to bank', sch, scheduleCallToBank);
