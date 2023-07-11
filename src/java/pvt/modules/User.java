package pvt.modules;

import java.util.ArrayList;
import java.util.List;

import pvt.database.TicketManagement;
import pvt.database.UserManagement;

public class User {
	private int id;
	private String name;
	private String dob;
	private String email;
	private String address;
	private String password;
	private String role;
	private String acc_status;
	
	public User() {
		
	}
	
	public User(String name, String dob, String email, String address, String password, String role) {
		super();
		this.name = name;
		this.dob = dob;
		this.email = email;
		this.address = address;
		this.password = password;
		this.role = role;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

	public String getAcc_status() {
		return acc_status;
	}

	public void setAcc_status(String acc_status) {
		this.acc_status = acc_status;
	}
	
	public void viewFlightDetails() {
		
	}
	
	public int reserveTicket(Ticket ticket) {
		int result=0;
		TicketManagement tm=new TicketManagement();
		result=tm.generateTicket(ticket);
		return result;
	}
	
	public List<Ticket> viewTickets(Ticket ticket){
		List<Ticket> tickets=new ArrayList<Ticket>();
		TicketManagement tm=new TicketManagement();
		tickets=tm.getTickets(ticket);
		return tickets;
	}
	
	public int updateTicket(Ticket ticket) {
		int result=0;
		TicketManagement tm=new TicketManagement();
		result=tm.updateTicket(ticket);
		
		return result;
	}
	
	public int updateProfile(User user) {
		int result=0;
		
		UserManagement um=new UserManagement();
		um.updateProfile(user);
		
		return result;
	}
}
