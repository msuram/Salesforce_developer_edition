@RestResource(urlMapping='/FieldContact/*')
global with sharing class RestContactController {
    @HttpGet
    global static List<Contact> getContact(){
        String companyName= RestContext.request.params.get('companyName');
        Account company = [select id, Name, BillingState from Account where Name=:companyName];
        List<Contact> contacts=[select id,Name,ownerId,Owner.Name from Contact where AccountId=:company.Id];
        return contacts;
    }
    @HttpPost
    global static String createContact(String companyName, string LastName){
        Contact c = new Contact();
        Account company = [select id, Name, BillingState from Account where Name=:companyName];
        c.LastName=LastName;
        c.AccountId=company.Id;
        c.Description='Created from the Post';
        insert c;
        return 'Inserted the contact';
    }

}