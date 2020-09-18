package com.jeju.JejuBnB.event.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
		int limit = 9;
		int currentPage = 1;
		int listCount = eventService.getListCount();
		
		int maxPage = (int) (((double) listCount / limit) + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		ArrayList<Collection> event = eventService.selectList(currentPage, limit);
		
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
	public String EventInsert(Event event, Model model, MultipartHttpServletRequest mrequest,
			HttpServletRequest request,@RequestParam(value="ofile", required = false) MultipartFile ofile) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		if(ofile != null) {
			String orgname = ofile.getOriginalFilename();
			
			String savePath = request.getSession().getServletContext().getRealPath("resources/eventsum");
			event.setEvent_fimg(ofile.getOriginalFilename());
			String rename = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			rename += "." + ofile.getOriginalFilename().substring(ofile.getOriginalFilename().lastIndexOf(".") + 1);
			
			try {
				ofile.transferTo(new File(savePath + "\\" + rename));
			}catch(IllegalStateException | IOException e){
				e.printStackTrace();
			}
			event.setEvent_fimg(ofile.getOriginalFilename());
			event.setEvent_rimg(rename);
		}
		
		List<MultipartFile> fileList = mrequest.getFiles("file");
		ArrayList<Event> eflist = new ArrayList<Event>();
		String savePath1 = request.getSession().getServletContext().getRealPath("resources/eventimg");
		
		for(MultipartFile mf : fileList) {
			Event eimg = new Event();
			String original = mf.getOriginalFilename();
			eimg.setEvent_fimg(original);
			String rename = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			rename += "." + original.substring(original.lastIndexOf(".") + 1);
			
			try {
				mf.transferTo(new File(savePath1 + "\\" + rename));
			}catch(IllegalStateException | IOException e) {
				e.printStackTrace();
				model.addAttribute("message", "추가사진 저장 실패");
				return "common/error";
			}
			eimg.setEvent_fimg(original);
			eimg.setEvent_rimg(rename);
			eflist.add(eimg);
		}
		
		int result = eventService.insertEvent(event);
		if(result > 0){
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
		return "event/insertEventPage";
	}
}
