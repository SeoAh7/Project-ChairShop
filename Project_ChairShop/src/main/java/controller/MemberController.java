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
	public String list(Model model) {
		
		List<MemberVo> list = member_dao.selectList();
		
		model.addAttribute("list", list);
		
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
	public String insert(MemberVo vo) {
		
		String ip = request.getRemoteAddr();
		
		vo.setM_ip(ip);
		vo.setM_grade("일반");
		
		int res = member_dao.insert(vo);
		
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
