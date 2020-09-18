package com.jeju.JejuBnB.event.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.JejuBnB.event.model.service.EventService;
import com.jeju.JejuBnB.event.model.vo.Collection;
import com.jeju.JejuBnB.event.model.vo.Event;

@Controller
public class EventController {
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping("eventPage.do")
	public ModelAndView EventListMethod(ModelAndView mv) {
		ArrayList<Collection> event = eventService.selectList();
		
		if(event != null) {
			mv.setViewName("event/eventListView");
			mv.addObject("event", event);
		}else {
			mv.addObject("message", event + "이벤트조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping(value="insertEvent.do", method=RequestMethod.POST)
	public String EventInsert(Event event, Model model) {
		if(eventService.insertEvent(event) > 0){
			return "redirect:eventPage.do";
		}else {
			model.addAttribute("message", event + "이벤트 등록 실패");
			return "common/error";
		}
	}
	
	@RequestMapping("updateEvent.do")
	public String UpdateEvent(Event event, Model model) {
		
		if(eventService.updateEvent(event) > 0) {
			model.addAttribute("event_no", event.getEvent_no());
			return "redirect:updateDetailView.do";
		}else {
			model.addAttribute("message", "수정 실패");
			return "common/error";
		}
	}
	
	@RequestMapping("deleteEvent.do")
	public String deleteEvent(@RequestParam("event_no")String event_no, Model model) {
		int result = eventService.deleteEvent(event_no);
		if(result > 0) {
			return "redirect:eventPage.do";
		}else {
			model.addAttribute("message", event_no + "삭제 실패");
			return "common/error";
		}
	}
	
	@RequestMapping("insertEventPage.do")
	public String moveCouponAddPage() {
		return "coupon/insertEvent.do";
	}
}
