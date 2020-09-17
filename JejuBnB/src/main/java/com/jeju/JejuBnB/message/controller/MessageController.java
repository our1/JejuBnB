package com.jeju.JejuBnB.message.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.JejuBnB.member.model.vo.Member;
import com.jeju.JejuBnB.message.model.service.MessageService;
import com.jeju.JejuBnB.message.model.vo.Message;

@Controller
public class MessageController {

	 @Autowired private MessageService messageService;
	
	
	
	
	
	
	
	
	
	
	/*
	 * view 이동
	 * -----------------------------------------------------------------------------
	 * ---------------------------------------
	 */
	// 메세지 페이지 이동
	@RequestMapping("message.do")
	public ModelAndView message(ModelAndView mv, Message message) {
		ArrayList<Message> list = messageService.selectListMessage(message);
		if(list != null ) {
			mv.addObject("list", list);
			mv.setViewName("message/message");
		}else {
			if (messageService.insertMessage(message) > 0) {
				System.out.println(message);
				mv.setViewName("message/message");
				mv.addObject("message", message);
			} else {
				mv.addObject("message", "message를 전송하지 못했습니다.");
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
