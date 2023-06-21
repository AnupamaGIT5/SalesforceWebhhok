@RestResource(urlmapping='/api/webhooks/sendAndReceiveData/*')

global with sharing class SampleWebhookPOC {
    @HttpPost
global static void makeData(){
    try{
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

    }
    catch(Exception e){
        System.debug('Exception is..' +e);
    }
}
}