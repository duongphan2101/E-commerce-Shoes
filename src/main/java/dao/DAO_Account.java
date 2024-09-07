package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import context.DBConnect;
import entity.Account;
import entity.User;

public class DAO_Account {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public Account getAccount(String username, String pass){
		String query = "select * from Account where username = ? and password = ?";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			while(rs.next()) {
				return new Account(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getInt(5));
			}
		} catch (Exception e) {
			
		}
		return null;
	}
	
	public void updatePassword(String pass, int id) {
		 String query = "update Account set password = ? where uid = ?";
		 try {
				new DBConnect();
				conn = DBConnect.getConnection();
				ps = conn.prepareStatement(query);
				ps.setString(1, pass);			
				ps.setInt(2, id);
				ps.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	public Integer getLastUid() {
	    String query = "SELECT TOP 1 uID FROM Account ORDER BY uID DESC";
	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query);
	         ResultSet rs = ps.executeQuery()) {
	        if (rs.next()) {
	            return rs.getInt("uID");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
	public Account checkAccount(String username){
		String query = "select * from Account where username = ? ";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while(rs.next()) {
				return new Account(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getInt(5));
			}
		} catch (Exception e) {
			
		}
		return null;
	} 
	
	public void addAccount(Account a){
		String query = "INSERT INTO Account(username, password, isSell, isAdmin) VALUES (?, ?, ?, ?)";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, a.getUsername());
			ps.setString(2, a.getPassword());
			ps.setInt(3, a.getIsSell());
			ps.setInt(4, a.getIsAdmin());
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addUser(User a){
		String query = "INSERT INTO [user](uID, name, phone_number, idnumber, address) VALUES (?, ?, ?, ?, ?)";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, a.getAccount().getuID());
			ps.setString(2, a.getName());
			ps.setString(3, a.getPhone_number());
			ps.setString(4, a.getIdnumber());
			ps.setString(5, a.getAddress());
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public User getUserbyuID(int accID){
		String query = "select u.* from [user] u inner join Account a\r\n"
				+ "on a.uID = u.uID where a.uID = ?";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, accID);
			rs = ps.executeQuery();
			while(rs.next()) {
				return new User(rs.getInt(1),
						new Account(rs.getInt(2)),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6));
			}
		} catch (Exception e) {
			
		}
		return null;
	}
	
	public static void main(String[] args) {
		DAO_Account dao = new DAO_Account();
		User u = dao.getUserbyuID(6);
		System.out.println(u);
	}
}
