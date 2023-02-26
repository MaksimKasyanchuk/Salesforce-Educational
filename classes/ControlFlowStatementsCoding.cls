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
    enum Errors {OUT_OF_BOUNDS_ERROR}

    // Create a boilerplate class for a custom Exception
    public class OutOfBoundsException extends Exception {}


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
}