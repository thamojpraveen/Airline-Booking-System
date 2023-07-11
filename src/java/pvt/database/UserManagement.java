package pvt.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pvt.modules.StaffMember;
import pvt.modules.User;

public class UserManagement {
	DbConnection db=new DbConnection();
	private Connection con =db.getConnection();
	
	public int addNewStaffMember(StaffMember stm) {
		int result=0;
		try {
			String query="insert into user(name,email,password,dob,address,role,status) values(?,?,?,?,?,?,?)";
			PreparedStatement st=con.prepareStatement(query);
			
			st.setString(1, stm.getName());
			st.setString(2, stm.getEmail());
			st.setString(3, stm.getPassword());
			st.setString(4, stm.getDob());
			st.setString(5, stm.getAddress());
			st.setString(6, stm.getRole());
			st.setString(7, stm.getAcc_status());
			
			result=st.executeUpdate();
			
			
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		System.out.println(result);
		return result;
	}
	
	public int addNewUser(User user) {
		int result=0;
		try {
			String query="insert into user(name,email,password,dob,address,role) values(?,?,?,?,?,?)";
			PreparedStatement st=con.prepareStatement(query);
			
			st.setString(1, user.getName());
			st.setString(2, user.getEmail());
			st.setString(3, user.getPassword());
			st.setString(4, user.getDob());
			st.setString(5, user.getAddress());
			st.setString(6, user.getRole());
			
			result=st.executeUpdate();
			
			
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		System.out.println(result);
		return result;
	}
	
	
	public int checkUser(User user) {
		int result=0;
		try {
			String query="select * from user where email=? and password=?;";
			PreparedStatement st=con.prepareStatement(query);
			st.setString(1, user.getEmail());
			st.setString(2,user.getPassword());
			
			ResultSet rs=st.executeQuery();
			if(rs.next()) {
				String status=rs.getString("status");
				String role=rs.getString("role");
				
				if(status.equals("Activated")) {
					if(role.equals("Level 1")) {
						result=1;
					}
					else if(role.equals("Level 2")) {
						System.out.println(role);
						result=2;
					}
					else if(role.equals("User")) {
						result=3;
					}
					else if(role.equals("Admin")) {
						result=4;
					}
					
				}
				
			}
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		return result;
	}
	
	public List<StaffMember> getStaffMembers(){
		List<StaffMember> list=new ArrayList<StaffMember>();
		try {
			String query="select * from user where role=? or role=? order by id desc";
			PreparedStatement st=con.prepareStatement(query);
			st.setString(1, "Level 1");
			st.setString(2, "Level 2");
			
			ResultSet rs=st.executeQuery();
			
			while(rs.next()) {
				StaffMember sm=new StaffMember();
				
				sm.setId(rs.getInt("id"));
				sm.setName(rs.getString("name"));
				sm.setEmail(rs.getString("email"));
				sm.setAcc_status(rs.getString("status"));
				sm.setAddress(rs.getString("address"));
				sm.setDob(rs.getString("dob"));
				sm.setPassword(rs.getString("password"));
				sm.setRole(rs.getString("role"));
				
				list.add(sm);
			}
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		
		return list;
	}
	
	public int activateStaffMember(StaffMember sm) {
		int result=0;
		try {
			String query="update user set status=? where id=?";
			PreparedStatement st=con.prepareStatement(query);
			
			st.setString(1, "Activated");
			st.setInt(2, sm.getId());
			
			result=st.executeUpdate();
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		return result;
	}
	
	public int deActivateStaffMember(StaffMember sm) {
		int result=0;
		try {
			String query="update user set status=? where id=?";
			PreparedStatement st=con.prepareStatement(query);
			
			st.setString(1, "De-Activated");
			st.setInt(2, sm.getId());
			
			result=st.executeUpdate();
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		return result;
	}
	
	public int removeStaffMember(StaffMember sm) {
		int result=0;
		try {
			String query="update user set status=? where id=?";
			PreparedStatement st=con.prepareStatement(query);
			
			st.setString(1, "Removed");
			st.setInt(2, sm.getId());
			
			result=st.executeUpdate();
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		return result;
	}
	
	
	public List<User> getUsers(){
		List<User> list=new ArrayList<User>();
		try {
			String query="select * from user where role=? order by id desc";
			PreparedStatement st=con.prepareStatement(query);
			st.setString(1, "User");
			
			
			ResultSet rs=st.executeQuery();
			
			while(rs.next()) {
				User user=new User();
				
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setAddress(rs.getString("address"));
				user.setDob(rs.getString("dob"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));
				user.setAcc_status(rs.getString("status"));
				
				list.add(user);
			}
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		
		return list;
	}
	
	public void addLoginDetails(String email,String role,String ip) {
		try {
			String query="update login_details set time=now(),ip=? where email=?;";
			PreparedStatement st=con.prepareStatement(query);
			st.setString(1, ip);
			st.setString(2, email);
			
			int result=st.executeUpdate();
			
			if(result>0) {
				//System.out.println("Done....");
			}
			else {
				query="insert into login_details values(?,?,now(),?);";
				st=con.prepareStatement(query);
				st.setString(1, email);
				st.setString(2, role);
				st.setString(3, ip);
				
				result=st.executeUpdate();
				if(result>0) {
					//System.out.println("Done....");
				}
			}
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
	}
	
	public ResultSet getLoginDetails() {
		ResultSet rs=null;
		try {
			String query="select * from login_details order by time desc;";
			PreparedStatement st=con.prepareStatement(query);
			
			rs=st.executeQuery();
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
		
		
		return rs;
	}
	
	public int updateProfile(User user) {
		int result=0;
		try {
			String query="update user set name=?,email=?,password=?,dob=?,address=?,role=? where id=?";
			PreparedStatement st=con.prepareStatement(query);
			
			st.setString(1, user.getName());
			st.setString(2, user.getEmail());
			st.setString(3, user.getPassword());
			st.setString(4, user.getDob());
			st.setString(5, user.getAddress());
			st.setString(6, user.getRole());
			st.setInt(7, user.getId());
			System.out.println(user.getId());
			result=st.executeUpdate();
			
			
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		return result;
	}
	
	public User viewProfile(User user) {
		try {
			String query="select * from user where email=?";
			PreparedStatement st=con.prepareStatement(query);
			
			st.setString(1, user.getEmail());
			
			ResultSet rs=st.executeQuery();
			
			if(rs.next()) {
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setAddress(rs.getString("address"));
				user.setDob(rs.getString("dob"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));
				user.setAcc_status(rs.getString("status"));
			}
		}
		catch(SQLException ex) {
			System.out.println(ex.getMessage());
		}
		
		
		return user;
	}
	
}
