package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.NoticeDao;
import vo.NoticeVo;

@Controller
public class NoticeController {
	
	NoticeDao notice_dao;
	
	public void setNotice_dao(NoticeDao notice_dao) {
		this.notice_dao = notice_dao;
	}

	@RequestMapping("/notice/list.do") 
	public String List(NoticeVo vo) {
		
		
		return "notice/notice_list";
	}
	
}
