@RestResource(urlMapping='/v5/account/*')
global with sharing class AccountRestService_v5 {
    @HttpPost
    global static AccountWrapper CreateAccount(List<Account> accList){
        RestResponse res=RestContext.response;
        Account a= new Account();
        AccountWrapper response= new AccountWrapper();
        if(accList != null && accList.size() > 0){
        insert accList;
        response.acctList=accList;
        response.status='Success';
        response.Message='Account Inserted';    
        }
        else{
        response.status='Error';
        response.Message='Please enter the Account details in the json format';
        res.statusCode=400;
        }
        return response;
    }
    global class AccountWrapper{
        public List<Account> acctList = new List<Account>();
        public String status;
        public String message;
        public AccountWrapper(){
            
        }
    }
}