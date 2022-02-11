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

import dao.FaqDao;
import myutil.MyConstant;
import myutil.Paging;
import vo.FaqVo;
import vo.MemberVo;

@Controller
public class FaqController {

	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	FaqDao faq_dao;



	public void setFaq_dao(FaqDao faq_dao) {
		this.faq_dao = faq_dao;
	}
	
	@RequestMapping("/faq/list.do")
	public String list(@RequestParam(name="page",defaultValue ="1" ) int nowPage,Model model ) {
		
		int start = (nowPage-1) * MyConstant.Faq.BLOCK_LIST + 1;
		int end   = start + MyConstant.Faq.BLOCK_LIST -1;
		
		Map map = new HashMap();
		map.put("start",start);
		map.put("end", end);
		
		int rowTotal = faq_dao.selectRowTotal();
		/* System.out.printf("%d 개\n",rowTotal); */
		String pageMenu = Paging.getPaging("list.do",nowPage, rowTotal, MyConstant.Faq.BLOCK_LIST, MyConstant.Faq.BLOCK_PAGE);
		
		List<FaqVo> list = faq_dao.selectList(map);

		session.removeAttribute("show");
		

		model.addAttribute("list",list);
		model.addAttribute("pageMenu",pageMenu);
		
		return "faq/faq_list";
	}
	
	@RequestMapping("/faq/view.do")
	public String view(int f_idx,Model model) {
		
		FaqVo vo = faq_dao.selectOne(f_idx);
		if(session.getAttribute("show")==null) {
			
			//조회수 증가
			int res = faq_dao.update_readhit(f_idx);
			
			session.setAttribute("show", true);
		}
		model.addAttribute("vo",vo);
		
		return "faq/faq_view";
	}
	
	@RequestMapping("/faq/insert_form.do")
	public String insert_form() {
		
		return "faq/faq_insert_form";
	}
	
	@RequestMapping("/faq/insert.do")
	public String insert(FaqVo vo) {
		
		//관리자만 답변 가능하기 때문에 id가 아닌 '관리자'로 표시
		vo.setM_id("관리자");
		
		String f_content = vo.getF_content().replaceAll("/r/n", "<br>");
		vo.setF_content(f_content);
		
		int res = faq_dao.insert(vo);
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/faq/delete.do")
	public String delete(int f_idx,Model model) {
		
		int res = faq_dao.delete(f_idx);
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/faq/modify_form")
	public String modify_form(int f_idx,Model model) {
		
		FaqVo vo = faq_dao.selectOne(f_idx);
		
		String f_content = vo.getF_content().replaceAll("<br>", "/r/n");
		vo.setF_content(f_content);
		
		model.addAttribute("vo",vo);
		
		return "faq/faq_modify_form";
	}
	
	@RequestMapping("/faq/modify.do")
	public String modify(FaqVo vo,Model model) {
		
		String f_content = vo.getF_content().replace("/r/n", "<br>");
		vo.setF_content(f_content);
		
		int res = faq_dao.update(vo);
		
		model.addAttribute("f_idx",vo.getF_idx());
		//model.addAttribute("page", page );
		
		return "redirect:view.do";
	}
	
}
