public class CustomerTriggerHelper
{
   public static void createinvoicerecords(List<apex_customer__C> customerList, Map<id,apex_customer__C>oldMapCustomer)
   {
    List<Apex_Invoice__C> invoiceList= new list<Apex_Invoice__C>();
    for(apex_customer__c objCustomer:customerList)
    {
       if(objCustomer.apex_customer_status__c == 'Pending' && oldMapCustomer.get(objCustomer.id).Apex_Customer_status__c != 'Pending')
       {
         Apex_Invoice__C objInvoice = new Apex_Invoice__C();
         objInvoice.Apex_invoice_description__C='created from the helper class';
         objInvoice.Apex_invoice_status__c='pending';
         objInvoice.Apex_customer__C= objCustomer.id;
         invoicelist.add(objInvoice);
       }
    }
    insert invoiceList;  
   }
}