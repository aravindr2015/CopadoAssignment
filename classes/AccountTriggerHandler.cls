public class AccountTriggerHandler {
    @future(callout=true)
    public static void createUpdateAccounts(String requestBody){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:aravcredential');
        request.setMethod('PUT');
        request.setBody(requestBody);
        request.setHeader('Content-Type', 'application/json');
        HttpResponse response = http.send(request);
    }
}