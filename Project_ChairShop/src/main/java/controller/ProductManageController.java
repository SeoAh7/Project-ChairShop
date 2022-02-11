package controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.ProductService;
import vo.ProductManageVo;
import vo.ProductVo;

@Controller
public class ProductManageController {

	ProductService service;
	
	public void setService(ProductService service) {
		this.service = service;
	}
	
	
//------------------------------재고리스트 폼 띄우기-----------------------------------------
	@RequestMapping("/admin/product_remain_list.do")
	public String remain_list(Model model) {
		
		Map map = service.selectList();
		
		map.get("remain_list");
		
		model.addAttribute("map", map);
		
		return "admin/product_remain_list";
	}

//------------------------------입고리스트 폼 띄우기-----------------------------------------
	@RequestMapping("/admin/product_in_list.do")
	public String in_list(Model model) {
		
		Map map = service.selectList();
		
		map.get("in_list");
		
		model.addAttribute("map", map);
		
		return "admin/product_in_list";
	}
	
	//입고
	@RequestMapping("/admin/insert_in.do")
	public String insert_in(ProductManageVo vo) {
		
		try {
			//서비스 객체에 입고처리 요청
			int res = service.insert_in(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:product_in_list.do";
	}
	
	//입고취소
	@RequestMapping("/admin/delete_in.do")
	public String delete_in(ProductManageVo vo, Model model) {
		
		try {
			//서비스 객체에 입고취소처리 요청
			int res = service.delete_in(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			String message = e.getMessage();
			
			model.addAttribute("error", message);
		}
		
		return "redirect:product_in_list.do";
	}
	

//------------------------------출고리스트 폼 띄우기-----------------------------------------
	@RequestMapping("/admin/product_out_list.do")
	public String out_list(Model model) {
		
		Map map = service.selectList();
		
		map.get("out_list");
		
		model.addAttribute("map", map);
		
		return "admin/product_out_list";
	}
	
	
	//출고
	@RequestMapping("/admin/insert_out.do")
	public String insert_out(ProductManageVo vo, Model model) {
		
		try {
			//서비스 객체에 출고처리 요청
			int res = service.insert_out(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			String message = e.getMessage();
			
			model.addAttribute("error", message);
		}
		
		return "redirect:product_out_list.do";
	}
	
	//출고취소
	@RequestMapping("/admin/delete_out.do")
	public String delete_out(ProductManageVo vo, Model model) {
		
		try {
			//서비스 객체에 출고취소처리 요청
			int res = service.delete_out(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			
			String message = e.getMessage();
			
			model.addAttribute("error", message);
		}
		
		return "redirect:product_out_list.do";
	}
	
	
	

}
