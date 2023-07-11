package pvt.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pvt.modules.Flight;

public class FlightManagement {
	DbConnection db=new DbConnection();
	private Connection con =db.getConnection();
	
	
	public List<Flight> getFlightDetails(){
		List<Flight> flights=new ArrayList<Flight>();
		try {
			String query="select * from flight;";
			PreparedStatement st=con.prepareStatement(query);
			ResultSet rs=st.executeQuery();
			
			while(rs.next()) {
				Flight f=new Flight();
				f.setId(rs.getInt("flightId"));
				f.setFlightNumber(rs.getString("flightNumber"));
				f.setDate(rs.getString("date"));
				f.setArrivalTime(rs.getString("arrivalTime"));
				f.setDepartTime(rs.getString("departTime"));
				f.setNumberOfSeats(rs.getInt("numberOfSeats"));
				f.setTicketPrice(rs.getDouble("ticketPrice"));
				f.setDepartLocation(rs.getString("departLocation"));
				f.setArrivalLocation(rs.getString("arrivalLocation"));
				
				flights.add(f);
			}
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		
		return flights;
	}
	
	public int addFlight(Flight flight) {
		int result=0;
		try {
			String query="insert into flight(flightNumber,departTime,arrivalTime,numberOfSeats,ticketPrice,date,departLocation,arrivalLocation) values(?,?,?,?,?,?,?,?);";
			PreparedStatement st=con.prepareStatement(query);
			
			st.setString(1, flight.getFlightNumber());
			st.setString(2, flight.getDepartTime());
			st.setString(3, flight.getArrivalTime());
			st.setInt(4, flight.getNumberOfSeats());
			st.setDouble(5, flight.getTicketPrice());
			st.setString(6, flight.getDate());
			st.setString(7, flight.getDepartLocation());
			st.setString(8, flight.getArrivalLocation());
			
			result=st.executeUpdate();
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		
		return result;
	}
	
	public Flight getOneFlightDetails(Flight flight) {
		
		try {
			String query="select * from flight where flightId=?;";
			PreparedStatement st=con.prepareStatement(query);
			st.setInt(1, flight.getId());
			ResultSet rs=st.executeQuery();
			
			if(rs.next()) {
				flight.setId(rs.getInt("flightId"));
				flight.setFlightNumber(rs.getString("flightNumber"));
				flight.setDate(rs.getString("date"));
				flight.setArrivalTime(rs.getString("arrivalTime"));
				flight.setDepartTime(rs.getString("departTime"));
				flight.setNumberOfSeats(rs.getInt("numberOfSeats"));
				flight.setTicketPrice(rs.getDouble("ticketPrice"));
				flight.setDepartLocation(rs.getString("departLocation"));
				flight.setArrivalLocation(rs.getString("arrivalLocation"));
				
				
			}
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		
		
		return flight;
	}
	
	public int updateFlight(Flight flight) {
		int result=0;
		try {
			String query="update flight set flightNumber=?,departTime=?,arrivalTime=?,numberOfSeats=?,ticketPrice=?,date=?,departLocation=?,arrivalLocation=? where flightId=?;";
			PreparedStatement st=con.prepareStatement(query);
			
			st.setString(1, flight.getFlightNumber());
			st.setString(2, flight.getDepartTime());
			st.setString(3, flight.getArrivalTime());
			st.setInt(4, flight.getNumberOfSeats());
			st.setDouble(5, flight.getTicketPrice());
			st.setString(6, flight.getDate());
			st.setString(7, flight.getDepartLocation());
			st.setString(8, flight.getArrivalLocation());
			st.setInt(9, flight.getId());
			
			result=st.executeUpdate();
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		return result;
	}
	
	public int deleteFlight(Flight flight) {
		int result=0;
		try {
			String query="delete from flight where flightId=?;";
			PreparedStatement st=con.prepareStatement(query);
			
			st.setInt(1, flight.getId());
			
			result=st.executeUpdate();
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		return result;
	}
}
