trigger ApplyDiscountTrigger on Book__c (before insert) {
  Book__c[] books=Trigger.new;
  DiscountForBook.applyDiscount(books);
}