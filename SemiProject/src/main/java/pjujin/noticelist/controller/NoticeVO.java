package pjujin.noticelist.controller;

public class NoticeVO {
	private int notice_num;
	private String admin_id;	
	private String notice_title;
	private String notice_content;
	private String notice_date;
	private String notice_writer;
	private int notice_viewcount;
	private String notice_head;
	
	private int inquiry_num;
	private String user_id;
	private int product_num;
	private String inquiry_title;
	private String inquiry_text;
	private String inquiry_date;
	private String inquiry_state;
	private String inquiry_answer_time;
	private int inquiry_view_count;
	
	
	
	public NoticeVO() {}
	
	public NoticeVO(int notice_num, String admin_id, String notice_title, String notice_content, String notice_date, String notice_writer, int notice_viewcount, String notice_head
				,int inquiry_num, String user_id, int product_num, String inquiry_title, String inquiry_text, String inquiry_date, String inquiry_state, String inquiry_answer_time, int inquiry_view_count ) {
		
		this.notice_num = notice_num;
		this.admin_id = admin_id;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_writer = notice_writer;
		this.notice_viewcount = notice_viewcount;
		this.notice_head = notice_head;
		
		this.inquiry_num = inquiry_num;
		this.user_id = user_id;
		this.product_num = product_num;
		this.inquiry_title = inquiry_title;
		this.inquiry_text = inquiry_text;
		this.inquiry_date = inquiry_date;
		this.inquiry_state = inquiry_state;
		this.inquiry_answer_time = inquiry_answer_time;
		this.inquiry_view_count = inquiry_view_count;
	}
	///////////////////////////////////////////////////////
	
	public int getNotice_num() {
		return notice_num;
	}

	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	
	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	
	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	
	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	
	public String getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	
	public String getNotice_writer() {
		return notice_writer;
	}

	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	
	public int getNotice_viewcount() {
		return notice_viewcount;
	}

	public void setNotice_viewcount(int notice_viewcount) {
		this.notice_viewcount = notice_viewcount;
	}
	
	public String getNotice_head() {
		return notice_head;
	}

	public void setNotice_head(String notice_head) {
		this.notice_head = notice_head;
	}
	
	

	public int getInquiry_num() {
		return inquiry_num;
	}

	public void setInquiry_num(int inquiry_num) {
		this.inquiry_num = inquiry_num;
	}
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	
	public String getInquiry_title() {
		return inquiry_title;
	}

	public void setInquiry_title(String inquiry_title) {
		this.inquiry_title = inquiry_title;
	}
	
	public String getInquiry_text() {
		return inquiry_text;
	}

	public void setInquiry_text(String inquiry_text) {
		this.inquiry_text = inquiry_text;
	}
	
	public String getInquiry_date() {
		return inquiry_date;
	}

	public void setInquiry_date(String inquiry_date) {
		this.inquiry_date = inquiry_date;
	}
	
	public String getInquiry_state() {
		return inquiry_state;
	}

	public void setInquiry_state(String inquiry_state) {
		this.inquiry_state = inquiry_state;
	}
	
	public String getInquiry_answer_time() {
		return inquiry_answer_time;
	}

	public void setInquiry_answer_time(String inquiry_answer_time) {
		this.inquiry_answer_time = inquiry_answer_time;
	}
	
	public int getInquiry_view_count() {
		return inquiry_view_count;
	}

	public void setInquiry_view_count(int inquiry_view_count) {
		this.inquiry_view_count = inquiry_view_count;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
