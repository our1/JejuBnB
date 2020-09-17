package com.jeju.JejuBnB.message.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.JejuBnB.member.model.vo.Member;
import com.jeju.JejuBnB.message.model.service.MessageService;
import com.jeju.JejuBnB.message.model.vo.Message;
import com.jeju.JejuBnB.message.model.vo.Message_Detail;

@Controller
public class MessageController {

	 @Autowired private MessageService messageService;
	
	 
	 
	 
	 @RequestMapping(value="insertMessageDetail.do",  method = RequestMethod.POST)
	 public ModelAndView insertMessageDetail(ModelAndView mv, Message_Detail message_detail) {
		 if(messageService.insertMessageDetail(message_detail) > 0 ) {
			 ArrayList<Message_Detail> list2 = messageService.selectListMessageDetail(message_detail);
				mv.addObject("list2", list2);
				mv.setViewName("message/message");
		 }else {
			 	mv.addObject("message", "message를 전송하지 못했습니다.");
				mv.setViewName("common/error"); 
		 }
		 return mv;
	 }
	 
	
	
	/*
	 * view 이동
	 * -----------------------------------------------------------------------------
	 * ---------------------------------------
	 */
	// 메세지 페이지 이동
	@RequestMapping("message.do")
	public ModelAndView message(ModelAndView mv, Message message, Message_Detail message_detail,HttpSession session) {
		Message messagelist = messageService.selectListMessage(message);
		if(messagelist != null ) {
			session.setAttribute("messagelist", messagelist);
			message_detail.setMessage_no(messagelist.getMessage_no());
			ArrayList<Message_Detail> list2 = messageService.selectListMessageDetail(message_detail);
			mv.addObject("list2", list2);
			mv.setViewName("message/message");
		}else {
			if (messageService.insertMessage(message) > 0) {
				messagelist = messageService.selectListMessage(message);
				session.setAttribute("messagelist", messagelist);
				message_detail.setMessage_no(messagelist.getMessage_no());
				ArrayList<Message_Detail> list2 = messageService.selectListMessageDetail(message_detail);
				mv.addObject("list2", list2);
				mv.setViewName("message/message");
			} else {
				mv.addObject("message", "message를 생성하지 못했습니다.");
				mv.setViewName("common/error");
			}
		}
		return mv;
	}
	
	// 임시 메세지 버튼 페이지 이동
	@RequestMapping("moveMessageTemp.do")
	public String moveMessageTemp() {
		return "message/messageMainPage";
	}	
	
}
