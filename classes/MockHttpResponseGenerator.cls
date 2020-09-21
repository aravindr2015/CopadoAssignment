@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"userId":"0056F000009AaEKQA0","orgId":"00D6F0000026lcIUAQ","accounts":[{"Type":"prospect","Name":"Utah","Id":"0016F00003A2haMQAR"},{"Type":"prospect","Name":"Utah","Id":"0016F00003A2haMQAR"}]}');
        res.setStatusCode(200);
        return res;
    }
}