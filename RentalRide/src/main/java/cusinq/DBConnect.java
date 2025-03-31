package cusinq;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnect {
	
	
	 
		private static String url = "jdbc:mysql://localhost:3306/rentalride"; 
		private static String user = "root";
		private static String pass = "Dew@suki12";
		
		 
		 private static volatile Connection con;
		
		 
		private DBConnect() {}
		
		public static Connection getConnection() {
			
			 if (con == null) { 
				 synchronized (DBConnect.class) { 
					 if (con == null) { 

						 	try {
				
						 	Class.forName("com.mysql.jdbc.Driver"); 
				
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