package jinsol.cart.model;

import parkjuneyub.product.model.ProductVO;
import sge.member.model.MemberVO;

public class CartVO{
	
	// * insert 용 * 
	private long cart_num;
	private long product_count;
	private long main_image;
	private String cart_date;

	// * select용 *
	private MemberVO mvo;
	private ProductVO pvo;
	

	/* 기본생성자 */
	public CartVO() {}
	
	public CartVO(long cart_num, long product_count, long main_image, String cart_date, MemberVO mvo, ProductVO pvo) {
		this.cart_num = cart_num;
		this.product_count = product_count;
		this.main_image = main_image;
		this.cart_date = cart_date;
		this.mvo = mvo;
		this.pvo = pvo;
		
	}
	/*
    제품판매가와 포인트점수 컬럼의 값은 관리자에 의해서 변경(update)될 수 있으므로
    해당 제품의 판매총액과 포인트부여 총액은 판매당시의 제품판매가와 포인트 점수로 구해와야 한다.  
	 */
	private long totalPrice;         // 판매당시의 한 제품에 대한 제품판매가 * 주문량

	private long totalMileage;         // 판매당시의 한 제품에 대한 마일리지 * 주문량 




	///////////////////////////////////////////////////
	// GETTER SETTER
	
	
	
	public long getCart_num() {
		return cart_num;
	}


	public void setCart_num(long cart_num) {
		this.cart_num = cart_num;
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


	public long getTotalMileage() {
		return totalMileage;
	}


	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}


	
	///////////////////////////////////////////////////

	// *** 제품의 마일리지 (1%)  ***
	public long getmileage() {
		
		long mileage =  pvo.getProduct_price() / 100;
		
		return mileage;
	}
	
	
	/////////////////////////////////////////////////
	

	// *** 제품의 총판매가(실제판매가 * 주문량) 구해오기 ***
	public void setTotalMileage(long item_cnt) {   
		// int oqty 이 주문량이다.
	
		totalPrice = pvo.getProduct_price() * item_cnt; // 판매당시의 제품판매가 * 주문량
		totalMileage = pvo.getMileage() * item_cnt;     // 판매당시의 포인트점수 * 주문량 
	}
	
	public long getTotalPrice() {
		return totalPrice;
	}
	
	public long getTotalPoint() {
		return totalMileage;
	}
	
}