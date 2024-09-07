package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import context.DBConnect;
import entity.Account;
import entity.Product;
import entity.Review;
import entity.User;

public class DAO_User {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public User getUser(int uID) {
		String query = "select u.* from Account a \r\n"
				+ "inner join [User] u on u.uID = a.uID where u.uID = ?";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, uID);
			rs = ps.executeQuery();
			while(rs.next()) {
				return new User(rs.getInt(1),
						new Account(rs.getInt(2)) ,
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public User getUserbyUid(int userID) {
		String query = "select u.* from Review r \r\n"
				+ "inner join [User] u on u.user_id = r.user_id\r\n"
				+ "where u.user_id = ?";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, userID);
			rs = ps.executeQuery();
			while(rs.next()) {
				return new User(rs.getInt(1),
						new Account(rs.getInt(2)) ,
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void addReview(Review review) {
		String query = "INSERT INTO Review (product_id, user_id, rating, review_text, review_date)\n"
				+ "VALUES (?, ?, ?, ?, ?)";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, review.getProduct().getId());
			ps.setInt(2, review.getUser().getUser_id());
			ps.setInt(3, review.getRating());
			ps.setString(4, review.getReview_text());
			ps.setString(5, review.getReview_date());
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		DAO_User dao = new DAO_User();
		Review re = new Review(0, new Product(12), new User(2), 4, "Beauty", "2024-08-29");
		dao.addReview(re);
	}
}	
