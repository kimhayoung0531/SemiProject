package jinsol.cart.model;

import parkjuneyub.product.model.ProductVO;
import sge.member.model.MemberVO;

public class CartVO implements InterCartDAO{

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

	private long cart_num;
	private long product_num;
	private long product_count;
	private String cart_date;
	
	// select용
	private MemberVO mvo;
	private ProductVO pvo;
	 
	public CartVO() {}


	
	
	////////////////////////////////////////////
	// Getter Setter
	
	
	
	
	
}
