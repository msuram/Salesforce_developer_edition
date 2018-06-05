global with sharing class HotelRemoter {
    @RemoteAction
    global static List<Hotel__C> findAll(){
        return [select id,Name,Location__Latitude__s,Location__Longitude__s from Hotel__c];
    }

}