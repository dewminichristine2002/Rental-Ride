package VehicleOwner;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnect {
	
	
	 // Database connection details
		private static String url = "jdbc:mysql://localhost:3306/rentalride"; 
		private static String user = "root";
		private static String pass = "Dew@suki12";
		
		 // Volatile Connection object to ensure changes are visible to all threads
		 private static volatile Connection con;
		
		 //by making the constructor private it ensures that only one object is created(singleton pattern)
		private DBConnect() {}
		
		public static Connection getConnection() {
			
			 if (con == null) { // Double-checked locking to ensure thread-safe singleton implementation
				 synchronized (DBConnect.class) { // Locking the class
					 if (con == null) { // Second check with locking

						 	try {
				
						 	Class.forName("com.mysql.jdbc.Driver"); // runs the interfaces of the classes.. 
				
						 	con = DriverManager.getConnection(url, user, pass);
				
						 	}
						 	catch (Exception e) {
						 		System.out.println("Database connection is not success!!!");
						 	}
						 }
					 }
			 }
			return con;
		

	}

}

