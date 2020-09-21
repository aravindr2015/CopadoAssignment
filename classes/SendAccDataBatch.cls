global class SendAccDataBatch implements Database.Batchable<sObject>,Database.AllowsCallouts {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id, Name,Type FROM Account';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc, List<Account> records){
        AccountDataWrapper batchRec = new AccountDataWrapper();
        batchRec.orgId = UserInfo.getOrganizationId();
        batchrec.userId = UserInfo.getUserId();
        batchrec.accounts = new List<AccountDataWrapper.Accounts>();
        
        AccountDataWrapper.Accounts accRec = new AccountDataWrapper.Accounts();
        for(Account acc:records){
            accRec.Id = acc.Id;
            accRec.Name = acc.Name;
            accRec.Type = acc.Type;
            batchrec.accounts.add(accRec);
        }
        
        String jsonString = JSON.serialize(batchRec);
        
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http(); 
        //Named credential can be used for the below line
        //req.setHeader('Authorization', header);
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint('https://copado.com/api/accountSync/batch');
        req.setMethod('POST');
        req.setBody(jsonString);
        
        res = http.send(req);
        String sJson = res.getBody();
        System.debug('Str:' + res.getBody());            
    }    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }    
}