package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.ProductDao;
import dao.ProductManageDao;
import vo.ProductManageVo;
import vo.ProductVo;

public class ProductServiceImpl implements ProductService {
	
	ProductDao product_dao;
	
	ProductManageDao product_in_dao;
	ProductManageDao product_out_dao;
	ProductManageDao product_remain_dao;

	
	public ProductServiceImpl(ProductDao product_dao, ProductManageDao product_in_dao, ProductManageDao product_out_dao,
			ProductManageDao product_remain_dao) {
		super();
		this.product_dao = product_dao;
		this.product_in_dao = product_in_dao;
		this.product_out_dao = product_out_dao;
		this.product_remain_dao = product_remain_dao;
	}

	@Override
	public Map selectList() {
		// TODO Auto-generated method stub
		
		List<ProductManageVo> in_list     = product_in_dao.selectList();
		List<ProductManageVo> out_list    = product_out_dao.selectList();
		List<ProductManageVo> remain_list = product_remain_dao.selectList();
		
		Map map = new HashMap();
		map.put("in_list", in_list);
		map.put("out_list", out_list);
		map.put("remain_list", remain_list);
		
		return map;
	}

	@Override
	public int insert_in(ProductManageVo vo) throws Exception {
		// TODO Auto-generated method stub
		
		String p_name = vo.getP_name();
		
		ProductVo proVo = product_dao.selectOne(p_name);
		
		vo.setP_idx(proVo.getP_idx());
		
		//�԰����̺� ���
		int res = product_in_dao.insert(vo);
		
		//������̺� ���� ��ϻ�ǰ���� ������
		ProductManageVo remainVo = product_remain_dao.selectOne(vo.getP_name());
		
		if(remainVo==null) {
			
			res = product_remain_dao.insert(vo);
		
		}else {
			
			//���� = ���ؼ��� + ���� �԰�� ����
			int cnt = remainVo.getP_cnt() + vo.getP_cnt();
			remainVo.setP_cnt(cnt);
			
			res = product_remain_dao.insert(remainVo);
		}
		
		return res;
	}

	@Override
	public int insert_out(ProductManageVo vo) throws Exception {
		// TODO Auto-generated method stub
		
		String p_name = vo.getP_name();
		
		ProductVo proVo = product_dao.selectOne(p_name);
		
		vo.setP_idx(proVo.getP_idx());
		
		//������̺� ���
		int res = product_out_dao.insert(vo);
		
		ProductManageVo remainVo = product_remain_dao.selectOne(vo.getP_name());
		
		if(remainVo==null) {
			
			//���� �߻�
			throw new Exception("remain_not");
			
		}else {
			
			//������ > �������� ���
			if(vo.getP_cnt()>remainVo.getP_cnt()) {
				
				//���� �߻�
				throw new Exception("remain_lack");
			}
			
			//�������� ������
			//���� = ������ - ������
			int cnt = remainVo.getP_cnt() - vo.getP_cnt();
			remainVo.setP_cnt(cnt);
			
			res = product_remain_dao.updateCnt(remainVo);
		}
		
		return res;
	}

	@Override
	public int delete_in(ProductManageVo vo) throws Exception {
		// TODO Auto-generated method stub
		
		//�԰������ ��ǰ���� ������
		ProductManageVo delVo = product_in_dao.selectOne(vo.getPm_idx());
		
		//�԰����
		int res = product_in_dao.delete(vo.getPm_idx());
		
		//������̺��� �԰������ ��ǰ���� ������
		ProductManageVo remainVo = product_remain_dao.selectOne(delVo.getP_name());
		
		//�԰���Ҽ��� > �������� ���
		if(delVo.getP_cnt()>remainVo.getP_cnt()) {
			
			//���� �߻�
			throw new Exception("in_remain_lack");
		}else {
			
			//�������� ������
			//���� = ������ - �԰���Ҽ���
			int cnt = remainVo.getP_cnt() - delVo.getP_cnt();
			remainVo.setP_cnt(cnt);
			
			res = product_remain_dao.updateCnt(remainVo);
		}
		
		return res;
	}

	@Override
	public int delete_out(ProductManageVo vo) throws Exception {
		// TODO Auto-generated method stub
		
		//�������� ��ǰ���� ������
		ProductManageVo delVo = product_out_dao.selectOne(vo.getPm_idx());
		
		//������
		int res = product_out_dao.delete(vo.getPm_idx());
		
		//������̺��� �������� ��ǰ���� ������
		ProductManageVo remainVo = product_remain_dao.selectOne(delVo.getP_name());
		
		//���� = ������ - �����Ҽ���
		int cnt = remainVo.getP_cnt() - delVo.getP_cnt();
		remainVo.setP_cnt(cnt);
		
		res = product_remain_dao.updateCnt(remainVo);
		
		return res;
	}

}
