global class CustomerBatchProcessing implements database.Batchable<sobject>
{
    global String[] email= new String[] {'msuram@aceinfosolutions.com'};
    
    //start method
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
      return Database.getQueryLocator('select Id,Name,apex_customer_status__c,apex_customer_description__c from apex_customer__c where apex_active__c = true'); 
    }
    
   // Execute Method
    global void execute(Database.BatchableContext BC, list<sObject> scope)
    {
        List<apex_customer__C> customerList = new List<Apex_Customer__C>();
        for(sObject obj:scope)
        {
          Apex_customer__c newObj = (Apex_Customer__C)obj;
          newObj.Apex_Customer_Description__c = 'updated from the batch';  
          newObj.APEX_Customer_Status__c='Paid';
          customerList.add(newObj);
        }
        if(customerList != null &&  customerList.size() > 1 )
        {
           Database.Update(customerList); 
           System.debug('Records Updated Succesfully' + customerList); 
        }
    }
                                   
    //finish 
    Global void finish(database.BatchableContext BC) 
    {
       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
       AsyncApexJob a = [select a.TotalJobItems,a.Status,a.NumberOfErrors,a.JobType,a.JobItemsProcessed,
                         a.ExtendedStatus,a.CreatedById,a.CompletedDate from AsyncApexJob a where id =:BC.getJobId()];
       System.Debug('Job Id' + BC.getJobId()); 
        
       // to send an email 
       mail.setToAddresses(email);
       mail.setReplyTo('suram.mounika@gmail.com');
       mail.setSenderDisplayName('Apex batch Proceesing Module');
       mail.setPlaintextBody('The Batch Apex job processed');
       Messaging.sendEmail(new Messaging.SingleEmailMessage [] {mail});  
    }
}