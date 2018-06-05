({
	doInit : function(cmp, event, helper) {
		var action= cmp.get("c.findAll");
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS")
            {
                console.log("executing the init phase");
                cmp.set("v.contacts",response.getReturnValue());
                console.log(response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	},
    
    searchKeyChange: function(cmp,event,helper){
    var searchKey = event.getParam("searchKey");
    var action= cmp.get("c.findByName");
    action.setParams({"searchKey":searchKey});
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS")
            {
                console.log("executing the search phase");
                cmp.set("v.contacts",response.getReturnValue());
                console.log(response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    
    }
})