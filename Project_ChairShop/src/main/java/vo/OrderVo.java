package vo;

public class OrderVo {
	
	int o_idx;
	int m_idx;
	int p_idx;
	int p_price;
	int c_idx;
	int c_cnt;
	String m_id;
	String p_name;
	String o_date;
	String order_yn;
	
	int order_count_y;
	int order_count_n;
	   
    public void setOrder_count_y(int order_count_y) {
      this.order_count_y = order_count_y;
    }
    public void setOrder_count_n(int order_count_n) {
      this.order_count_n = order_count_n;
    }
    
	public int getO_idx() {
		return o_idx;
	}
	public void setO_idx(int o_idx) {
		this.o_idx = o_idx;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public int getC_cnt() {
		return c_cnt;
	}
	public void setC_cnt(int c_cnt) {
		this.c_cnt = c_cnt;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public String getOrder_yn() {
		return order_yn;
	}
	public void setOrder_yn(String order_yn) {
		this.order_yn = order_yn;
	}
	
}
