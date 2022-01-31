package vo;

public class MemberVo {
	int    m_idx;
	String m_name;
	String m_id;
	String m_pwd;
	int	   m_zipcode;
	String m_addr;
	String m_tel;
	String m_mail;
	String m_ip;
	String m_grade;
	int	   m_point;
	
	public MemberVo() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberVo(String m_pwd, int m_zipcode, String m_addr, String m_tel, String m_mail, String m_ip,
			String m_grade) {
		super();
		this.m_pwd = m_pwd;
		this.m_zipcode = m_zipcode;
		this.m_addr = m_addr;
		this.m_tel = m_tel;
		this.m_mail = m_mail;
		this.m_ip = m_ip;
		this.m_grade = m_grade;
	}
	
	
	
	public MemberVo(int m_idx, String m_pwd, int m_zipcode, String m_addr, String m_tel, String m_mail, String m_ip,
			String m_grade) {
		super();
		this.m_idx = m_idx;
		this.m_pwd = m_pwd;
		this.m_zipcode = m_zipcode;
		this.m_addr = m_addr;
		this.m_tel = m_tel;
		this.m_mail = m_mail;
		this.m_ip = m_ip;
		this.m_grade = m_grade;
	}

	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public int getM_zipcode() {
		return m_zipcode;
	}
	public void setM_zipcode(int m_zipcode) {
		this.m_zipcode = m_zipcode;
	}
	public String getM_addr() {
		return m_addr;
	}
	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public String getM_mail() {
		return m_mail;
	}
	public void setM_mail(String m_mail) {
		this.m_mail = m_mail;
	}
	public String getM_ip() {
		return m_ip;
	}
	public void setM_ip(String m_ip) {
		this.m_ip = m_ip;
	}
	public String getM_grade() {
		return m_grade;
	}
	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}
	public int getM_point() {
		return m_point;
	}
	public void setM_point(int m_point) {
		this.m_point = m_point;
	}
	
}