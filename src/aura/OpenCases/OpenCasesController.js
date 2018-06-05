({
    doInit: function(cmp,event,handler){
        var action= cmp.get("c.getCasesDB");
        console.log("calling doInit");
        action.setCallback(this,function(response) {
        var state = response.getState();
        if(cmp.isValid() && state === "SUCCESS"){
            console.log('getting cases');
            console.log(response.getReturnValue());
            cmp.set("v.cases", response.getReturnValue());
        }
        
        });
         $A.enqueueAction(action);                           
        }
   
    
})