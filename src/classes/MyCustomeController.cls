public class MyCustomeController {

    private final Account account;
    
    public MyCustomeController()
    {
      account = [select id,name,Site from Account where id =: ApexPages.currentPage().getParameters().get('id')];
    }
    
    public Account getAccount()
    {
    return account;
    }
    
    public PageReference saveTheRecord()
    {
     update account;
     return null;
    }
}