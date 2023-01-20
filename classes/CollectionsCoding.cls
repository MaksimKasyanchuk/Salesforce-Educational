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

        // Return given List values
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

        // Return given List values
        return md;
    }

    // Create local class variable for counter
    static public Integer COUNT = 0;

    // Create a custom class for Exception
    class NoIdsFoundException extends Exception{}

    // Create an Enum for Id errors
    enum ERRORS_ID {NO_ID_FOUND_ERROR_MESSAGE}

    public static Set<Id> getAccountIds() {
        // Declare a List of type Account, therefore add some Accounts within one statement and insert this List
        // To have the ids of each Account contained in this List
        List<Account> accts = new List<Account> {
            new Account(Name='Test Account to get ID 1'),
            new Account(Name='Test Account to get ID 2'),
            new Account(Name='Test Account to get ID 3')
        };
        insert accts;   

        // Declare a Set of data type ID, and assign Account Ids into this Set
        Set<Id> ids = new Set<Id>();
        
        { // This block is required to implement an assignment of each Account id into the Set of type Id

            // Add Account ids into the Set of type Id, while Set size has not reached the List size
            for (Account acct : accts) {
                while (ids.size() < accts.size()) {
                    ids.add(acct.Id);
                    COUNT++;
                    break;
                }
            }
        }

        { // This block is required to check if Ids were added to the Set of type Id and that this Set is not empty

            // Check the given Set on emptiness and throw exception if this Set is empty
            for (Account acct : accts) {
                if (!ids.contains(acct.Id) && ids.isEmpty()) {
                    // Throw exception here when this Set does not contain any Account id, moreover this Set is empty
                    throw new NoIdsFoundException(CollectionsCoding.ERRORS_ID.NO_ID_FOUND_ERROR_MESSAGE.name());
                }
            }
            system.debug('Each Account ID was being added to the Set (IDS -> ' + ids + ').');
        }

        // Return given Set values
        return ids;
    }
}