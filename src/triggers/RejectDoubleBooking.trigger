trigger RejectDoubleBooking on Session_Speaker__c (before insert,before update) {
     
 for (session_speaker__c newObj:trigger.new)
 {
     session__c session= [select id,Session_Date__C from session__c where Id =:newObj.session__c];
     List<session_speaker__c> conflicts = [select id from session_speaker__c where speaker__c= :newObj.Speaker__c AND session__r.session_date__c=:session.Session_Date__c];
     if(!conflicts.isEmpty())
     {
         newObj.addError('The speaker is already booked for that time');
     }
 }
    
}