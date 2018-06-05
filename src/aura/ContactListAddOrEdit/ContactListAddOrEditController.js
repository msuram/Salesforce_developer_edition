({
	getContactList : function(cmp, event, helper) {
		helper.fetchContacts(cmp, event, helper);
	},
    newContact: function(cmp, event, helper) {
        var recordId = cmp.get("v.recordId");
        var createContact= $A.get("e.force:createRecord");
        createContact.setParams({
            'entityApiName': 'Contact',
            'defaultFieldValues': {
                'AccountId': recordId
            }
        });
        createContact.fire();
    },
    editContacts: function(cmp, event, helper) {
        var btn= event.getSource();
        var btnName = btn.get('v.name');
        var recordViewForm = cmp.find('recordViewForm');
        var recordEditForm = cmp.find('recordEditForm');
        if(btnName === 'edit'){
            $A.util.addClass(recordViewForm, 'formHide');
            $A.util.removeClass(recordEditForm, 'formHide');
            btn.set('v.name', 'save');
            btn.set('v.label', 'Save');
        }
        else if(btnName==="save"){
            helper.saveContacts(cmp, event, helper);
        }
    }
})