package dao;

import java.util.List;
import java.util.Map;

import vo.NoticeVo;

public interface NoticeDao {
	
	List<NoticeVo> selectList();
	List<NoticeVo> selectList(Map map);
	NoticeVo	   selectOne(int n_idx);
	
	int insert(NoticeVo vo);
	int delete(int n_idx);
	int update(NoticeVo vo);
	int selectRowTotal(Map map);
	
}
