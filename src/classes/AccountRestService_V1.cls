@RestResource(urlMapping='/v1/account/*')
global with sharing class AccountRestService_V1 {
    @HttpGet
    global static Account doGet(){
        RestRequest req= RestContext.request;
        RestResponse res=RestContext.response;
        String accountId=req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result=[select Id, Name, Phone,Website, BillingState from Account Where Id=:accountId];
        return result;
    }

}