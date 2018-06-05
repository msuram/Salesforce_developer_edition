trigger CreateContactOnInsertTrigger on Account (after insert) {
  List<Contact> contactList = new List<Contact>();
  for(Account objAccount : trigger.new){
  // it should create the corresponding contact record
  Contact c = new Contact();
  c.lastName=objAccount.name;
  contactList.add(c);
  }
insert contactList;
}