package jinsol.cart.model;

import parkjuneyub.product.model.ProductVO;
import sge.member.model.MemberVO;

public class CartVO{
	private int cart_num;
	private int product_count;
	private int main_image;
	private int product_price;
	private String cart_date;

	// select용
	private MemberVO user_id;

	private MemberVO mvo;
	
	
	////////////////////////////////////////////////////
	// Getter Setter

	
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
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
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
	private ProductVO pvo; 
	public CartVO() {}


	///////////////////////////////////////////////////


}