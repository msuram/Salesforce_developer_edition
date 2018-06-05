trigger SendConformationEmail on Session_Speaker__c (after insert) {
    for(session_speaker__c newObj:trigger.new)
    {
      session_speaker__C sessionSpeaker = [select session__r.Name,Session__r.session_date__c,
                                                   speaker__r.Last_name__c,Speaker__r.First_name__C,speaker__r.email__c from session_speaker__c where id=:newObj.id];
        if(sessionSpeaker.speaker__r.Email__C != null)
        {
            string address= sessionSpeaker.speaker__r.Email__C;
            string subject= 'Session Confirmation';
            String body= 'Dear'+sessionSpeaker.Speaker__r.First_name__c+''+sessionSpeaker.Speaker__r.Last_Name__c+'\nYour session is confirmed for'+
                          sessionSpeaker.Session__r.Session_Date__C+'is confirmed'+'\nThank you for speaking up';
            EmailManager.sendMail(address,subject,body);
        }
    }

}