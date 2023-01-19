public with sharing class CollectionsCoding {
    public static List<Integer> numberOfEmployees(List<Account> accts) {
        // Assign a value to the Account's List, get number of employees and ids
        accts = [SELECT Id, NumberOfEmployees FROM Account LIMIT 10];
        
        // Declare a List to add the number of employees value in there
        List<Integer> employees = new List<Integer>();
        
        {
            // Get a number of employees value of each Account
            for (Account acct : accts) {
                // Add each number of employees value to the List
                employees.add(acct.NumberOfEmployees);
            }

            system.debug('Each number of employees value in range (10) of Account  -> ' + employees);
        }

        return employees;
    }
}