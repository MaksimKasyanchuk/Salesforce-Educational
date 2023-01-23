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

    public static Map<Id, Account> acctParams() {
        // Declare a List of Accounts and initialize it in one statement
        List<Account> accts = new List<Account> {
            new Account(Name='Test Account for Maps 1'),
            new Account(Name='Test Account for Maps 2'),
            new Account(Name='Test Account for Maps 3')
        };

        // Insert accounts to assume their ids
        insert accts;

        // Declare a Map of Id as a key, and its Account as a value
        Map<Id, Account> idAndItsAcct = new Map<Id, Account>();

        {// This block is required to add the pairs to the Map, give an Id as a key, and an Account as a value

            // Check that this size is greater than 0, so it is not empty
            if (accts.size() > 0) {

                // Iterate through an each account of the List, get the Id and the Account itself
                for (Account acct : accts) {
                    idAndItsAcct.put(Id.valueOf(acct.id), acct);

                    // Make some assertions to make sure that Account ids do exist, therefore Accounts themselves too
                    system.assert(idAndItsAcct.containsKey(Id.valueOf(acct.Id)));
                }
            } else {
                // If size of this List is 0, so it is empty, then throw an error
                throw new ListIsEmptyException(CollectionsCoding.ERRORS.LIST_IS_EMPTY_ERROR_MESSAGE.name());
            }

            system.debug('Map was being successfully managed -> ' + idAndItsAcct);
        }

        { // This block is required to retrieve all the keys of this Map

            // Retrieve a set that contains all of the keys in the Map
            Set<Id> keyss = idAndItsAcct.keySet();
            system.debug('All keys were retrieved -> ' + keyss);
        }

        // Return a value of the Map<Id, Account>
        return idAndItsAcct;
    }

    public static Map<String, Bot_Command__c> commands() {
        // Declare a List of Bot Commands and initialize it in one statement
        List<Bot_Command__c> commandList = new List<Bot_Command__c>{
            new Bot_Command__c(Active__c=true, Name='COMPILE'),
            new Bot_Command__c(Active__c=false, Name='TEST'),
            new Bot_Command__c(Active__c=true, Name='RETRIEVE')
        };

        // Insert this List to retrieve an each id of the Bot Command object
        insert commandList;

        // Declare a Map, with the pair of String as a key, and Bot_Command__c object as a value
        Map<String, Bot_Command__c> commandMap = new Map<String, Bot_Command__c>();

        { // This block is required to get each Bot_Command__c object and check that each of them exists

            // Iterate through an each Bot_Command__c object to retrieve its data
            for (Bot_Command__c cmd : commandList) {
                // Iterate through a while loop to authomatize a process of putting the each object to this Map
                while (true) {
                    commandMap.put('\nBot ' + COUNT + ' was managed and added to the map', cmd);
                    COUNT++;
                    break;
                }
            }

            system.debug('\nAll Bots were retrieved with their params (Status, Command name, ID) -> ' + commandMap.toString());
        }

        { // This block is required to declare a Set which will be assigned with an each Bot_Command__c object Id

            // Declare a Set of type Id
            Set<Id> commandIds = new Set<Id>();
            
            // Iterate through an each Bot_Command__c object of this List to get its Id
            for (Bot_Command__c cmd : commandList) {
                // Add Bot_Command__c object Ids to the Set
                commandIds.add(cmd.Id);
            }

            system.debug('\nId of the each Bot that was being retrieved -> ' + commandIds);
        }

        // Return a value of this Map

        return commandMap;
    }

    
}