package entity;

public class ProductImage {
	private Product product;
	private String image;
	public ProductImage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductImage(Product product, String image) {
		super();
		this.product = product;
		this.image = image;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "ProductImage [product=" + product + ", image=" + image + "]";
	}	
}
