package parkjuneyub.product.model;

public class AddImageVO {

	private Long image_num;
	private Long product_num;
	private String image_name;
	
	AddImageVO() {};
	
	public Long getImage_num() {
		return image_num;
	}

	public void setImage_num(Long image_num) {
		this.image_num = image_num;
	}

	public Long getProduct_num() {
		return product_num;
	}

	public void setProduct_num(Long product_num) {
		this.product_num = product_num;
	}

	public String getImage_name() {
		return image_name;
	}

	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}

}
