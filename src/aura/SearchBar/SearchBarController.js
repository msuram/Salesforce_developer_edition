({
	searchKeyChange : function(cmp, event, helper) {
        var myEvent = $A.get("e.c:SearchKeyChangeEvent");
        myEvent.setParams({"searchKey" : event.target.value});
        myEvent.fire();
	}
})