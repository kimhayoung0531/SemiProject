package jinsol.cart.model;

import sge.member.model.MemberVO;

public class CartVO implements InterCartDAO{

	private int order_num;
	private int product_num;
	private int product_count;
	private String cart_date;
	
	// select용
	private MemberVO user_id;
	
	public CartVO() {}

	
	
	////////////////////////////////////////////
	// Getter Setter
	
	
	
	
	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public int getProduct_count() {
		return product_count;
	}

	public void setProduct_count(int product_count) {
		this.product_count = product_count;
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
	
}
