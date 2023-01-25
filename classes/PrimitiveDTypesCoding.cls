public with sharing class PrimitiveDTypesCoding {

    // Create a custom class for Exception
    class RootIsInvalidException extends Exception{}

    // Create an Enum for the error message
    enum ERROR {ROOT_IS_INVALID_ERROR}

    public static Integer squareRoot(Integer i) {
        // Declare a variable of the primitive data type Integer and initialize it in one statement
        // Also cast the value into the Integer primitive data type, to have access the work with Math.sqrt() statement
        // which is basically the reference of the Double primitive data type
        Integer num = (Integer) Math.sqrt(i);
        
        { // This block is required to explicitly check that the square root range is valid (1-30)

            // Check that number square root is not less than 1 and is not greater than 30, so it is a right square root range
            if (num < 1 || num > 30) {
                // Throw the custom exception if the range of the square root is invalid
                throw new RootIsInvalidException(PrimitiveDTypesCoding.ERROR.ROOT_IS_INVALID_ERROR.name());
            } else {
                // Output the square root and the number which was squared to root whenever the range of the square root is valid
                system.debug('Square root of ' + i + ' is -> ' + num);
            }
        }

        // Return the value of the num variable
        return num;
    }

    // Create a custom class for Exception
    class AssertionFailedException extends Exception{}

    // Create an enum for Error message
    enum AssertionMessages {ASSERTION_IS_FAILED_ERROR_MESSAGE, ASSERTION_IS_SUCCEEDED_MESSAGE}
    

    public static List<List<String>> students() {
        // Declare a nested List of String
        List<List<String>> studNames = new List<List<String>>();

        // Declare a List of Strings and initialize it in one statement
        List<String> studs = new List<String> {
            'Marison',
            'Jenny',
            'Fortran',
            'Manny',
            'Gregor',
            'Jamell',
            'August'
        };

        // Declare a List of Strings and initialize it with the copied data of the first List
        List<String> studsCopy = studs.clone();
        // Remove an element of the third index
        studsCopy.remove(3);
        // Add a new element on the third index
        studsCopy.add(3, 'Benjamin');

        
        { // This block is required to check that Lists are not equal to each other, we are going to check it with the custom assertion
            
            // Make an assertion variable to check, that Lists are not equal to each other
            Boolean assertion = (studs != studsCopy);

            if (assertion == false) {
                // Throw an exception when assertion comes to be false
                throw new AssertionFailedException(PrimitiveDTypesCoding.AssertionMessages.ASSERTION_IS_FAILED_ERROR_MESSAGE.name());
            } else {
                // Throw a success message when assertion comes to be true
                system.debug('Success -> ' + PrimitiveDTypesCoding.AssertionMessages.ASSERTION_IS_SUCCEEDED_MESSAGE.name());
            }
        }


        { // This block is required to initialize the List of Strings with Student names

            // Check that this List is empty, so you can add the data into an empty List
            if (studNames.isEmpty()) {
                // Add Student names to the nested List of type String
                studNames.add(studs);
                studNames.add(studsCopy);
            } else {
                // Add nothing if this nested List is not empty
                system.debug('Nothing to add...');
            }
        }

        // Return the value of this List
        return studNames;
    }
}