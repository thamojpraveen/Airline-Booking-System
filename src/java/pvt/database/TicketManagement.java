package pvt.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pvt.modules.Ticket;

public class TicketManagement {
	DbConnection db=new DbConnection();
	private Connection con =db.getConnection();
	
	public int generateTicket(Ticket ticket) {
		int result=0;
		try {
			String query="insert into ticket_booking(numberOfSeats,email,flightId) values(?,?,?);";
			PreparedStatement st=con.prepareStatement(query);
			
			st.setInt(1, ticket.getNumberOfSeats());
			st.setString(2, ticket.getEmail());
			st.setInt(3, ticket.getFlightId());
	
			result=st.executeUpdate();
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		
		return result;
	}
	
	public List<Ticket> getTickets(Ticket t){
		List<Ticket> tickets=new ArrayList<Ticket>();
		
		try {
			String query="select * from ticket_booking where email=?;";
			PreparedStatement st=con.prepareStatement(query);
			
			
			st.setString(1, t.getEmail());
			
	
			ResultSet rs=st.executeQuery();
			
			while(rs.next()) {
				Ticket ticket=new Ticket();
				ticket.setEmail(rs.getString("email"));
				ticket.setFlightId(rs.getInt("flightId"));
				ticket.setId(rs.getInt("id"));
				ticket.setNumberOfSeats(rs.getInt("numberOfSeats"));
				ticket.setPaymentStatus(rs.getString("paymentStatus"));
				
				tickets.add(ticket);
				
			}
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		return tickets;
	}
	
	public Ticket getTicketDetails(Ticket ticket) {
		try {
			String query="select * from ticket_booking where id=?;";
			PreparedStatement st=con.prepareStatement(query);
			
			
			st.setInt(1, ticket.getId());
			
	
			ResultSet rs=st.executeQuery();
			
			while(rs.next()) {
				ticket.setEmail(rs.getString("email"));
				ticket.setFlightId(rs.getInt("flightId"));
				ticket.setId(rs.getInt("id"));
				ticket.setNumberOfSeats(rs.getInt("numberOfSeats"));
				ticket.setPaymentStatus(rs.getString("paymentStatus"));
				
				
			}
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		return ticket;
	}
	
	public int updateTicket(Ticket ticket) {
		int result=0;
		try {
			String query="update ticket_booking set numberOfSeats=?,email=?,flightId=? where id=?;";
			PreparedStatement st=con.prepareStatement(query);
			
			st.setInt(1, ticket.getNumberOfSeats());
			st.setString(2, ticket.getEmail());
			st.setInt(3, ticket.getFlightId());
			st.setInt(4, ticket.getId());
	
			result=st.executeUpdate();
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		return result;
	}
	
	public int deleteTicket(Ticket ticket) {
		int result=0;
		try {
			String query="delete from ticket_booking where id=?;";
			PreparedStatement st=con.prepareStatement(query);
			
			
			st.setInt(1, ticket.getId());
	
			result=st.executeUpdate();
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		return result;
	}
}
