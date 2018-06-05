@RestResource(urlMapping='/v3/account/*')
global with sharing class AccountRestService_v3 {
    @HttpGet
    global static AccountWrapper doGet(){
        RestRequest req= RestContext.request;
        RestResponse res=RestContext.response;
        AccountWrapper response= new AccountWrapper();
        String accountId=req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        if(dosearch(accountId)){
            searchAccount(req,res,response);
        }
        else {
            findAccount(res,response,accountId);
        }
        return response;
  }
    private static boolean doSearch(string accountId){
        if(accountId=='account'){
            return true;
        }
        return false;
    }
    Private static void searchAccount(RestRequest req, RestResponse res, AccountWrapper response ){
        String searchTerm= req.params.get('Name');
        if(searchTerm == null || searchTerm == '')
        {
            response.status='Error';
            response.message='You must provide a name for your search term.';
            res.StatusCode=400;
        }
        else{
            String searchText = '%'+searchTerm+'%';
            List<Account> searchResults=[select id,name,phone,Website from Account where name like :searchText];
            if(searchResults != null && searchResults.size() > 0){
                response.acctList = searchResults;
                response.status='Success';
                response.message=searchResults.size()+'Accounts were found that matched  your search term.';
            }
            else{
                
                response.status='Error';
                response.message='No Accounts were found that matched  your search term.';
            }
        }
        
    } 
    Private static AccountWrapper findAccount(RestResponse res, AccountWrapper response , String accountId ){
        if(accountId != null && accountId !=''){
            List<Account> result = [select id, Name,Phone,Website from Account where Id=:accountId];
            if(result != null && result.size() > 0){
                response.acctList.add(result[0]);
                response.status='Success';
            }
            else{
                response.status='Error';
                response.message='This account could  not be found, please try again';
                res.statusCode=404;
            }
            
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