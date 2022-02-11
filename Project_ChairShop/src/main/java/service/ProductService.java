package service;

import java.util.Map;

import vo.ProductManageVo;

public interface ProductService {
	
	//�԰�,���,��� ��Ȳ�� �ѹ��� ó���ϴ� selectList
	Map selectList();
	
	int insert_in(ProductManageVo vo)  throws Exception;	//�԰���
	int insert_out(ProductManageVo vo) throws Exception;	//�����
	
	int delete_in(ProductManageVo vo)  throws Exception;	//�԰����
	int delete_out(ProductManageVo vo) throws Exception;	//������
}
