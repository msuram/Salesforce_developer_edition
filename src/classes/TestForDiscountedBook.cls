@isTest
private class TestForDiscountedBook 
{
  static testMethod void validateDiscount()
  {
      Book__c b=new Book__c(Name='Salesforce',Price__c=100);
      System.debug('Price before inserting new book:'+b.Price__c);
 
      insert b;    
      
      
      b=[select Price__c from Book__c where ID=:b.Id];
     System.assertEquals(90,b.Price__c);
     
  
  }
}