({
	fetchContacts : function(cmp, event, helper) {
        var recordId= cmp.get("v.recordId");
		var action= cmp.get("c.getContactsByAccountIds");
        action.setParams({
            'accountIds': recordId
        });
        action.setCallback(this,function(result){
            var state = result.getState();
            if(state==='SUCCESS'){
                cmp.set('v.contactList',result.getReturnValue());
            }
            else{
                alert('Error Occured in the fetch phase');
            }
        });
        $A.enqueueAction(action);
	},
    
    saveContacts: function(cmp, event, helper){
        var contacts= cmp.get("v.contactList");
        var recordViewForm = cmp.find('recordViewForm');
        var recordEditForm = cmp.find('recordEditForm');
        var toastEvent = $A.get('e.force:showToast');
        var saveAction= cmp.get("c.saveContactList");
        saveAction.setParams({
            'contactList': contacts
        });
        saveAction.setCallback(this,function(result){
            var state = result.getState();
            if(state==='SUCCESS'){
                var dataMap= result.getReturnValue();
                if(dataMap.Status==='success')
                {
                    $A.util.addClass(recordEditForm,'formHide');
                    $A.util.removeClass(recordViewForm,'formHide');
                    var btn=event.getSource();
                    btn.set('v.name','edit');
                    btn.set('v.label','Edit');
                    toastEvent.setParams({
                        'title': 'Success!',
                        'type': 'success',
                        'mode': 'dismissable',
                        'message': dataMap.Message
                    });
                    toastEvent.fire();
                }
            }
            else if(datamap.Status === 'error'){
                toastEvent.setParams({
                        'title': 'Error!',
                        'type': 'error',
                        'mode': 'dismissable',
                        'message': dataMap.Message
                    });
                    toastEvent.fire();
            }
            
            else{
                 alert('Error in getting Data');   
            }
        });
        $A.enqueueAction(saveAction);
    }
})