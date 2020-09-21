@isTest
public class TestSendAccDataBatch {
    
    @isTest static void testCallout() {
        List<Account> accList = new List<Account>();
        Account acc1 = new Account();
        acc1.Name = 'test1';
        acc1.Type = 'prospect';
        accList.add(acc1);
        
        Account acc2 = new Account();
        acc2.Name = 'test2';
        acc2.Type = 'prospect';
        accList.add(acc2);
        
        insert accList;
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        Test.startTest();
        Database.executeBatch(new SendAccDataBatch(),1000);
        Test.stopTest();
    }

}