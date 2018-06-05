public with sharing class ContactController {
    @AuraEnabled
    public static List<Contact> findAll(){
        return [select id, name,phone from Contact where phone != null LIMIT 50];
    }
    @AuraEnabled
    public static List<Contact> findByName(String searchKey){
        String name= '%'+searchKey+'%';
        return [select id, name,phone from Contact where name Like :name and phone != null LIMIT 50];
    }
    @AuraEnabled
    public static Contact findById(String contactId){
        return [select id, name, title, phone,mobilephone, Account.Name from Contact where id=:contactId];        
    }
    @AuraEnabled
    public static List<Contact> getContacts(Id AccountId){
        return [select id, firstName, lastName, email, phone from Contact where AccountId=:AccountId];
    }
    @AuraEnabled
    public static List<Contact> getContactsByAccountIds(List<Id> accountIds){
        return [select id, firstName, lastName, email, phone from Contact where AccountId in :AccountIds];
    }
    @AuraEnabled
    public static Map<String,String> saveContactList(List<Contact> contactList ){
        Map<String,String> result= new Map<String,String>();
        try{
            update contactList;
            result.put('Status', 'success');
            result.put('Message', 'Contacts Updated Succesfully');
        }
        catch(Exception e){
            result.put('Status', 'error');
            result.put('Message', e.getMessage());
        }
        return result;
    }
}