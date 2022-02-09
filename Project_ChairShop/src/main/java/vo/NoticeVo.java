package vo;

public class NoticeVo {
	int n_idx;
	String n_subject;
	String n_content;
	String n_regdate;
	String n_ip;
	int    n_ref;		//참조글 번호
	int	   n_step;		//글 순서
	int	   n_depth;		//글 깊이
	
	
	public int getN_idx() {
		return n_idx;
	}
	public void setN_idx(int n_idx) {
		this.n_idx = n_idx;
	}
	public String getN_subject() {
		return n_subject;
	}
	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_regdate() {
		return n_regdate;
	}
	public void setN_regdate(String n_regdate) {
		this.n_regdate = n_regdate;
	}
	public String getN_ip() {
		return n_ip;
	}
	public void setN_ip(String n_ip) {
		this.n_ip = n_ip;
	}
	public int getN_ref() {
		return n_ref;
	}
	public void setN_ref(int n_ref) {
		this.n_ref = n_ref;
	}
	public int getN_step() {
		return n_step;
	}
	public void setN_step(int n_step) {
		this.n_step = n_step;
	}
	public int getN_depth() {
		return n_depth;
	}
	public void setN_depth(int n_depth) {
		this.n_depth = n_depth;
	}

}
