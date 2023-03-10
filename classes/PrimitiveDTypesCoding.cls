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

    // Create an enum for Assertion messages
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

    // Create a custom class for Exception
    class NumberLimitException extends Exception{}

    // Create an enum class to handle the messages
    enum Messages {NUMBER_IS_POSITIVE, NUMBER_IS_NEGATIVE}

    // Create an Enum class for Error messages
    enum LimitError {NUMBER_HAS_REACHED_THE_LIMIT_ERROR}

    public static Decimal positiveNegativeNum(Decimal i) {
        { // This block is required to check that the number is either positive or negative

            // Set a scale of this number 
            i.setScale(0);

            // Condition if the number is positive 
            if (i > 0 && i <= 2147483647) {
                system.debug('Number was being checked ... Result -> ' + PrimitiveDTypesCoding.Messages.NUMBER_IS_POSITIVE.name()); // Is positive
            }
            
            // Condition if the number is negative
            if (i <= 0 && i >= -2147483647) {
                system.debug('Number was being checked ... Result -> ' + PrimitiveDTypesCoding.Messages.NUMBER_IS_NEGATIVE.name()); // Is negative
            }

            // Condition if number either positive or negative reaches the limit
            if (i >= 2147483647 || i <= -2147483647) {
                // Throw an exception if limit was reached by number
                throw new NumberLimitException(PrimitiveDTypesCoding.LimitError.NUMBER_HAS_REACHED_THE_LIMIT_ERROR.name());
            }

        }

        // Return a value of this Decimal
        return i;
    }

    // Create a local variable for the count
    static public Integer COUNT = 0;

    public static Set<Id> usersId() {
        // Declare a Set of Ids
        Set<Id> ids = new Set<Id>();

        // Declare an Account variable, and initialize it in one statement
        List<Account> users = new List<Account> {
            new Account(Name='User 1 test', Phone='111-11-11'),
            new Account(Name='User 2 test', Phone='222-22-22'),
            new Account(Name='User 3 test', Phone='333-33-33')
        };

        upsert users;

        { // This block is required to initialize this Set of Ids with the Account ids explicitly.

            // Declare an Id variable, to assign users' ids into it
            Id id;

            // Iterate through an each Account user
            for (Account user : users) {
                // Create a while loop to get an each user id
                while (true) {
                   id = user.Id;
                   
                   // Add each id to the Set
                   ids.add(id);
                   COUNT++;
                   break;
                }
            }
    
            system.debug('Each user id was being retrieved... -> ' + ids);
        }

        // Return this Set values
        return ids;
    }

    public static Object assistance(String assistantName) {
        // Define variable with the Object type
        Object assistant = new Contact();
        // Define variable for Contact and reference the instance of the Object
        Contact con = (Contact) assistant;

        { // This block is required to initialize an AssistantName of Contact
            con.AssistantName = assistantName;
            
            // Set an upper case for the AssistantName
            String toUpper = con.AssistantName.toUpperCase();

            system.debug(toUpper);
        }
        return con;
    }
}