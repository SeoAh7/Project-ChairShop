package controller;

import java.util.HashMap;
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
import dao.MemberDao;
import dao.OrderDao;
import dao.ProductDao;
import vo.CartVo;
import vo.MemberVo;
import vo.OrderVo;
import vo.ProductVo;

@Controller
public class CartController {
	@Autowired
	HttpSession session;
	
	CartDao cart_dao;
	ProductDao product_dao;
	OrderDao order_dao;
	MemberDao member_dao;
	
	public void setProduct_dao(ProductDao product_dao) {
		this.product_dao = product_dao;
	}

	public void setCart_dao(CartDao cart_dao) {
		this.cart_dao = cart_dao;
	}

	public void setOrder_dao(OrderDao order_dao) {
		this.order_dao = order_dao;
	}

	public void setMember_dao(MemberDao member_dao) {
		this.member_dao = member_dao;
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
		
		ProductVo proVo = product_dao.selectOne(p_idx);
		
		paramVo.setP_name(proVo.getP_name());
		paramVo.setP_price(proVo.getP_price());
		
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
	
	@RequestMapping("/cart/p_order_form.do")
	public String p_order_form(int m_idx, Model model) {
		
		List<CartVo> list = cart_dao.selectList(m_idx);
		int total_amount = cart_dao.selectTotalAmount(m_idx);
		
		model.addAttribute("list",list);
		model.addAttribute("total_amount", total_amount);
		
		return "cart/p_order_form";
	}
	
	@RequestMapping("/cart/p_order_set.do")
    public String p_order_set(int m_idx,
    						  @RequestParam(name="receiver",defaultValue="")String receiver,
    						  @RequestParam(name="zipcode",defaultValue="")String zipcode,
    						  @RequestParam(name="addr",defaultValue="")String addr,
    						  @RequestParam(name="tel",defaultValue="")String tel,
    						  Model model) {
		
		int total_amount = cart_dao.selectTotalAmount(m_idx);
		
		Map map = new HashMap();
		
		map.put("receiver", receiver);
		map.put("zipcode", zipcode);
		map.put("addr", addr);
		map.put("tel", tel);
		
		model.addAttribute("map", map);
		model.addAttribute("total_amount", total_amount);
		
		OrderVo vo = new OrderVo();
		
		List<CartVo> list = cart_dao.selectList(m_idx);
		
		MemberVo memVo = member_dao.selectOne(m_idx);
		
		for(int i=0; i<list.size(); i++) {
			
			vo.setM_idx(m_idx);
			vo.setM_id(memVo.getM_id());
			vo.setP_idx(list.get(i).getP_idx());
			vo.setP_name(list.get(i).getP_name());
			vo.setP_price(Integer.parseInt(list.get(i).getP_price()));
			vo.setC_idx(list.get(i).getC_idx());
			vo.setC_cnt(list.get(i).getC_cnt());
			
			int res = order_dao.insert(vo);
			
			int cart_res = cart_dao.delete(list.get(i).getC_idx());
		}
		
		
		return "cart/p_order_set";
    }
	
	
}
