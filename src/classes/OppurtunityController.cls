public class OppurtunityController {
   @AuraEnabled
    public static List<Opportunity> getOpportunitiesByAccount(Id accountId){
        List<Opportunity> oppList = [select id, Name, Amount, StageName, AccountId from  Opportunity where AccountId =:accountId];
        system.debug('accList:'+oppList);
        return oppList;
    }
    @AuraEnabled
    public static Map<String,String> deleteOpportunities(List<Id> oppIds){
        List<Opportunity> oppList =[select id from Opportunity where Id in :oppIds];
        Map<String,String> Result= new Map<String,String>();
        try{
            delete oppList;
            result.put('status', 'success');
            result.put('message', 'Opportunities Deleted Successfully');
        }
        catch(Exception e){
            result.put('status', 'error');
            result.put('message', e.getMessage());
        }
        return result;
    }
 
}