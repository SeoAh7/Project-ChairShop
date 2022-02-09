package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.QnaDao;
import myutil.MyConstant;
import myutil.Paging;
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
	public String list(	@RequestParam(name="page",defaultValue="1") int nowPage,
						@RequestParam(name="search",defaultValue="all") String search,
						@RequestParam(name="search_text",defaultValue="") String search_text,
						Model model) {
		
		//게시물에서 가져올 범위
		int start = (nowPage-1) * MyConstant.Qna.BLOCK_LIST + 1;
		int end   = start + MyConstant.Qna.BLOCK_LIST - 1;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		if(search.equals("all")) {
			
			map.put("subject", search_text);
			map.put("content", search_text);
			map.put("id", search_text);
			
		}else if(search.equals("subject")) {
			
			map.put("subject", search_text);
			
		}else if(search.equals("content")) {
			
			map.put("content", search_text);
			
		}else if(search.equals("id")) {
			
			map.put("id", search_text);
			
		}
		
		//전체 게시물 수
		int rowTotal = qna_dao.selectRowTotal(map);
		
		//검색필터
		String search_filter = String.format("search=%s&search_text=%s", search, search_text);
		
		String pageMenu = Paging.getPaging(	"list.do", 
											search_filter,
											nowPage, 
											rowTotal, 
											MyConstant.Qna.BLOCK_LIST, 
											MyConstant.Qna.BLOCK_PAGE
										  );
		
		List<QnaVo> list = qna_dao.selectList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMenu",pageMenu);
		
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
	public String delete(int q_idx, 
						 int page, 
						 String search,
						 String search_text,
						 Model model) {
		
		int res = qna_dao.update_use_yn(q_idx);
		
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("search_text", search_text);
		
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
	public String modify(QnaVo vo,
						 int page,
						 String search,
						 String search_text,
						 Model model) {
		
		String q_ip = request.getRemoteAddr();
		vo.setQ_ip(q_ip);
		
		String q_content = vo.getQ_content().replaceAll("\r\n", "<br>");
		vo.setQ_content(q_content);
		
		int res = qna_dao.update(vo);

		model.addAttribute("q_idx", vo.getQ_idx());
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		model.addAttribute("search_text", search_text);
		
		return "redirect:view.do";
	}
	
	@RequestMapping("/qna/reply_form.do")
	public String reply_form(int q_idx, Model model) {
		
		QnaVo vo = qna_dao.selectOne(q_idx);
		
		model.addAttribute("vo",vo);
		
		return "qna/qna_reply_form";
	}
	
	@RequestMapping("/qna/reply.do")
	public String reply(QnaVo vo, int page, Model model) {
		
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
		
		model.addAttribute("page", page);
		
		return "redirect:list.do";
	}
	
	
}
