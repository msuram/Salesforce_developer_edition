@isTest
Private class CustomerTriggerTest {
  static testmethod void myUnitTest()
  {
    //Create the data  
    apex_customer__c objCust = new Apex_customer__c();
    objCust.Name='Test Customer';
    insert objCust;
      
    //start the test
    Test.startTest();
    objCust.APEX_Customer_Status__c ='Pending'; 
    update objCust;
    test.stoptest();
      
    //see if our expected result is equal to the actual result;
    List<apex_invoice__c> invoiceList = [select id,Apex_customer__C from Apex_invoice__c where apex_customer__c=:objCust.Id];
    System.assertEquals(1, invoiceList.size()); 
  }
}