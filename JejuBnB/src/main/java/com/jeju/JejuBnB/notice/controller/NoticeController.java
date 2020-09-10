package com.jeju.JejuBnB.notice.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeju.JejuBnB.notice.model.service.NoticeService;
import com.jeju.JejuBnB.notice.model.vo.User_Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("myNoticeList.do")
	public String selectUserNoticeList(Model model, @RequestParam("userid") String userid) {
		ArrayList<User_Notice> list = noticeService.selectUserNotice(userid);
		logger.info(list.toString());

		if(list.size() > 0) {
			model.addAttribute("list", list);			
		}else {
			model.addAttribute("message", "알림이 없습니다.");
		}
		return "notice/UserNoticeList";
	}
	
	@RequestMapping(value="deleteUNotice.do", method=RequestMethod.POST)
	public String deleteUserNotice(Model model, @RequestParam("noticeno") int noticeno, @RequestParam("userid") String userid) {
		int result = noticeService.deleteUserNotice(noticeno);
		
		if(!(result > 0)) {
			model.addAttribute("message", "삭제할 수 없습니다.");
		}
		return "redirect:/myNoticeList.do?userid="+userid;
	}
	
	@RequestMapping("moveNoticeTest.do")
	public String moveNoticeTest() {
		return "notice/NoticeTest";
	}
	
	
}
