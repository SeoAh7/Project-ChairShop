package service;

import java.util.Map;

import vo.ProductManageVo;

public interface ProductService {
	
	//입고,출고,재고 현황을 한번에 처리하는 selectList
	Map selectList();
	
	int insert_in(ProductManageVo vo)  throws Exception;	//입고등록
	int insert_out(ProductManageVo vo) throws Exception;	//출고등록
	
	int delete_in(ProductManageVo vo)  throws Exception;	//입고취소
	int delete_out(ProductManageVo vo) throws Exception;	//출고취소
}
