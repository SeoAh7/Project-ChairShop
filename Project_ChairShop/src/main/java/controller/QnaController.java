package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.QnaDao;
import vo.MemberVo;
import vo.QnaVo;

@Controller
public class QnaController {

	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	QnaDao qna_dao;

	public void setQna_dao(QnaDao qna_dao) {
		this.qna_dao = qna_dao;
	}
	
	
	@RequestMapping("/qna/list.do")
	public String list(Model model) {
		
		List<QnaVo> list = qna_dao.selectList();
		
		model.addAttribute("list", list);
		
		return "qna/qna_list";
	}
	
	@RequestMapping("/qna/view.do")
	public String view(int q_idx, Model model) {
		
		QnaVo vo = qna_dao.selectOne(q_idx);
		
		model.addAttribute("vo", vo);
		
		return "qna/qna_view";
	}
	
	@RequestMapping("/qna/insert_form.do")
	public String insert_form() {
		
		return "qna/qna_insert_form";
	}
	
	@RequestMapping("/qna/insert.do")
	public String insert(QnaVo vo) {
		
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		vo.setM_idx(user.getM_idx());
		vo.setM_id(user.getM_id());
		
		String q_ip = request.getRemoteAddr();
		vo.setQ_ip(q_ip);
		
		String q_content = vo.getQ_content().replaceAll("\r\n", "<br>");
		vo.setQ_content(q_content);
		
		
		int res = qna_dao.insert(vo);
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/qna/delete.do")
	public String delete(int q_idx) {
		
		int res = qna_dao.update_use_yn(q_idx);
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/qna/modify_form.do")
	public String modify_form(int q_idx, Model model) {
		
		QnaVo vo = qna_dao.selectOne(q_idx);
		
		String q_content = vo.getQ_content().replaceAll("<br>", "\r\n");
		vo.setQ_content(q_content);
		
		model.addAttribute("vo", vo);
		
		return "qna/qna_modify_form";
	}
	
	@RequestMapping("/qna/modify.do")
	public String modify(QnaVo vo, Model model) {
		
		String q_ip = request.getRemoteAddr();
		vo.setQ_ip(q_ip);
		
		String q_content = vo.getQ_content().replaceAll("\r\n", "<br>");
		vo.setQ_content(q_content);
		
		int res = qna_dao.update(vo);

		model.addAttribute("q_idx", vo.getQ_idx());
		
		return "redirect:view.do";
	}
	
	@RequestMapping("/qna/reply_form.do")
	public String reply_form(int q_idx, Model model) {
		
		QnaVo vo = qna_dao.selectOne(q_idx);
		
		model.addAttribute("vo",vo);
		
		return "qna/qna_reply_form";
	}
	
	@RequestMapping("/qna/reply.do")
	public String reply(QnaVo vo, Model model) {
		
		MemberVo user = (MemberVo) session.getAttribute("user");
		
		vo.setM_idx(user.getM_idx());
		vo.setM_id(user.getM_id());
		
		String q_ip = request.getRemoteAddr();
		vo.setQ_ip(q_ip);
		
		//기준글 정보 얻어오기
		QnaVo baseVo = qna_dao.selectOne(vo.getQ_idx());
		
		//답글이 들어갈 정보 세팅(기준글 바로 아래에 들어올 수 있도록)
		vo.setQ_ref(baseVo.getQ_ref());
		vo.setQ_step(baseVo.getQ_step()+1);
		vo.setQ_depth(baseVo.getQ_depth()+1);

		int res = qna_dao.reply(vo);
		
		return "redirect:list.do";
	}
	
	
}
