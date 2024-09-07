package entity;

public class Item {
	private String id, size, quantity;

	
	public Item() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Item(String id, String size, String quantity) {
		super();
		this.id = id;
		this.size = size;
		this.quantity = quantity;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getSize() {
		return size;
	}


	public void setSize(String size) {
		this.size = size;
	}


	public String getQuantity() {
		return quantity;
	}


	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}


	@Override
	public String toString() {
		return "Item [id=" + id + ", size=" + size + ", quantity=" + quantity + "]";
	}
}
	
	
	
	
