public class MyCustomController2 {
public Account account{get;private set;}

public MyCustomController2 (){
Id id = ApexPages.currentPage().getParameters().get('id');
account = (id == null)?new Account():[select id,name,phone,industry from Account where Id =: id];
}

public PageReference save(){
try{
upsert(account);

}
catch(System.DMLException e){
ApexPages.addMessages(e);
return null;
}
PageReference succes= new ApexPages.StandardController(Account).view();
return succes;
}

}