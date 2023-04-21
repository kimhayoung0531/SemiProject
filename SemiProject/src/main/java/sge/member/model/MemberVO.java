package sge.member.model;

public class MemberVO {
	
	private String user_id;      		//아이디
	private String user_name;    		//이름
	private String pwd;          		//비밀번호
	private String email;        		//이메일
	private String mobile;              //휴대전화
	private String telephone;           //유선전화
	private String post_code;           //우편번호
	private String address;             //주소
	private String detailAddress;       //상세주소
	private String extraAddress;        //부가주소
	private String gender;              //성별
	private String birthday;            //생년월일
	private int mileage;             	//마일리지
	private String registerday;         //가입일자
	private String lastPwdChange;       //마지막비밀번호변경날짜
	private int idle;                   //휴먼회원여부
	private String pwd_change_required; //비밀번호갱신필요여부
	private int status;          		//탈퇴여부

	//select용 
	private boolean requirePwdChange = false;

	public MemberVO() {}
	
	//insert 용 
	public MemberVO(String user_id, String pwd, String user_name, String email, String mobile, String telephone,String post_code, String address, String detailAddress, String extraAddress, String gender, String birthday) {
		this.user_id = user_id;
		this.pwd = pwd;
		this.user_name = user_name;
		this.email = email;
		this.mobile = mobile;
		this.telephone = telephone;
		this.post_code = post_code;
		this.address = address;
		this.detailAddress = detailAddress;
		this.extraAddress = extraAddress;
		this.gender = gender;
		this.birthday = birthday;
	}

	///////////////////////////////////////////////////////////////////

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getPost_code() {
		return post_code;
	}

	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getExtraAddress() {
		return extraAddress;
	}

	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	public String getRegisterday() {
		return registerday;
	}

	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}

	public String getLastPwdChange() {
		return lastPwdChange;
	}

	public void setLastPwdChange(String lastPwdChange) {
		this.lastPwdChange = lastPwdChange;
	}

	public int getIdle() {
		return idle;
	}

	public void setIdle(int idle) {
		this.idle = idle;
	}

	public String getPwd_change_required() {
		return pwd_change_required;
	}

	public void setPwd_change_required(String pwd_change_required) {
		this.pwd_change_required = pwd_change_required;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public boolean isRequirePwdChange() {
		return requirePwdChange;
	}

	public void setRequirePwdChange(boolean requirePwdChange) {
		this.requirePwdChange = requirePwdChange;
	}
	
	








}


