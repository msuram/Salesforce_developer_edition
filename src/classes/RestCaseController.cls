@RestResource(urlMapping='/FieldCase/*')
global with sharing class RestCaseController {
    @HttpGet
    global static List<Case> getOpenCases()
    {
        String companyName=RestContext.request.params.get('companyName');
        Account company = [select id, Name, BillingState from Account where Name=:companyName];
        List<Case> cases=[select id,subject,status,ownerId,Owner.Name from case where AccountId=:company.Id];
        return cases;
    }
    @HttpDelete
    global static String deleteOldCases(){
        String companyName= RestContext.request.params.get('companyName');
        Account company = [select id, Name, BillingState from Account where Name=:companyName];
        List<Case> cases=[select id,subject,status,ownerId,Owner.Name from case where AccountId=:company.Id and status='Closed'];
        delete cases;
        return 'Closed Cases deleted';
    }
    
    @HttpPost
    global static String CreateNewAccount(String acctName, String descr){
        Account a= new Account();
        a.Name=acctName;
        a.Description=descr;
        insert a;
        return 'Done';        
    }
    
    @HttpPatch
    global static String updateCase(String caseId,String caseStatus, String caseNote){
        Case companyCase=[select Id,Subject,Description from Case where Id=:caseId];
        companyCase.status=caseStatus;
        companyCase.Description += caseNote;
        update companyCase;
        return 'Case updated';        
    }
        
        

}