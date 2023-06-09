package parkjuneyub.product.model;

import parkjuneyub.member.model.MemberVO;
import parkjuneyub.product.model.ProductVO;

public class CartVO {
	private long cart_num;
	private long product_num;
	private long product_count;
	private long main_image;
	private long product_price;
	private String cart_date;

	// select
	private MemberVO mvo;
	private ProductVO pvo; 
	public CartVO() {}



	private long totalPrice;         // 판매당시의 한 제품에 대한 제품판매가 * 주문량
	private long totalMileage;
	
	///////////////////////////////////////////////////
	// Getter Setter
	public long getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}

	public long getTotalMileage() {
		return totalMileage;
	}

	public void setTotalMileage(long totalMileage) {
		this.totalMileage = totalMileage;
	}
	public long getCart_num() {
		return cart_num;
	}

	public void setCart_num(long cart_num) {
		this.cart_num = cart_num;
	}

	public long getProduct_num() {
		return product_num;
	}

	public void setProduct_num(long product_num) {
		this.product_num = product_num;
	}

	public long getProduct_count() {
		return product_count;
	}

	public void setProduct_count(long product_count) {
		this.product_count = product_count;
	}

	public long getMain_image() {
		return main_image;
	}

	public void setMain_image(long main_image) {
		this.main_image = main_image;
	}

	public long getProduct_price() {
		return product_price;
	}

	public void setProduct_price(long product_price) {
		this.product_price = product_price;
	}

	public String getCart_date() {
		return cart_date;
	}

	public void setCart_date(String cart_date) {
		this.cart_date = cart_date;
	}


	public MemberVO getMvo() {
		return mvo;
	}

	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}


	public ProductVO getPvo() {
		return pvo;
	}
	public void setPvo(ProductVO pvo) {
		this.pvo = pvo;
	}

}
