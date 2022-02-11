package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.ProductDao;
import vo.MemberVo;
import vo.ProductVo;

@Controller
public class ProductController {
	@Autowired
	ServletContext application;

	@Autowired
	HttpSession session; 
	
	ProductDao product_dao;
	
	
	public void setProduct_dao(ProductDao product_dao) {
		this.product_dao = product_dao;
	}

	
//---------------------------------------------------------------------------	  -----------------------------------------------------------------------------
	  
	  //��ü ��Ϻ���
	  
	  @RequestMapping("/product/product_list.do") 
	  public String list(String category, String search_product, Model model) {
		  
		  if(category.equals("")==true && search_product.equals("")==true) {
			  List<ProductVo> list = product_dao.selectList();
			  
			  int count = list.size();
			  
			  model.addAttribute("list", list); 
			  model.addAttribute("count", count);
		  }
		  else if(category.equals("")!=true && search_product.equals("")==true){
			  List<ProductVo> list = product_dao.selectList(category);
			  
			  int count = list.size();
			  
			  model.addAttribute("list", list); 
			  model.addAttribute("count", count);
			  
		  }else {
			  Map map = new HashMap();
			  
			  map.put("search_product", search_product);
			  
			  List<ProductVo> list = product_dao.selectList(map);
			  
			  int count = list.size();
			  
			  model.addAttribute("list", list); 
			  model.addAttribute("count", count);
		  }
		   
		  return "product/product_list";
		  
	  }//end list
//------------------------------------------------------------------------
	@RequestMapping("/product/product_view.do")
	public String view(int p_idx, Model model ) {

		// p_idx�� �ش�Ǵ� ��ǰ���� 1�� ������
		ProductVo vo = product_dao.selectOne(p_idx);

		// request binding
		model.addAttribute("vo", vo);

		return "product/product_view";
	}// end view

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

	// ��ǰ ����ϱ�
	@RequestMapping("/product/insert.do")
	public String insert(ProductVo vo, @RequestParam("p_image") MultipartFile p_img, Model model)
			throws Exception, IOException {
			
		MemberVo user = (MemberVo) session.getAttribute("user");
		if(user==null) {
			model.addAttribute("reason", "logout");
			return "redirect:../member/login_form.do";
		}
			
		// ��� ����
		String webPath = "/resources/image";
		String absPath = application.getRealPath(webPath);

		String filename = "no_file";

		if (!p_img.isEmpty()) {
			filename = p_img.getOriginalFilename();

			File f = new File(absPath, filename);

			if (f.exists()) { //���� �̸��� ������ �����ϸ� �����ϴ� ���ǹ�
				long tm = System.currentTimeMillis();
					
				//���� �̸��� ���Ͽ� �ð��� �߰��Ѵ�
				filename = String.format("%d_%s", tm, filename);
				f = new File(absPath, filename);
			}
			p_img.transferTo(f); //�ӽ� ����� ������ ������ ��ġ�� ����
			vo.setP_img(filename);
		} // end if(isEmpty)

		int res = product_dao.insert(vo);
			
		model.addAttribute("category", vo.getCategory());
		model.addAttribute("search_product", "");

		return "redirect:product_list.do";

	}// end insert
//------------------------------��ǰ ����� ����------------------------------------------	
	@RequestMapping("/product/product_insert_form.do")
	public String product_insert_form() {
	
	return  "product/product_insert_form";
	}

	
	
//------------------------------�ֹ�����Ʈ �� ����-----------------------------------------
	@RequestMapping("/product/p_order_list.do")
	public String p_order_list() {
	
	return  "product/p_order_list";
	}

	
}

	

