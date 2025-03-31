package VehicleOwner;

public class Vehicle {

	private String registrationNo;
	private String model;
	private String features;
	private String pricerate;
	private String owner;
	
	
	public Vehicle(String registrationNo, String model, String features, String pricerate, String owner) {
		super();
		this.registrationNo = registrationNo;
		this.model = model;
		this.features = features;
		this.pricerate = pricerate;
		this.owner = owner;
	}


	public String getRegistrationNo() {
		return registrationNo;
	}


	public String getModel() {
		return model;
	}


	public String getFeatures() {
		return features;
	}


	public String getPricerate() {
		return pricerate;
	}


	public String getOwner() {
		return owner;
	}




	




	
	
}


