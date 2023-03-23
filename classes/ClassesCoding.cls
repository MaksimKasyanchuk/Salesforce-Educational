public with sharing class ClassesCoding { // Outer (top-level) class

    // Abstract example
    public abstract class Name {
        public abstract String myName(String name);
    }

    public class GetName extends Name {
        public override String myName(String name) {
            System.debug(name);
            return name;
        }
    }

    // Encapsulation example
    public static Double calculateWinPercentage(Double percentage) {
        return calculateProbabilityOfWinBasedOnAccount() + calculateProbabilityOfWinBasedOnPastTries();
    }

    private static Double calculateProbabilityOfWinBasedOnAccount() {
        return 2.0;
    }

    private static Double calculateProbabilityOfWinBasedOnPastTries() {
        return 1.0;
    }

    // Recursion example
    public static Integer recursiveCalculator(Integer numberToCheck) {
        System.debug('Recursive method called num = ' + numberToCheck);
        if (numberToCheck == 0) {
            return 1;
        }
        return numberToCheck * recursiveCalculator(numberToCheck -1);
    }

    // Polymorphism example using overriding
    public virtual class Parent {
        public virtual void display() {
            System.debug('This is a Parent');
        }
    }

    public class Child extends Parent {
        public override void display() {
            System.debug('This is a Child');
        }
    }

    // Polymorphism example using overloading
    public static String getName(String n){
        return n;
    }  
    
    public static String getName(String name, String secondname) {
        return name + secondname;
    }

    public static String getName(String name, String surname, String lawname) {
        return name + surname + lawname;
    }

    // Create a handler for inner class
    public static Car carPreferences(String en, String mod, String ms, String sp, Decimal prc) {
        // Create an instance of the inner class
        Car car = new Car(en, mod, ms, sp, prc);
        System.debug(car);
        // Return the car values
        return car;
    }

    
    // Inner class here
    public class Car {
        // Define inner class variables
        String engine, model, mass, speed;
        Decimal price;
        
        public Car() {}

        // Create a Constructor for this inner class
        public Car(String en, String mod, String ms, String sp, Decimal prc) {
            // Use this keyword, to have an access to the instance variables
            this.engine = en;
            this.model = mod;
            this.mass = ms;
            this.speed = sp;
            this.price = prc;
        }
    }


    // Create a handler for inner class
    public static String getAddr(String shSt, String shCi, String shSta, String shPC, String shCo) {
        // Create an instance of the inner class 
        ShippAddress addr = new ShippAddress(shSt, shCi, shSta, shPC, shCo);
        System.debug(addr);
        // Serialize data
        String serAddr = JSON.serialize(addr);
        System.debug(serAddr);
        // Return the serialized data
        return serAddr;
    }

    // Inner class here
    public class ShippAddress {
        // Define inner class variables (objects)
        String shippStreet, shippCity, shippState, shippPostalCode, shippCountry;

        public ShippAddress() {}

        // Create the Constructor for this inner class
        public ShippAddress(String shSt, String shCi, String shSta, String shPC, String shCo) {
            // Use this keyword, to have an access to the instance variables
            this.shippStreet = shSt;
            this.shippCity = shCi;
            this.shippState = shSta;
            this.shippPostalCode = shPC;
            this.shippCountry = shCo;
        }
    }


    // Create an instance of the Inner class, and return the data
    public static Wrapper getLists() {
        return new Wrapper();
    }

    // Inner class here
    public class Wrapper { // Inner (one-level-deep) class
        // Define class varaibles (objects)
        public List<Account> accountList;
        public List<Opportunity> opportunityList;

        public Wrapper() { // Inner class Constructor
            accountList = [SELECT ID, Name, Industry FROM Account LIMIT 3];
            opportunityList = [SELECT Name, AccountID, CreatedById FROM Opportunity LIMIT 2];
        }
    }

    // Create an instance of a class
    public static TestConstruct getSize() {
        return new TestConstruct();
    }

    // Define a class block constant
    private static final Integer DEFAULT_SIZE = 10;

    public class TestConstruct {
        // Define an Integer variable
        Integer size;

        // Constructor with no args
        public TestConstruct() {
            this(DEFAULT_SIZE);
        }

        // Constructor with one argument
        public TestConstruct(Integer objSize) {
            size = objSize;
        }
    }

    // Create an instance of a class
    public static Leads getLeadEmail() {
        return new Leads();
    }  

    public class Leads {
        // First a no-argument constructor
        public Leads () {}

        // A constructor with one argument
        public Leads (Boolean call) {}

        // A constructor with two arguments 
        public Leads (String email, Boolean call) {}

        // Though this constructor has the same args as the one above, they are in different order, so this is legal
        public Leads (Boolean call, String email) {}
    }

    // Create an instance of a class
    public static Customers getCustomerData(String cusId, String cusBillCt, String cusLN, Integer cusPCH, Integer cusCred, Integer cusQ) {
        Customers cust = new Customers(cusId, cusBillCt, cusLN, cusPCH, cusCred, cusQ);
        System.debug(cust);
        return cust;
    }

    public class Customers {
        // Create params for the customer
        String customerId, customerBillingCity, customerLastName;
        Integer customerPayCheck, customerCredit, customerQueue;

        public Customers() {}

        // Create a constructor for the customer
        public Customers(String cusId, String cusBillCt, String cusLN, Integer cusPCH, Integer cusCred, Integer cusQ) {
            this.customerId = cusID;
            this.customerBillingCity = cusBillCt;
            this.customerLastName = cusLN;
            this.customerPayCheck = cusPCH;
            this.customerCredit = cusCred;
            this.customerQueue = cusQ;
        }
    }

    // Create an instance of the Order
    public static Order getOrder(DateTime dOrd, String wr, String countSupp, String ordId, Double wrCond, Double wrPrc) {
        Order order = new Order(dOrd, wr, countSupp, ordId, wrCond, wrPrc);
        System.debug(order);
        return order;
    }

    public class Order {
        // Create params for the order
        DateTime dateOrdered;
        String ware, countrySupplier, orderId;
        Double wareCondition, warePrice;

        public Order() {}

        // Create a constructor for the order
        public Order(DateTime dOrd, String wr, String countSupp, String ordId, Double wrCond, Double wrPrc) {
            this.dateOrdered = dOrd;
            this.ware = wr;
            this.countrySupplier = countSupp;
            this.orderId = ordId;
            this.wareCondition = wrCond;
            this.warePrice = wrPrc;
        }
    }

    public static UserInitials initials(String userPassword, String userLogin, String userEmail,
    Integer userPolicyCode, Integer userVerificationCode, Integer userPostalCode) 
    {
        List<String> argsListStr = new List<String>();
        List<Integer> argsListInt = new List<Integer>();
        
        {
            argsListStr.add(userPassword);
            argsListStr.add(userLogin);
            argsListStr.add(userEmail);
            
            argsListInt.add(userPolicyCode);
            argsListInt.add(userVerificationCode);
            argsListInt.add(userPostalCode);
        }

        UserInitials init = new UserInitials(argsListStr, argsListInt);

        return init;
    }

    public class UserInitials  {
        protected List<String> userArgsStr;
        protected List<Integer> userArgsInt;

        private UserInitials() {}

        private UserInitials(List<String> argsListStr, List<Integer> argsListInt){
            this.userArgsStr = (List<String>) argsListStr;
            this.userArgsInt = (List<Integer>) argsListInt;
        }
    }

}