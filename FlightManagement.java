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
				
				flights.add(f);
			}
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		
		return flights;
	}