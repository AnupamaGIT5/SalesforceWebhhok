@RestResource(urlmapping='/api/webhooks/sendAndReceiveData/*')

global with sharing class SampleWebhookPOC {
    @HttpPost
global static void makeData(){
    try{
        //
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
Account acc = [select id from account where id = '0017F000025BJJtQAO'];    
        JsonParser parser = JSON.createParser(req.requestBody.toString());
        pusher ps;
        while (parser.nextToken() != null) {
            system.debug('pusher..' +parser.getText());
        if (parser.getText() == 'pusher') {
            system.debug('pusher..' +parser.getText());
            parser.nextToken();
            ps = (pusher)parser.readValueAs(pusher.class);
            system.debug('ps.'+ps);
            }
        }
        system.debug('ps..'+ps);
        acc.WebhookResponse__c = ps.name + ps.email;


        update acc;
    }
    catch(Exception e){
        System.debug('Exception is..' +e);
    }
}
    public class pusher{
        public string name;
        public string email;
        public pusher(string name, string email){
            name = name;
            email = email;
        }
    }
    
    public class response{
        public string status;
        public string message;
        public response(string name, string email){
            status = name;
            message = email;
        }
    }
}