@RestResource(urlMapping='/v2/account/*')
global with sharing class AccountRestService_v2 {
    @HttpGet
    global static AccountWrapper doGet(){
        RestRequest req= RestContext.request;
        RestResponse res=RestContext.response;
        AccountWrapper response= new AccountWrapper();
        String accountId=req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        List<Account> result=[select Id, Name, Phone,Website, BillingState from Account Where Id=:accountId];
        if(result != null && result.size() >0 ) {
           response.acct=result[0]; 
            response.status='Success';
            response.message='Account Found';
        }
        else {
            response.acct=null;
            response.status='failed';
            response.message='Account Could not be Found';
            res.statusCode=404;
        }
    
   return response;
  }
global class AccountWrapper{
        public Account acct;
        public String status;
        public String message;
        public AccountWrapper(){}
    }
}