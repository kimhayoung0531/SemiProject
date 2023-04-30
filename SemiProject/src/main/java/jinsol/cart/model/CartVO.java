package jinsol.cart.model;

import parkjuneyub.product.model.ProductVO;
import sge.member.model.MemberVO;

public class CartVO{
	
	// * insert 용 * 
	private long cart_num;		//장바구니 번호
	private String user_id;		//사용자 ID(fk)
	private long product_num;	//제품 번호
	private long product_count;	//제품 수량
	private long main_image;	//제품 이미지
	private String cart_date;	//장바구니 날짜

	// * select용 *
	private MemberVO mvo;
	private ProductVO pvo;
	

	/* 기본생성자 */
	public CartVO() {}
	
	public CartVO(long cart_num, String user_id, long product_num, long product_count ,
			long main_image, String cart_date,MemberVO mvo, ProductVO pvo) {
		this.cart_num = cart_num;
		this.user_id = user_id;
		this.product_num = product_num;
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


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
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


	///////////////////////////////////////////////////

	// *** 제품의 마일리지 (1%) 구하기 ***
	public long getMileagePercent() {
		
		long mileage = (pvo.getProduct_price() / 100);
		
		return mileage;
	}
	
	
	/////////////////////////////////////////////////
	

	/////////////////////////////////////////////////
	// *** 제품의 총판매가(실제판매가 * 주문량) 구해오기 ***
	public void setTotalPriceTotalMileage(long product_count) {   
	
		totalPrice = pvo.getProduct_price() * product_count; // 판매당시의 제품판매가 * 주문량
		totalMileage = pvo.getMileage() * product_count;     // 판매당시의 포인트점수 * 주문량 
	}
	
	public long getTotalPrice() {
		return totalPrice;
	}
	
	public long getTotalMileage() {
		return totalMileage;
	}
	
}