package vo;

public class ProductVo {
	int p_idx;
	String category, p_name, p_price, p_img, p_content;
	
	public ProductVo() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public ProductVo(int p_idx, String category, String p_name, String p_price, String p_img, String p_content) {
		super();
		this.p_idx = p_idx;
		this.category = category;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_img = p_img;
		this.p_content = p_content;
	}

	


	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}

	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}



	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	
	
}