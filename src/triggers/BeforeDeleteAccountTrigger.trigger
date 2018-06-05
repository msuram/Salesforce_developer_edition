trigger BeforeDeleteAccountTrigger on Account (before delete) {
  if(trigger.isBefore)
  {
    if(trigger.isDelete)
    {
       for(Account a :Trigger.old){
       if(a.Name !='okToDelete'){
         a.adderror('you cannot delete this record');
       } 
       }
    }
  }

}