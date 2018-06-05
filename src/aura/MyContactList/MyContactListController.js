({
	myAction : function(component, event, helper) {
        console.log("Inside MyAction");
        var Account=component.get("v.Account")
        console.log("Account:" + Account);
        component.set("v.Columns", [
            {label:"First Name", fieldName:"FirstName", type:"text"},
            {label:"Last Name", fieldName:"LastName", type:"text"},
            {label:"Email", fieldName:"Email", type:"email"},
            {label:"Phone", fieldName:"Phone", type:"phone"}
        ]);
        var id=component.get("v.recordId");
        console.log("Record id =" + id);
        var action = component.get("c.getContacts");

        action.setParams({
            AccountId: id
        });

        action.setCallback(this, function(data) {

            component.set("v.Contacts", data.getReturnValue());
        });

        $A.enqueueAction(action);
	},
    newContact : function(component, event, helper) {

        var createContact = $A.get("e.force:createRecord");
        var id=component.get("v.recordId");
        createContact.setParams({
            'entityApiName' : 'Contact',
            'defaultFieldValues' : {
                'AccountId': id
            }
        });

        createContact.fire();
    }
})