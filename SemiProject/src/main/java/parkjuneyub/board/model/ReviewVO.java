package parkjuneyub.board.model;

import common.controller.AbstractController;
import parkjuneyub.member.model.MemberVO;

public class ReviewVO {
	private int purchase_review_id;
	private MemberVO mvo; // user_id 용
	private long order_details_num;
	private long product_num;
	private String review_content;
	private int review_rating;
	private String review_date;

	public ReviewVO() {}

	
	public int getPurchase_review_id() {
		return purchase_review_id;
	}



	public void setPurchase_review_id(int purchase_review_id) {
		this.purchase_review_id = purchase_review_id;
	}


	public MemberVO getMvo() {
		return mvo;
	}


	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}


	public long getOrder_details_num() {
		return order_details_num;
	}



	public void setOrder_details_num(long order_details_num) {
		this.order_details_num = order_details_num;
	}



	public long getProduct_num() {
		return product_num;
	}



	public void setProduct_num(long product_num) {
		this.product_num = product_num;
	}



	public String getReview_content() {
		return review_content;
	}



	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}



	public int getReview_rating() {
		return review_rating;
	}



	public void setReview_rating(int review_rating) {
		this.review_rating = review_rating;
	}



	public String getReview_date() {
		return review_date;
	}



	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
}
