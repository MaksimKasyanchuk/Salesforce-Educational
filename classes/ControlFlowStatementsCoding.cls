public with sharing class ControlFlowStatementsCoding {
    // If/else conditional statements example
    public static Boolean purchase() {
        // Define a Boolean type variable, and set it to the default value, false
        Boolean isPurchased = false;
        // Check that isPurchased did set to false, further to change the value of isPurchased to true
        if (isPurchased != true) {
            // Status is false at this point, so you process the branch
            system.debug('Status: ' + isPurchased + ' - Processing...');
            // Change the value of isPurchased variable while processing
            isPurchased = true;

            // Finish to process
            system.debug('Finished processing!');
            // Check that isPurchased value is not false anymore after processing, so Status is going to be true
            if (isPurchased != false) {
                // Status is true at this point
                system.debug('Status: ' + isPurchased);
            }

        } else {
            // If isPurchased variable is true by the start of an execution, this block starts
            system.debug('Success');
        }

        // Return a value of isPurchased variable
        return isPurchased;
    }

    // Declare an enum for the Exception handling
    public enum Errors {OUT_OF_BOUNDS_ERROR, NO_SUCH_CONTACT_OR_ACCOUNT_ERROR, UNKNOWN_SEASON}

    // Declare an enum for the Switch/case handling
    public enum Seasons {WINTER, SPRING, SUMMER, AUTUMN}
    
    // Declare an enum to handle all properties for the Seasons enum
    public enum Properties {BOOTS, SANDALS, SNEAKERS, GORETEX_SNEAKERS, BOLD_FEET}

    // Create the boilerplate classes for the custom Exceptions
    public class OutOfBoundsException extends Exception {}
    public class NoAccountOrContactExistsException extends Exception {}
    public class UnknownSeasonException extends Exception {}


    // Switch/case statements example
    public static Integer cases(Integer i) {
        // Implement a Switch control flow
        switch on i {
            when 2, 3 {
                system.debug('when block 2, 3');
            }
            when 4, 5 {
                system.debug('when block 4, 5');
            }
            when 6, 7 {
                system.debug('when block 6, 7');
            }
            when 8, 9, 10 {
                system.debug('when block 8, 9, 10');
            }
            when null {
                system.debug('bad integer');
            }
            when else {
                throw new OutOfBoundsException (ControlFlowStatementsCoding.Errors.OUT_OF_BOUNDS_ERROR.name());
            }
        }

        // Return the i value
        return i;
    }

    public static SObject sObjectSwitch(SObject sobj) {
        // Implement switch control flow
        switch on sobj {
            when Account a {
                system.debug('Account -> ' + a);
            }
            when Contact c {
                system.debug('Contact -> ' + c);
            }
            when null {
                system.debug('Bad Data');
            }
            when else {
                throw new NoAccountOrContactExistsException(ControlFlowStatementsCoding.Errors.NO_SUCH_CONTACT_OR_ACCOUNT_ERROR.name());
            }
        }

        // Return a value of the sobj variable
        return sobj;
    }

    public static void enumSwitch() {
        // Create a reference on the season
        Seasons season = Seasons.SPRING;

        // Implement switch control flow
        switch on season {
            when WINTER {
                system.debug('Wear: ' + ControlFlowStatementsCoding.Properties.BOOTS);
            }
            when SPRING {
                system.debug('Wear: ' + ControlFlowStatementsCoding.Properties.SNEAKERS);
            }
            when SUMMER {
                system.debug('Wear: ' + ControlFlowStatementsCoding.Properties.SANDALS);
            }
            when AUTUMN {
                system.debug('Wear: ' + ControlFlowStatementsCoding.Properties.GORETEX_SNEAKERS);
            }
            when null {
                system.debug('Invalid Season');
            }
            when else {
                throw new UnknownSeasonException(ControlFlowStatementsCoding.Errors.UNKNOWN_SEASON.name());
            }
        }
    }

    // Do-while Loops
    public static void launch() {
        // Define a Boolean type variable for launch preference
        Boolean isLaunched = false;
        // Implement do-while loop
        do {
            // Change the value of isLaunched variable to true and debug it, while the value of isLaunched is false
            isLaunched = true;
            system.debug('Launch -> ' + isLaunched);
        } while (isLaunched == false);      
    }

    public static void counter() {
        // Define an Integer type variable for the counter
        Integer count = 1;

        // Implement while loop
        while (count < 11) {
            system.debug('Count increased -> ' + count);
            count++;
        }
    }


    // traditional for loop
    public static void overgrowth() {
        // Implement for loop
        for (Integer i = 0; i < 10; i++) {
            // Create Accounts until i reaches the boundries
            Account acct = new Account(Name='Account in for Loop: ' + i);
            system.debug('Overgrowth of Account: \n' + acct);
        }
    }

    // List or Set iteration for loops
    public static void opps() {
        // Define an Opportinity List
        Opportunity[] oppList = new Opportunity[]{};

        // Define a List of Accounts, get ID of each Account
        List<Account> accts = new List<Account>([SELECT Id, Name FROM Account]);

        // Implement for List loop
        for (Account acct : accts) {
            // Implement while loop, to control the size exchange
            while (oppList.size() < 5) {
                // Add an Opportunity to the oppList, also give a value for the AccountId field as an Account Id  
                oppList.add(new Opportunity(AccountId=acct.Id));
                // Implement for List loop
                for (Opportunity opp : oppList) {
                    // Output an AccountId of each Opportunity
                    system.debug(opp.AccountId);
                }
            }
        }
    } 
}