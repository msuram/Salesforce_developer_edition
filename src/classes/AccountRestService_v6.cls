// * Example request:
//{
//  "rw" :
//  {
//    "account" : 
//    { 
//      "Name" : "Salesforce.com",
//      "AccountNumber" : "1001",
//      "Website" : "www.salesforce.com"
//    },
//    "contactList" :
//    [
//      {"FirstName" : "Test", "LastName" : "O'Riley", "Email" : "testcontact1@salesforce.com"},
//      {"FirstName" : "Test", "LastName" : "Contact2", "Email" : "testcontact2@salesforce.com"},
//      {"FirstName" : "Test", "LastName" : "Contact3", "Email" : "testcontact3@salesforce.com"}
//    ]
//  }
//}
    
@RestResource(urlMapping='/v6/account/*')
global with sharing class AccountRestService_v6 {
    @HttpPost
    global static PostResponseWrapper CreateRecord(RequestWrapper rw){
        PostResponseWrapper postResponse= new PostResponseWrapper();
        if(rw!= null) {
           insert rw.account;
           postResponse.acct= rw.account;
            for(Contact contact:rw.contactList) {
                contact.AccountId=rw.account.Id;
                }
           insert rw.contactList; 
           postResponse.contactList=rw.contactList;
           postResponse.status='Success';
           postResponse.Message='Account with '+rw.contactList.size()+' Contacts Inserted';
        } 
        else{
            postResponse.status='Error';
            postResponse.Message=' No Account Inserted';
            RestContext.response.statusCode=400;
        }
       return postResponse;
    }
    global class RequestWrapper{
        Account account;
        List<Contact> contactList;
    }
    global class PostResponseWrapper{
        Account acct;
        List<Contact> contactList;
        String Status;
        String Message;
        public PostResponseWrapper(){}
    }

}