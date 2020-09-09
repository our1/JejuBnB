package com.jeju.JejuBnB.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeju.JejuBnB.notice.model.service.NoticeService;
import com.jeju.JejuBnB.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("moveNoticeList.do")
	public String moveNoticeList(Model model, @RequestParam("user_id") String userid) {
		ArrayList<Notice> list = noticeService.selectUser(userid);
		
		return "notice/uNoticeList";
	}
}
