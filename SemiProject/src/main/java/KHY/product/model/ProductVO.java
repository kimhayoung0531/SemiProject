package KHY.product.model;

import sge.member.model.MemberVO;

public class ProductVO {
	
	private long product_num;
	private long category_num;
	private String product_title;
	private String main_image;
	private long product_price;
	private String product_detail;
	private long product_inventory;
	private String product_date;
	private int sale_count;
	private long mileage;
	
	private long totalPrice;
	private long totalMileage;
	
	public ProductVO() {
		
	}
	
	//select용
	private MemberVO mvo;
	
	public ProductVO(long product_num, long category_num, String product_title, String main_image, long product_price,
			String product_detail, long product_inventory, String product_date, int sale_count) {
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
	
	/////////////////////////////////////////////////
	// *** 제품의 총판매가(실제판매가 * 주문량) 구해오기 ***
	public void setTotalPriceTotalPoint(int oqty) {   
		// int oqty 이 주문량이다.
	
		totalPrice = product_price * oqty; // 판매당시의 제품판매가 * 주문량
		totalMileage = mileage * oqty;     // 판매당시의 포인트점수 * 주문량 
	}
	
	public long getMileage() {
		return mileage;
	}

	public long getProduct_num() {
		return product_num;
	}

	public void setProduct_num(long product_num) {
		this.product_num = product_num;
	}

	public long getCategory_num() {
		return category_num;
	}

	public void setCategory_num(long category_num) {
		this.category_num = category_num;
	}

	public String getProduct_title() {
		return product_title;
	}

	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}

	public String getMain_image() {
		return main_image;
	}

	public void setMain_image(String main_image) {
		this.main_image = main_image;
	}

	public long getProduct_price() {
		return product_price;
	}

	public void setProduct_price(long product_price) {
		this.mileage = product_price/100;
		this.product_price = product_price;
	}

	public String getProduct_detail() {
		return product_detail;
	}

	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}

	public long getProduct_inventory() {
		return product_inventory;
	}

	public void setProduct_inventory(long product_inventory) {
		this.product_inventory = product_inventory;
	}

	public String getProduct_date() {
		return product_date;
	}

	public void setProduct_date(String product_date) {
		this.product_date = product_date;
	}

	public int getSale_count() {
		return sale_count;
	}

	public void setSale_count(int sale_count) {
		this.sale_count = sale_count;
	}

	public MemberVO getMvo() {
		return mvo;
	}

	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}

	

	
	
	
}
