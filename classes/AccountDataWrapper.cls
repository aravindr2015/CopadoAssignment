public class AccountDataWrapper {

	public String orgId {get;set;} 
	public String userId {get;set;} 
	public List<Accounts> accounts {get;set;} 
    
    public AccountDataWrapper(){
        
    }
	
	public class Accounts {
		public String Id {get;set;} 
		public String Name {get;set;} 
		public String Type {get;set;} // in json: Type
        
        public Accounts(){
            
        }
    }

}