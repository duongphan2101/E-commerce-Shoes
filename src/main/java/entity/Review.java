package entity;

public class Review {
	 private int review_id;
	 private  Product product;
	 private User user;
	 private int rating;
	 private String review_text, review_date;
	 
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Review(int review_id, Product product, User user, int rating, String review_text, String review_date) {
		super();
		this.review_id = review_id;
		this.product = product;
		this.user = user;
		this.rating = rating;
		this.review_text = review_text;
		this.review_date = review_date;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getReview_text() {
		return review_text;
	}

	public void setReview_text(String review_text) {
		this.review_text = review_text;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	@Override
	public String toString() {
		return "Review [review_id=" + review_id + ", product=" + product + ", user=" + user + ", rating=" + rating
				+ ", review_text=" + review_text + ", review_date=" + review_date + "]";
	}
}
