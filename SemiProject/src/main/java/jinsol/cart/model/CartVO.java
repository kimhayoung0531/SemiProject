package jinsol.cart.model;

import parkjuneyub.product.model.ProductVO;
import sge.member.model.MemberVO;

public class CartVO{
	
	// * insert 용 * 
	private int cart_num;
	private int product_count;
	private int main_image;
	private String cart_date;

	// * select용 *
	private MemberVO user_id;
	private ProductVO product_price;
	private ProductVO mileage;
	
	/* 기본생성자 */
	public CartVO() {}

	/*
    제품판매가와 포인트점수 컬럼의 값은 관리자에 의해서 변경(update)될 수 있으므로
    해당 제품의 판매총액과 포인트부여 총액은 판매당시의 제품판매가와 포인트 점수로 구해와야 한다.  
	 */
	private int totalPrice;         // 판매당시의 한 제품에 대한 제품판매가 * 주문량
	private int totalMileage;         // 판매당시의 한 제품에 대한 마일리지 * 주문량 



	///////////////////////////////////////////////////
	// GETTER SETTER
	
	
	
	public int getCart_num() {
		return cart_num;
	}


	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}


	public int getProduct_count() {
		return product_count;
	}


	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}


	public int getMain_image() {
		return main_image;
	}


	public void setMain_image(int main_image) {
		this.main_image = main_image;
	}


	public String getCart_date() {
		return cart_date;
	}


	public void setCart_date(String cart_date) {
		this.cart_date = cart_date;
	}


	public MemberVO getUser_id() {
		return user_id;
	}


	public void setUser_id(MemberVO user_id) {
		this.user_id = user_id;
	}


	public ProductVO getProduct_price() {
		return product_price;
	}


	public void setProduct_price(ProductVO product_price) {
		this.product_price = product_price;
	}


	public int getTotalMileage() {
		return totalMileage;
	}


	public void setTotalMileage(int totalMileage) {
		this.totalMileage = totalMileage;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	


	///////////////////////////////////////////////////

	// *** 제품의 마일리지 (1%)  ***
	public int getmileage() {
		
		int mileage =  (int)(product_price / 100);
		
		return mileage;
	}
	
	
	/////////////////////////////////////////////////
	

	// *** 제품의 총판매가(실제판매가 * 주문량) 구해오기 ***
	public void setTotalPriceTotalPoint(int item_cnt) {   
		// int oqty 이 주문량이다.
	
		totalPrice = product_price * item_cnt; // 판매당시의 제품판매가 * 주문량
		totalMileage = mileage * item_cnt;     // 판매당시의 포인트점수 * 주문량 
	}
	
	public int getTotalPrice() {
		return totalPrice;
	}
	
	public int getTotalPoint() {
		return totalPoint;
	}
	
}