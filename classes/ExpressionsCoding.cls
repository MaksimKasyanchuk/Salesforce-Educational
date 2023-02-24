public with sharing class ExpressionsCoding {
    public static void getAccount() { 
        // Create a Map to get the Account from a query
        Map<Id, Account> accts = new Map<Id, Account> ([SELECT Id, Name FROM Account]);
        // Check an existance of the Account using safe navigation operator
        system.debug(accts.get('0017S00000Q8Wm9QAF')?.Id + ' - ' + accts.get('0017S00000Q8Wm9QAF')?.Name);
    }   
}