package entity;

public class Product {
	private int id;
	private String name;
	private double price;
	private String title;
	private String description;
	private String cateID, sellID;
	
	public Product() {
		super();
		
	}
	
	public Product(int id) {
		super();
		this.id = id;
	}

	public Product(int id, String name, double price, String title, String description, String cateID, String sellID) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.title = title;
		this.description = description;
		this.cateID = cateID;
		this.sellID = sellID;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCateID() {
		return cateID;
	}

	public void setCateID(String cateID) {
		this.cateID = cateID;
	}

	public String getSellID() {
		return sellID;
	}

	public void setSellID(String sellID) {
		this.sellID = sellID;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", title=" + title + ", description="
				+ description + ", cateID=" + cateID + ", sellID=" + sellID + "]";
	}
}
