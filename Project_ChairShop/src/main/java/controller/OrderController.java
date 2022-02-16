package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.OrderDao;
import dao.ProductManageDao;
import service.ProductService;
import vo.OrderVo;
import vo.ProductManageVo;

@Controller
public class OrderController {

	OrderDao order_dao;
	ProductService service;
	ProductManageDao product_remain_dao;
	

	public void setOrder_dao(OrderDao order_dao) {
		this.order_dao = order_dao;
	}
	public void setService(ProductService service) {
		this.service = service;
	}

	public void setProduct_remain_dao(ProductManageDao product_remain_dao) {
		this.product_remain_dao = product_remain_dao;
	}
	
	@RequestMapping("/order/order_list.do")
	public String list(Model model) {
		
		List<OrderVo> list = order_dao.selectList();
		
		model.addAttribute("list", list);
		
		Map map = new HashMap();
		
		for(int i=0; i<list.size(); i++) {
			
			ProductManageVo remainVo = product_remain_dao.selectOne(list.get(i).getP_name());
			
			int remain_cnt = 0;
			
			if(remainVo!=null) {
				
				remain_cnt = remainVo.getP_cnt();
			}
			
			map.put(list.get(i).getP_name(), remain_cnt);
			
		}
		
		model.addAttribute("map", map);
		
		
		return "order/order_list";
	}
	
	@RequestMapping("/order/order_success.do")
	public String order_success(int o_idx, Model model) {
		
		//o_idx에 해당하는 정보 가져오기
		OrderVo vo = order_dao.selectOne(o_idx);
		
		//ProductManageVo 에 p_name 넣고 출고처리
		ProductManageVo pmVo = new ProductManageVo();
		
		pmVo.setP_name(vo.getP_name());
		pmVo.setP_cnt(vo.getC_cnt());
		
		try {
			
			int res = service.insert_out(pmVo);
			int res_update = order_dao.update(o_idx);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			String message = e.getMessage();
			
			model.addAttribute("error", message);
		}
		
		return "redirect:order_list.do";
	}
	
}
