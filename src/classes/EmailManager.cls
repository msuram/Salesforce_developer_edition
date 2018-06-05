public class EmailManager {
    public static void sendMail(String address,String subject,String body){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[]{address};
        mail.setToAddresses(toAddresses);
        mail.setPlainTextBody(body);
        mail.setSubject(subject);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }
}