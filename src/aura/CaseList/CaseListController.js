({
	 goToRecord: function(cmp, event, helper) {
         //force:navigateToSObject works in the salesforce mobile
        var sObjectEvent= $A.get("e.force:navigateToSObject");
        sObjectEvent.setParams({
            "recordId" : cmp.get("v.case.Id"),
            "slideDevName": 'detail'
        })
       sObjectEvent.fire();
    }
})