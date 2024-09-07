package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import context.DBConnect;
import entity.Category;
import entity.Product;
import entity.ProductImage;
import entity.ProductVariant;
import entity.Review;
import entity.User;

public class DAO_Product {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public List<Product> getAllProduct(){
		List<Product> list = new ArrayList<Product>();
		String query = "select * from Product";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Product(
						rs.getInt(1),
						rs.getString(2),
						rs.getDouble(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)
						));
			}
		} catch (Exception e) {
			
		}
		return list;
	}
	
	public List<Product> gettop4pProduct(int id, int cateID){
		List<Product> list = new ArrayList<Product>();
		String query = "SELECT TOP 4 p.*\r\n"
				+ "FROM Category c \n"
				+ "INNER JOIN Product p ON p.cateID = c.cid\r\n"
				+ "WHERE c.cid = ? AND p.id <> ?;";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, cateID);
			ps.setInt(2, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Product(
						rs.getInt(1),
						rs.getString(2),
						rs.getDouble(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)
						));
			}
		} catch (Exception e) {
			
		}
		return list;
	}
	
	public List<Product> searchProduct(String txtSearch){
		List<Product> list = new ArrayList<Product>();
		String query = "select * from Product where title like ? or name like ? or description like ?";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, "%"+txtSearch+"%");
			ps.setString(2, "%"+txtSearch+"%");
			ps.setString(3, "%"+txtSearch+"%");
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Product(
						rs.getInt(1),
						rs.getString(2),
						rs.getDouble(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)
						));
			}
		} catch (Exception e) {
			
		}
		return list;
	}
	
	public ProductImage get1ImageByProductID(int id){
		String query = "select top 1 * from ProductImage where product_id = ?";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				Product p = new Product(rs.getInt(1));
				return new ProductImage(p
						, rs.getString(2));
			}
		} catch (Exception e) {
			
		}
		return null;
	}
	
	public List<String> getAllImagebyProductID(int id){
		List<String> list = new ArrayList<String>();
		String query = "select i.* from ProductImage i\r\n"
				+ "inner join Product p on p.id = i.product_id where p.id = ?";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				list.add("Imgs/" +rs.getString(2));			
				}
		} catch (Exception e) {
			
		}
		return list;
	}
	
	public List<Product> getAllProductByID(String cateid){
		List<Product> list = new ArrayList<Product>();
		String query = "select * from Product where cateid = ?";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, cateid);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Product(
						rs.getInt(1),
						rs.getString(2),
						rs.getDouble(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)
						));
			}
		} catch (Exception e) {
			
		}
		return list;
	}
	
	public List<Product> get10NewProduct(){
		List<Product> list = new ArrayList<Product>();
		String query = "select top 10 * from Product \n"
				+ "order by id desc";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Product(
						rs.getInt(1),
						rs.getString(2),
						rs.getDouble(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)
						));
			}
		} catch (Exception e) {
			
		}
		return list;
	}
	
	public List<Category> getAllCategory(){
		List<Category> list = new ArrayList<Category>();
		String query = "select * from Category";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Category(
						rs.getInt(1),
						rs.getString(2)
						));
			}
		} catch (Exception e) {
			
		}
		return list;
	}
	
	public Product getBestSellerProduct(){
		String query = "select * from Product\n"
				+ "where id = '5'";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				return new Product(
						rs.getInt(1),
						rs.getString(2),
						rs.getDouble(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)
						);
			}
		} catch (Exception e) {
			
		}
		return null;
	}
	
	public Product getProductByID(String id){
		String query = "select * from Product\n"
				+ "where id = ?";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				return new Product(
						rs.getInt(1),
						rs.getString(2),
						rs.getDouble(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)
						);
			}
		} catch (Exception e) {
			
		}
		return null;
	}
	
	public ProductVariant getProducVarianttByID(String id){
		String query = "select * from ProductVariant \r\n"
				+ "where product_id = ?";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				return new ProductVariant(rs.getInt(1), 
						new Product(rs.getInt(2)), 
						rs.getString(3),
						rs.getInt(4),
						rs.getInt(5));
			}
		} catch (Exception e) {
			
		}
		return null;
	}
	
	public ProductVariant getProducVarianttByIDandSize(String id, String size){
		String query = "select * from ProductVariant \r\n"
				+ "where product_id = ? and size = ?";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			ps.setString(2, size);
			rs = ps.executeQuery();
			while(rs.next()) {
				return new ProductVariant(rs.getInt(1), 
						new Product(rs.getInt(2)), 
						rs.getString(3),
						rs.getInt(4),
						rs.getInt(5));
			}
		} catch (Exception e) {
			
		}
		return null;
	}
	
	public Integer getNumReview(int id) {
	    String query = "SELECT COUNT(*) as count FROM Review WHERE product_id = ?";
	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	        ps.setInt(1, id);
	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                return rs.getInt("count");
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null;
	}

	
	public List<Review> getAllReviewbyProductId(int id){
		List<Review> list = new ArrayList<Review>();
		String query = "select r.* from Product p \n"
				+ "inner join Review r on r.product_id = p.id \n"
				+ "inner join [User] u on u.user_id = r.user_id \n"
				+ " where p.id = ?";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Review(rs.getInt(1),
						new Product(rs.getInt(2)),
						new User(rs.getInt(3)),
						rs.getInt(4),
						rs.getString(5),
						rs.getString(6)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Integer> getAllSizefromProduct(int porudct_id){
		List<Integer> list = new ArrayList<Integer>();
		String query = "select size from ProductVariant \r\n"
				+ "where product_id = ?";
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, porudct_id);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt("size"));
			}
		} catch (Exception e) {
			
		}
		return list;
	}
	
	public static void main(String[] args) {
		DAO_Product dao = new DAO_Product();
		ProductImage pi = dao.get1ImageByProductID(5);
		System.out.println(pi);
		
	}
}
