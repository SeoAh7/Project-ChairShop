package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CartDao;
import vo.CartVo;
import vo.MemberVo;

@Controller
public class CartController {
	@Autowired
	HttpSession session;
	
	CartDao cart_dao;
	
	public void setCart_dao(CartDao cart_dao) {
		this.cart_dao = cart_dao;
	}

	@RequestMapping("/cart/cart_list.do")
	public String cart_list(Model model) {
		MemberVo user = (MemberVo) session.getAttribute("user");
		if(user==null) {
			
			model.addAttribute("reason", "logout");
			
			return "redirect:../member/login_form.do";
		}
		
		int m_idx = user.getM_idx();
		
		List<CartVo> list = cart_dao.selectList(m_idx);
		int total_amount = cart_dao.selectTotalAmount(m_idx);
		
		model.addAttribute("list", list);		
		model.addAttribute("total_amount", total_amount);
		
		return "cart/cart_list";
	}
	
	@RequestMapping("/cart/cart_insert.do")
	@ResponseBody
	public Map insert(int p_idx,int m_idx) {
		
		
		CartVo paramVo = new CartVo();
		paramVo.setP_idx(p_idx);
		paramVo.setM_idx(m_idx);
		
		CartVo vo  = cart_dao.selectOne(paramVo);
		
		Map map = new HashedMap();
		
		if(vo!=null) {
			map.put("result", "exist");
		}else {
			int res = cart_dao.insert(paramVo);
			map.put("result", "success");
		}

		return map;
	}
	
	@RequestMapping("/cart/cart_delete.do")
	public String delete(@RequestParam("c_idx") int [] c_idx_array) {
		
		for(int c_idx : c_idx_array) {

			int res = cart_dao.delete(c_idx);
		}
		
		return "redirect:cart_list.do";
	}
	
	@RequestMapping("/cart/cart_update.do")
	public String update(CartVo vo ) {
			
		int res = cart_dao.update(vo);
		
		
		return "redirect:/cart/cart_list.do";
	}
	

	
}
