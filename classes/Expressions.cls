public with sharing class Expressions {
    // Expressions are the constructs made up of variables, operators, and method invocations that evaluates to a single value
    /*

        In Apex, an expression is always one of the following types:
        
        A literal expression.
        A new SObject, Apex object, list, set, or map.
        Any value that can act as the left-hand of an assignment operator (L-values) , including varialbes, one-dimesional list
        positions, and most SObject or Apex object field references.
        Any SObject field reference that is not an L-value, including {
            - The ID of an SObject in a list
            - A set of child records associated with an SObject (for example, the set of Contacts associated with a particular Account)
            This type of expression yields a query result, much like SOQL and SOSL queries
        }
        A SOQL or SOSL query surrounded by square brackets, allowing for on-the-fly evaluation in Apex
        A static or instance method invocation

    */

    // Expression operators
    /*
        ? - stands for audit, that the left-hand expression is not null,
        and if this is null, then avoid NullPointerException and return null value, otherwhise it returns right-hand value
    */
}