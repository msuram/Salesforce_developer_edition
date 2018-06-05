trigger BeforeInsertaccountTrigger on Account (before insert) {
  if(trigger.isInsert)
  {
   for (Account A : Trigger.new)
   {
     System.assertEquals('MyTutorialRack',a.Name);
     System.assertEquals('12345678',a.AccountNumber);
     System.assertEquals(100, a.NumberOfEmployees);
     System.assertequals(200,a.AnnualRevenue);
     
   }
  }

}