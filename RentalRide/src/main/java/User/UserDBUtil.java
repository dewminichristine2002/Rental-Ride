package User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class UserDBUtil {
	
//By declaring these variables as static, we ensure that there is only one instance of each variable shared across all methods of the class
	private static Connection con = null;
	private static Statement stat = null;
	private static ResultSet rs = null;
    
//method made to insert data
	public static boolean InsertUserDetails(String Uname,String Passwd,String UType,String Email,String CNumber) {
		
		boolean result = true ;
	
				
				
				try {
					
					// Get a connection to the database using the DBConnect class
					con = DBConnect.getConnection();
					
					 // Create a statement object to execute the SQL query
					stat = con.createStatement(); 
					
					String sql = "INSERT INTO user_registration (username, password, user_type, email, phone_number)VALUES ('" + Uname + "', '" + Passwd + "', '" + UType + "', '" + Email + "', '" + CNumber + "')";

					// Execute the SQL query and get the number of affected rows
					int rs = stat.executeUpdate(sql);
					
					if(rs>0) {
						result = true;
					} else {
						result = false;
					}
					
				} catch(Exception e) {
					
					e.printStackTrace(); //prints the error
				}
				
				return result;
	}
	
	//method made to check wheter the username and password exists in the data base and to fetch its data
	public static  List<UserClass> validate(String Username, String Password){
		
		ArrayList<UserClass> User = new ArrayList<>();
		
		
		try {

			con = DBConnect.getConnection();
			
			stat = con.createStatement(); 
			
			String sql = "select * from user_registration where username='"+Username+"' and password='"+Password+"' ";
			
		    rs = stat.executeQuery(sql);  
			
			if(rs.next()) { 
			
				String username = rs.getString(2);
				String usertype = rs.getString(4);
				String email = rs.getString(5);
				String phone = rs.getString(6);
				
		
			UserClass Person = new UserClass(username,usertype,email,phone); 
	   
			User.add(Person); 
			}
			
		} catch(Exception e) {
			
			e.printStackTrace(); 
		}
		return User;
		
	}
	
	
	//method made to update the data
	public static boolean updateUser(String Username, String Email, String Phone) {
		
		boolean update = false;
		
		
				
				try {

					con = DBConnect.getConnection();
					
					stat = con.createStatement(); 
					
					String sql = "UPDATE user_registration SET email='" + Email + "', phone_number='" + Phone + "' WHERE username='" + Username + "'";
					
					int rs = stat.executeUpdate(sql);
					
					if(rs>0) {
						update = true;
					} else {
						update = false;
					}
				}catch (Exception e) {
				    e.printStackTrace();
				}
					
		return update;
		
	}
	

    //method made to delete the data
	public static boolean deleteUser(String Uname) {
	    boolean delete = false;

	    try {
	    	

			con = DBConnect.getConnection();
			
	         stat = con.createStatement(); 
	        
	        // Correct SQL DELETE statement
	        String sql = "DELETE FROM user_registration WHERE username='" + Uname + "'";
	        
	        int rs = stat.executeUpdate(sql);
	        
	        if(rs > 0) {
	            delete = true;
	        } else {
	            delete = false;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	        
	    return delete;
	}
}




