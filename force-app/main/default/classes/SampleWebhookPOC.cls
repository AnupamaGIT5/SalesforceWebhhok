@RestResource(urlmapping='/api/webhooks/sendAndReceiveData/*')

global with sharing class SampleWebhookPOC {
    @HttpPost
    //commit with request
global static void makeData(){
    try{
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
Account acc = [select id from account where id = '0017F000025BJJtQAO'];    
        JsonParser parser = JSON.createParser(req.requestBody.toString());
        pusher ps;
        while (parser.nextToken() != null) {
        if (parser.getText() == 'Pusher') {
            parser.nextToken();
            ps = (pusher)parser.readValueAs(pusher.class);
            }
        }
        acc.WebhookResponse__c = ps.name ;

//
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
}