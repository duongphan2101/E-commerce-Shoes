package entity;

public class User {
	private int user_id;
	private Account account;
	private String name, phone_number, idnumber, address;
	
	public User() {
		super();
		
	}
	
	public User(int user_id) {
		super();
		this.user_id = user_id;
	}

	public User(int user_id, Account account, String name, String phone_number, String idnumber, String address) {
		super();
		this.user_id = user_id;
		this.account = account;
		this.name = name;
		this.phone_number = phone_number;
		this.idnumber = idnumber;
		this.address = address;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getIdnumber() {
		return idnumber;
	}

	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", account=" + account + ", name=" + name + ", phone_number=" + phone_number
				+ ", idnumber=" + idnumber + ", address=" + address + "]";
	}
}
