package entity;

public class ProductVariant {
	private int variant_id;
	private Product product;
	private String size;
	private int stock_quantity;
	private int amount;
	
	public ProductVariant() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProductVariant(int variant_id, Product product, String size, int stock_quantity, int amount) {
		super();
		this.variant_id = variant_id;
		this.product = product;
		this.size = size;
		this.stock_quantity = stock_quantity;
		this.amount = amount;
	}

	public int getVariant_id() {
		return variant_id;
	}

	public void setVariant_id(int variant_id) {
		this.variant_id = variant_id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getStock_quantity() {
		return stock_quantity;
	}

	public void setStock_quantity(int stock_quantity) {
		this.stock_quantity = stock_quantity;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "ProductVariant [variant_id=" + variant_id + ", product=" + product + ", size=" + size
				+ ", stock_quantity=" + stock_quantity + ", amount=" + amount + "]";
	}
	
}
