package dao;

import java.util.List;
import java.util.Map;

import vo.FaqVo;

public interface FaqDao {

	 List<FaqVo> selectList();
	 List<FaqVo> selectList(Map map);
	 FaqVo 		 selectOne(int f_idx);
	 
	 int insert(FaqVo vo);
	 int delete(int f_idx);
	 int update(FaqVo vo);
	 int update_readhit(int f_idx);
	 int selectRowTotal();
	
	 
}
