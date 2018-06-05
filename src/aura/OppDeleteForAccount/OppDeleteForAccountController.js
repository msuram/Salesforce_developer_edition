({
	getOppList : function(cmp, event, helper) {
        var recordId= cmp.get("v.recordId");
        console.log("Inside getOppList");
        console.log("recoredId:"+recordId);
		var action= cmp.get("c.getOpportunitiesByAccount");
        action.setParams({
            accountId : recordId
        });
        action.setCallback(this, function(result) {
            var state= result.getState();
            var oppList = result.getReturnValue();
            console.log("State"+state);
            if(result.getState()==='SUCCESS'){
                cmp.set("v.oppList",oppList);
                console.log("oppList"+ oppList);
                }
            else{
                alert("Error in getting data");
            }
        });
        $A.enqueueAction(action);
	},
    deleteOpps: function(cmp,event, helper) {
        var oppToDelete = cmp.find("deleteOpp");
        var idsToDelete=[];
        if(oppToDelete.length != undefined){
            for(var i=0;i<oppToDelete.length;i++)
            {
              if(oppToDelete[i].get("v.checked"))
            	idsToDelete.push(oppToDelete[i].get("v.value"));
            }
            }
        else {
            if(oppToDelete.get("v.checked"))
                idsToDelete.push(oppToDelete.get("v.value"));
            
        }
        var toasterEvent= $A.get("e.force:showToast");
        var deleteAction= cmp.get("c.deleteOpportunities");
        deleteAction.setParams({
            oppIds : idsToDelete
        });
        deleteAction.setCallback(this, function(result) {
            if(result.getState()==='SUCCESS'){
                var resultMap=result.getReturnValue()
                toasterEvent.setParams({
                    'title': 'Success!',
                    'type': 'success',
                    'mode': 'dismissable',
                    'message':resultMap.message 
                });
                toasterEvent.fire();
                window.location.reload();
                }
            else if(result.getState()==='INCOMPLETE'){
                var resultMap=result.getReturnValue()
                toasterEvent.setParams({
                    'title': 'Error!',
                    'type': 'error',
                    'mode': 'dismissable',
                    'message':resultMap.message 
                });
                toasterEvent.fire();
               
                }
            else{
                alert("Error in getting data");
            }
        });
        $A.enqueueAction(deleteAction);
    }
    
})