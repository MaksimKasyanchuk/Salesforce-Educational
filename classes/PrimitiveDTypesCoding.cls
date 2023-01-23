public with sharing class PrimitiveDTypesCoding {

    // Create a custom class for Exception
    class RootIsInvalidException extends Exception{}

    // Create an Enum for the error message
    enum ERROR {ROOT_IS_INVALID_ERROR}

    public static Integer squareRoot(Integer i) {
        Integer num = (Integer) Math.sqrt(i);
        
        { // This block is required to explicitly check that the square root range is valid (1-30)

            // Check that number square root is not less than 1 and is not greater than 30, so it is a right square root range
            if (num < 1 || num > 30) {
                throw new RootIsInvalidException(PrimitiveDTypesCoding.ERROR.ROOT_IS_INVALID_ERROR.name());
            } else {
                system.debug('Square root of ' + i + ' is -> ' + num);
            }
        }

        // Return the value of the num variable
        return num;
    }
}