package vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class QnaVo {

	int    q_idx;
	String q_subject;
	String q_content;
	String q_regdate;
	String q_use_yn;
	String q_ip;
	int    m_idx;
	String m_id;
	int    q_ref;		//참조글 번호
	int    q_step;		//글 순서
	int    q_depth;		//글 깊이

	String m_id_hidden;
	String today;

	
	public String getToday() {
		
		Date date = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(date);
	}
	
	public String getM_id_hidden() {

		StringBuffer sb = new StringBuffer();
		
		for(int i=0; i<m_id.length(); i++) {
			
			if(i<3) {
				sb.append(m_id.charAt(i));
			}else
				sb.append("*");
		}
		
		return sb.toString();
	}
	
	public int getQ_idx() {
		return q_idx;
	}
	public void setQ_idx(int q_idx) {
		this.q_idx = q_idx;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_regdate() {
		return q_regdate;
	}
	public void setQ_regdate(String q_regdate) {
		this.q_regdate = q_regdate;
	}
	public String getQ_use_yn() {
		return q_use_yn;
	}
	public void setQ_use_yn(String q_use_yn) {
		this.q_use_yn = q_use_yn;
	}
	public String getQ_ip() {
		return q_ip;
	}
	public void setQ_ip(String q_ip) {
		this.q_ip = q_ip;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getQ_ref() {
		return q_ref;
	}
	public void setQ_ref(int q_ref) {
		this.q_ref = q_ref;
	}
	public int getQ_step() {
		return q_step;
	}
	public void setQ_step(int q_step) {
		this.q_step = q_step;
	}
	public int getQ_depth() {
		return q_depth;
	}
	public void setQ_depth(int q_depth) {
		this.q_depth = q_depth;
	}
	
}
