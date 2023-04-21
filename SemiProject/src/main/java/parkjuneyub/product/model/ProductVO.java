package parkjuneyub.product.model;

public class ProductVO {
	
	private int product_num;
	private int category_num;
	private String product_title;
	private int main_image;
	private int product_price;
	private String product_detail;
	private String product_inventory;
	private int product_date;
	private int sale_count;
	
	
	
	public ProductVO(int product_num, int category_num, String product_title, int main_image, int product_price,
			String product_detail, String product_inventory, int product_date, int sale_count) {
		super();
		this.product_num = product_num;
		this.category_num = category_num;
		this.product_title = product_title;
		this.main_image = main_image;
		this.product_price = product_price;
		this.product_detail = product_detail;
		this.product_inventory = product_inventory;
		this.product_date = product_date;
		this.sale_count = sale_count;
	}
	
	public ProductVO() {
		
	}
	
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getCategory_num() {
		return category_num;
	}
	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}
	public String getProduct_title() {
		return product_title;
	}
	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}
	public int getMain_image() {
		return main_image;
	}
	public void setMain_image(int main_image) {
		this.main_image = main_image;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_detail() {
		return product_detail;
	}
	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}
	public String getProduct_inventory() {
		return product_inventory;
	}
	public void setProduct_inventory(String product_inventory) {
		this.product_inventory = product_inventory;
	}
	public int getProduct_date() {
		return product_date;
	}
	public void setProduct_date(int product_date) {
		this.product_date = product_date;
	}
	public int getSale_count() {
		return sale_count;
	}
	public void setSale_count(int sale_count) {
		this.sale_count = sale_count;
	}

	
}
