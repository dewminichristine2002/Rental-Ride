package VehicleOwner;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class VehicleDButil {
	
	private static Connection con = null;
	private static Statement statement = null;
	private static ResultSet rs = null;
		
public static boolean insertVehicle(String registrationNo, String model, String features, String pricerate, String owner) {
		
		boolean isSuccess = false;
		
		try {
			
			con = DBConnect.getConnection();
			statement = con.createStatement();
			
			String sql ="INSERT INTO vehicle_info (Vehicle_registrationNumber, Vehicle_model, Vehicle_features, Vehicle_pricerate, Vehicle_owner) " +
		             "VALUES ('" +registrationNo+ "', '" + model + "', '" + features + "', '" + pricerate + "', '" + owner + "')";
;
			int rs = statement.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
	}
	
	
	public static ArrayList<Vehicle> displayVehicleDetails(){
		
		ArrayList<Vehicle> vehicle = new ArrayList<>();
		
		
		try {
			
			con = DBConnect.getConnection();
			statement = con.createStatement();
			
			String sql = "select * from vehicle_info";
			ResultSet rs = statement.executeQuery(sql);
			
			while(rs.next()) {
				//String id = rs.getString(1);
				String registrationNo = rs.getString(2);
				String model = rs.getString(3);
				String features = rs.getString(4);
				String pricerate = rs.getString(5);
				String owner = rs.getString(6);
				
				
				
				Vehicle v = new Vehicle(registrationNo, model,features,pricerate,owner);
				vehicle.add(v);
				
			}
			
		}
		catch (Exception e){
			e.printStackTrace();
		}
		
		
		return vehicle;
		
	}
	
	
	
	public static boolean updateVehicleInfo(String registrationNo, String model, String features, String pricerate) {
	    boolean isSuccess = false;
	    
	    try {
	   
	    	con = DBConnect.getConnection();
			statement = con.createStatement();
	            
			String sql = "UPDATE vehicle_info SET Vehicle_model=?, Vehicle_features=?, Vehicle_pricerate=? WHERE Vehicle_registrationNumber=?";
	            try (PreparedStatement statement = con.prepareStatement(sql)) {
	                statement.setString(1, model);
	                statement.setString(2, features);
	                statement.setString(3, pricerate);
	                statement.setString(4, registrationNo);
	                
	                int rs = statement.executeUpdate();
	                
	                if (rs > 0) {
	                    isSuccess = true;
	                } else {
	                    isSuccess = false;
	                }
	            }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	}


public static boolean deleteVehicle(String registrationNo) {
    boolean isSuccess = false;

    try {
    		con = DBConnect.getConnection();
    		statement = con.createStatement();
      
            String sql = "DELETE FROM vehicle_info WHERE Vehicle_registrationNumber=?";
            try (PreparedStatement statement = con.prepareStatement(sql)) {
                statement.setString(1, registrationNo);

                int rs = statement.executeUpdate();

                if (rs > 0) {
                    isSuccess = true;
                } else {
                    isSuccess = false;
                }
            }
        
    } catch (Exception e) {
        e.printStackTrace();
    }
    return isSuccess;
}
}
