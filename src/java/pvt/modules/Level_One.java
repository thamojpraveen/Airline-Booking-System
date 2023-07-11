package pvt.modules;

import pvt.database.FlightManagement;

public class Level_One extends StaffMember {

	public Level_One() {
		super();
		
	}

	public Level_One(String name, String dob, String email, String address, String password, String role) {
		super(name, dob, email, address, password, role);
		
	}
	public void addFlightDetails() {
		
	}
	public int updateFlightDetails(Flight flight) {
		int result=0;
		
		FlightManagement fm=new FlightManagement();
		
		result=fm.updateFlight(flight);
		
		return result;
		
	}
	public int deleteFlightDetails(Flight flight) {
		int result=0;
		FlightManagement fm=new FlightManagement();
		
		result=fm.deleteFlight(flight);
		
		return result;
	}
	public void checkTicketDetails() {
		
	}
	public void updateTicketDetails() {
		
	}
	public void deleteTicketDetails() {
		
	}
	
	public void internalChat() {
		
	}
	
	
}
