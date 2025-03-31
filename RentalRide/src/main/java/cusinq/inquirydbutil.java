package cusinq;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class inquirydbutil {
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	
	public static List<inqdetails> validate(String name1){
		
		
		
		ArrayList<inqdetails> inqde = new ArrayList<>();
		
	
		
		try {
			
			con = DBConnect.getConnection();
		    stmt = con.createStatement();
			String sql = "select * from inqdetails where name ='"+name1+"' ";
			 rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				String msg = rs.getString(4);
				
				inqdetails i = new inqdetails(id,name,email,msg);
				inqde.add(i);
			}
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		
		
		
		return inqde;
		
	}
	
	//insert inquiry
	public static boolean insertinq(String name , String email ,String msg) {
		
		boolean isSuccess = false;
		
	
		
		try{
			con = DBConnect.getConnection();
			 stmt = con.createStatement();
			
			String sql = "INSERT INTO inqdetails(name, email, msg) VALUES('"+name+"','"+email+"','"+msg+"')";
			int inq = stmt.executeUpdate(sql);
			
			if(inq>0) {
				isSuccess = true;
				
			}else {
				
				isSuccess = false;
				
			}
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
			
			
		}
		
		
		return isSuccess;
		
		
	}
	
	public static boolean updatinq(String id , String name , String email , String msg) {
		
	boolean isSuccess = false;
		
		
		try{
			con = DBConnect.getConnection();
		 stmt = con.createStatement();
			
			String sql = "UPDATE inqdetails SET name='" + name + "', email='" + email + "', msg='" + msg + "' WHERE id='" + id + "'";

			int inq = stmt.executeUpdate(sql);
			
			if(inq>0) {
				isSuccess = true;
				
			}else {
				
				isSuccess = false;
				
			}
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
			
			
		}
		
		
		return isSuccess;
	
		
	}
	
	
	
	public static boolean deletinq(String name) {
		
		boolean isSuccess = false;
		
	
		
		
		
		try {
			con = DBConnect.getConnection();
			
		 stmt = con.createStatement()
;		
			
			
		String sql = "DELETE FROM inqdetails WHERE name = '" + name + "'";
		int r = stmt.executeUpdate(sql);
		
		if(r>0) {
			
			isSuccess = true;
		}
		else {
			isSuccess = false;
		}
		
		
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
			
			
		}
		
		
		return isSuccess;
	}	
	
	
	
	
	
	
	

}