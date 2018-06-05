trigger CustomerAfterInsertTrigger on APEX_Customer__c (after update) {

  CustomerTriggerHelper.createinvoicerecords(Trigger.new,trigger.oldMap);

}