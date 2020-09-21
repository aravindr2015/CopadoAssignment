@RestResource(urlMapping='/checkRest/*')
global class CreateUpdateAccount{
    
    @HttpPut
    global static String createAccount(){
        String bdy =  RestContext.request.requestBody.toString();
        Map<string,object> sd = (Map<string,object>)Json.deserializeUntyped(bdy);
        List<Map<String, Object>> myMaps = new List<Map<String, Object>>();
        List<Object> myMapObjects = (List<Object>) sd.get('AccountList');
        for (Object obj : myMapObjects) {
            myMaps.add((Map<String, Object>)obj);
        }
        List<Account> sdq = new List<Account>();
        for(Map<String, Object> mapRec: myMaps){
            Account acc = new Account();
            for(String key:mapRec.keySet()){
                acc.put(key,mapRec.get(key));
            }
            sdq.add(acc);
        }
        upsert sdq aravid__c;
        return 'sdf';
    }
    
    
}