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
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MemberDao;
import myutil.MyConstant;
import myutil.Paging;
import vo.FaqVo;
import vo.MemberVo;

@Controller
public class MemberController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	MemberDao member_dao;

	public void setMember_dao(MemberDao member_dao) {
		this.member_dao = member_dao;
	}
	
	@RequestMapping("/member/list.do")
	public String list(@RequestParam(name="page",defaultValue ="1" ) int nowPage,
					   @RequestParam(name="search",defaultValue="all") String search,
					   @RequestParam(name="search_text",defaultValue="") String search_text,
					   Model model) {
		

		int start = (nowPage-1) * MyConstant.Mem.BLOCK_LIST + 1;
		int end   = start + MyConstant.Mem.BLOCK_LIST -1;
		
		Map map = new HashMap();
		map.put("start",start);
		map.put("end", end);
		
		if(search.equals("all")) {
			
			map.put("id", search_text);
			map.put("name", search_text);
			
		}else if(search.equals("id")) {
			
			map.put("id", search_text);
			
		}else if(search.equals("name")) {
			
			map.put("name", search_text);
			
		}
		
		//전체 게시물 수
		int rowTotal = member_dao.selectRowTotal(map);
		/* System.out.printf("%d 개\n",rowTotal); */
		//검색필터 
		String search_filter = String.format("search=%s&search_text=%s", search, search_text);
		
		String pageMenu = Paging.getPaging("list.do",
											search_filter,
											nowPage, 
											rowTotal, 
											MyConstant.Mem.BLOCK_LIST, 
											MyConstant.Mem.BLOCK_PAGE
											);
		
		List<MemberVo> list = member_dao.selectList(map);
		
		model.addAttribute("list",list);
		model.addAttribute("pageMenu",pageMenu);
		
		return "member/member_list";
	}
	
	@RequestMapping("/member/login_form.do")
	public String login_form() {
		
		return "member/login_form";
	}
	
	@RequestMapping("/member/login.do")
	public String login(MemberVo vo,
			@RequestParam(value="url", defaultValue="") String url,
			Model model) {
		
		MemberVo user = member_dao.selectOne(vo.getM_id());
		
		if(user==null) {
			
			model.addAttribute("reason", "fail_id");
			
			return "redirect:login_form.do";
		}
		
		if(user.getM_pwd().equals(vo.getM_pwd()) == false) {
			
			model.addAttribute("reason", "fail_pwd");
			
			return "redirect:login_form.do";
			
		}
		
		session.setAttribute("user", user);
		
		if (url.isEmpty()) {

			// 메인페이지 이동
			return "redirect:../";
		} else {
			// 상품검색 시의 주소
			return "redirect:" + url;
		}
	}
	
	@RequestMapping("/member/logout.do")
	public String logout() {
		
		session.removeAttribute("user");
		
		return "redirect:../";
	}
	
	@RequestMapping("/member/register_form.do")
	public String register_form() {
		
		
		
		return "member/register_form";
	}
	
	@RequestMapping("/member/insert.do")
	public String insert(MemberVo vo, Model model) {
		
		String ip = request.getRemoteAddr();
		
		vo.setM_ip(ip);
		vo.setM_grade("일반");
		
		int res = member_dao.insert(vo);
		model.addAttribute("reason","register");
		
		return "redirect:login_form.do";
	}
	
	@RequestMapping("/member/check_id.do")
	@ResponseBody
	public Map check_id(String m_id) {
		
		Map map = new HashMap();
		
		MemberVo vo = member_dao.selectOne(m_id);
		
		if(vo==null) {
			map.put("result", true);
		}
		else
			map.put("result", false);
		
		return map;
	}
	
	@RequestMapping("/member/check_pwd.do")
	@ResponseBody
	public Map check_pwd(String m_pwd, String check_pwd) {
		
		System.out.println(m_pwd);
		System.out.println(check_pwd);
		
		Map map = new HashMap();
		
		if(m_pwd.equals(check_pwd)==true) 
			map.put("result", true);
		else
			map.put("result", false);

		System.out.println(map);
		return map;
	}
	
	@RequestMapping("/member/find_id_form.do")
	public String find_id_form() {
		
		
		return "member/find_id_form";
	}
	
	
	@RequestMapping("/member/find_id.do")
	@ResponseBody
	public Map find_id(MemberVo vo) {
		
		Map map = new HashMap();
		
		MemberVo find_vo = member_dao.selectOne(vo);
		
		String find_id = find_vo.find_id();
		
		if(find_vo != null) {
			map.put("find_id", find_id);
			map.put("result", true);
		}else {
			map.put("result", false);
		}
		
		return map;
	}
	
	@RequestMapping("/member/find_pwd_form.do")
	public String find_pwd_form() {
		
		return "member/find_pwd_form";
	}
	
	@RequestMapping("/member/find_pwd.do")
	public String find_pwd(MemberVo vo, Model model) {
		
		MemberVo find_vo = member_dao.selectOne(vo);
		
		model.addAttribute("find_vo", find_vo);
		
		return "member/reset_pwd_form";
	}
	
	@RequestMapping("/member/reset_pwd.do")
	public String reset_pwd(int m_idx, String m_pwd, Model model) {
		
		MemberVo reset_vo = member_dao.selectOne(m_idx);
		
		reset_vo.setM_pwd(m_pwd);
		
		int res = member_dao.update_pwd(reset_vo);
		
		model.addAttribute("reason", "reset_pwd");
		
		return "redirect:login_form.do";
	}
	
	//삭제하기
		@RequestMapping("/member/delete.do")
		public String delete(int m_idx,int page,String search,String search_text,Model model) {
			
			int res = member_dao.delete(m_idx);
			model.addAttribute("page", page);
			model.addAttribute("search", search);
			model.addAttribute("search_text", search_text);
			
			return "redirect:member_manage.do";
		}
		
		//수정폼 띄우기
		@RequestMapping("/member/modify_form.do")
		public String modify_form(int m_idx, Model model) {
			
			MemberVo vo = member_dao.selectOne(m_idx);
			System.out.println(vo.getM_zipcode_str());
			model.addAttribute("vo", vo);
			
			return "member/modify_form";
		}
		//회원이 마이페이지에서 수정하기
		@RequestMapping("/member/modify.do")
		public String modify(MemberVo vo) {
					
			String m_ip = request.getRemoteAddr();
			vo.setM_ip(m_ip);
					
			int res = member_dao.update(vo);
					
			return "redirect:../";
		}
		
		
		  //수정하기
		  
		  @RequestMapping("/member/manage.do") 
		  public String manage(MemberVo vo,
				  				int page,String search,String search_text,Model model) {
		  
		  String m_ip = request.getRemoteAddr(); vo.setM_ip(m_ip);
		  
		  
		  int res = member_dao.update(vo); model.addAttribute("page", page);
		  model.addAttribute("search", search); model.addAttribute("search_text",
		  search_text);
		  
		  return "redirect:member_manage.do"; 
		  
		
		}
		
	
	
	
}
