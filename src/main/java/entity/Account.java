package entity;

public class Account {
	private int uID;
	private String username;
	private String password;
	private int isSell;
	private int isAdmin;
	public Account() {
		super();
		
	}
	
	public Account(int uID) {
		super();
		this.uID = uID;
	}
	public Account(int uID, String username, String password, int isSell, int isAdmin) {
		super();
		this.uID = uID;
		this.username = username;
		this.password = password;
		this.isSell = isSell;
		this.isAdmin = isAdmin;
	}
	public int getuID() {
		return uID;
	}
	public void setuID(int uID) {
		this.uID = uID;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getIsSell() {
		return isSell;
	}
	public void setIsSell(int isSell) {
		this.isSell = isSell;
	}
	public int getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
	@Override
	public String toString() {
		return "Account [uID=" + uID + ", username=" + username + ", password=" + password + ", isSell=" + isSell
				+ ", isAdmin=" + isAdmin + "]";
	}
	
}
