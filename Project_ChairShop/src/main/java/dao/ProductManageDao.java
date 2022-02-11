package dao;

import java.util.List;

import vo.ProductManageVo;

public interface ProductManageDao {

	List<ProductManageVo> selectList();
	ProductManageVo       selectOne(int pm_idx);
	
	int insert(ProductManageVo vo);
	int delete(int pm_idx);
	
	//Optional(선택사항) : 재고에서만 필요
	default ProductManageVo selectOne(String p_name) { return null; }
	default int             updateCnt(ProductManageVo vo) { return 0; }
}
