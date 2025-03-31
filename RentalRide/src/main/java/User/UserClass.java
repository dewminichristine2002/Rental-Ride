package User;

public class UserClass {

	private String username;
    private String usertype;
    private String email;
    private String phone;	
    
    

    public UserClass(String username, String usertype, String email, String phone) {
	
		this.username = username;
		this.usertype = usertype;
		this.email = email;
		this.phone = phone;
	}
    
    
	public String getUsername() {
		return username;
	}
	
	public String getUsertype() {
		return usertype;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getPhone() {
		return phone;
	}
	

}
