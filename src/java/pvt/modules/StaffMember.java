package pvt.modules;

import pvt.database.FlightManagement;

public class StaffMember extends User{
	private String acc_status;
	
	public StaffMember() {
		super();
		
	}

	public StaffMember(String name, String dob, String email, String address, String password, String role) {
		super(name, dob, email, address, password, role);
		this.acc_status="Pending";
	}

	public String getAcc_status() {
		return acc_status;
	}

	public void setAcc_status(String acc_status) {
		this.acc_status = acc_status;
	}
	
	public int addNewFlightDetails(Flight flight) {
		FlightManagement fm=new FlightManagement();
		int result=0;
		result=fm.addFlight(flight);
		return result;
	}
}
