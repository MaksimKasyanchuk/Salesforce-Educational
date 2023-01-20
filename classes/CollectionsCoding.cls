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

    // Create a custom class for Exception
    class ListIsEmptyException extends Exception{}
    
    // Create an Enum class for List errors
    enum ERRORS {LIST_IS_EMPTY_ERROR_MESSAGE}

    public static List<List<Integer>> multiDimensional() {
        // Declare a nested List of type Integer, explicitly add three nested Lists of type Integer in one statement
        List<List<Integer>> md = new List<List<Integer>> {
            new List<Integer>{1, 2, 3, 4},
            new List<Integer>{5, 6, 7, 8},
            new List<Integer>{9, 10, 11, 12}
        };
        {// Validation block
            
            // Check that the nested list was being filled with data and the reference to this List is valid
            // if both requirements are false, throw an exception
            if (md.isEmpty()) {
                throw new ListIsEmptyException(CollectionsCoding.ERRORS.LIST_IS_EMPTY_ERROR_MESSAGE.name());
            } else {
                system.debug('Nested List has been created and was filled -> ' + md);
            }
        }
        return md;
    }
}