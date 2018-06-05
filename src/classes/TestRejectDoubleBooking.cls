@isTest
public class TestRejectDoubleBooking {
//check for good scenario
static Testmethod void TestingBooking(){
  Datetime now= System.now();
  Speaker__C speaker = new Speaker__c(First_Name__C='hermoine',Last_Name__c='granger',email__c='suram.mounika@gmail.com');
  insert speaker;
  Session__c session = new Session__c(Name='The Wizarding WildCrafts',level__c='Advanced',Session_date__c=now);  
  insert session;
    
  Session_Speaker__c assignment = new Session_Speaker__C(session__c= session.Id,speaker__c=speaker.Id);
  Test.startTest();
    Database.SaveResult result= Database.insert(assignment,false);
    Test.stopTest();
    system.assert(result.isSuccess());
} 
    
static Testmethod void TestDoubleBooking(){
  Datetime now= System.now();
  Speaker__C speaker = new Speaker__c(First_Name__C='chimp',Last_Name__c='hollister');
  insert speaker;
  Session__c session = new Session__c(Name='Mental Mazda',level__c='Advanced',Session_date__c=now);  
  insert session;
  Session__c session2 = new Session__c(Name='Mental Mazda Again',level__c='Advanced',Session_date__c=now);  
  insert session2;
    
  Session_Speaker__c assignment = new Session_Speaker__C(session__c= session.Id,speaker__c=speaker.Id);
  insert assignment;  
  Session_Speaker__c assignment2 = new Session_Speaker__C(session__c= session2.Id,speaker__c=speaker.Id);
    
  //bad scenario  
    Test.startTest();
    Database.SaveResult result= Database.insert(assignment2,false);
    Test.stopTest();
    system.assert(!result.isSuccess());
}    
}