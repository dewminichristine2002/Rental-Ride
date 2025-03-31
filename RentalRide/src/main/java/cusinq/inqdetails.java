package cusinq;
//encapsulation
public class inqdetails {
	
	private int id;
	private String name;
	private String email;
	private String msg;
	
	public inqdetails(int id, String name, String email, String msg) {
		//super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.msg = msg;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getMsg() {
		return msg;
	}

	

}

