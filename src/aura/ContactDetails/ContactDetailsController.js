({
	locationChangeAction : function(cmp, event, helper) {
		var token= event.getParam("token");
        if(token.indexOf('contact/')===0){
            var contactId= token.substr(token.indexOf('/') + 1);
            console.log("contact Id:"+ contactId );
            var action = cmp.get("c.findById");
            action.setParams({"contactId":contactId});
        }
        action.setCallback(this,function(a){
           var state= a.getState();
           if(state === 'SUCCESS')
           {
               cmp.set("v.contact",a.getReturnValue());
           }
        });
        $A.enqueueAction(action);
	}
})