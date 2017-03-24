public with sharing class ads_MyServices implements Database.Batchable<sObject>
{	
	
	// fields
	
	private final String theQuery;
	
	// constructors
	
	public ads_MyServices(final String theQuery)
	{
		this.theQuery = theQuery;
	} // constructor
	
	// methods
	
	public Database.QueryLocator start(final Database.BatchableContext theContext)
	{
		return Database.getQueryLocator(this.theQuery);
	} // start	
	
    public void execute(final Database.BatchableContext theContext, final List<sObject> theScope)
    {
    	
    	for (sObject theObject : theScope)
    	{
    		System.debug(System.LoggingLevel.DEBUG, theObject);    		
    	}
    	
    } // execute
    	
    public void finish(final Database.BatchableContext theContext)
    {
    } // finish
    
    public static ID findAccounts()
    {
    	return findObjects('SELECT Id, Name FROM Account');
    } // findAllAccounts
        
    public static ID findObjects(final String theQuery)
    {
        return Database.executeBatch(new ads_MyServices(theQuery));    	
    } // findObjects             	
    
} // ads_MyServices

// file