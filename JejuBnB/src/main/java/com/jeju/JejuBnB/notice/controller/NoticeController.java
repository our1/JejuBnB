package com.jeju.JejuBnB.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.JejuBnB.notice.model.service.NoticeService;
import com.jeju.JejuBnB.notice.model.vo.Notice;
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
	
	
	
	@RequestMapping("insertNotice.do")
	public ModelAndView insertNotice(HttpServletRequest request, ModelAndView mv, @RequestParam("returnPage") String returnPage) {
		int choice = Integer.parseInt(request.getParameter("choice"));
		String toUser = request.getParameter("toUser");
		String fromUser = request.getParameter("fromUser");
		String room_name = request.getParameter("room_name");
		
		Notice notice;
		Notice notice2;
		User_Notice un1 = new User_Notice();
		User_Notice un2 = new User_Notice();
		int result = 0;
		int result2 = 0;
		/*
		 * choice 는 알림 선택
		 * toUser는 로그인한 사람
		 * fromUser 는 받는사람 ex>숙소주인
		 * 둘이 바뀔수도 있다.
		 * XX 님 XX속소 에약완료 => 사용자에게 (toUser 는 사용자  fromUser는 사장님이 된다)
		 * XX 님 XX숙소 예약 신청 완료 => 사장님에게  (toUser 는 사장님 fromUser 는 사용자가 된다.)
		 */
		
		switch(choice) {
		case 1 : 	

			notice = noticeService.selectNotice(choice);
			notice2 = noticeService.selectNotice(choice+1);

			un1.setNotice_content(fromUser + notice.getNotice_content1() + room_name + notice.getNotice_content2());
			un1.setFrom_user(fromUser);
			un1.setTo_user(toUser);
			result = noticeService.insertUNotice(un1);
			
			un2.setFrom_user(toUser);
			un2.setNotice_content(toUser + notice2.getNotice_content1()+ room_name + notice.getNotice_content2());
			un2.setTo_user(fromUser);
			result2 = noticeService.insertUNotice(un2);
			
			if(result > 0 && result2 > 0) {
				mv.setViewName(returnPage);
			}else{
				mv.addObject("message", "알림 보내기 실패");
				mv.setViewName("common/error");
			}
			break;
			
		case 3 :
			
			notice = noticeService.selectNotice(choice);

			un1.setNotice_content(room_name + notice.getNotice_content1() + toUser + notice.getNotice_content2());
			un1.setFrom_user(toUser);
			un1.setTo_user(fromUser);
			result = noticeService.insertUNotice(un1);
			
			if(result > 0) {
				mv.setViewName(returnPage);
			}else{
				mv.addObject("message", "알림 보내기 실패");
				mv.setViewName("common/error");
			}
			break;
			
		case 4 :
			notice = noticeService.selectNotice(choice);

			un1.setNotice_content(fromUser + notice.getNotice_content1() + toUser + notice.getNotice_content2());
			un1.setFrom_user(fromUser);
			un1.setTo_user(toUser);
			result = noticeService.insertUNotice(un1);
			
			if(result > 0) {
				mv.setViewName(returnPage);
			}else{
				mv.addObject("message", "알림 보내기 실패");
				mv.setViewName("common/error");
			}
			break;			
			
		case 5 :
			String xx = request.getParameter("문의글 이름 ");
			notice = noticeService.selectNotice(choice);

			un1.setNotice_content(fromUser + notice.getNotice_content1() + xx + notice.getNotice_content2());
			un1.setFrom_user("admin");
			un1.setTo_user(fromUser);
			result = noticeService.insertUNotice(un1);
			
			if(result > 0) {
				mv.setViewName(returnPage);
			}else{
				mv.addObject("message", "알림 보내기 실패");
				mv.setViewName("common/error");
			}
			break;
			
		case 6:
			String xxx = request.getParameter("쿠폰 이름 ");
			notice = noticeService.selectNotice(choice);

			un1.setNotice_content(fromUser + notice.getNotice_content1() + xxx + notice.getNotice_content2());
			un1.setFrom_user("admin");
			un1.setTo_user(fromUser);
			result = noticeService.insertUNotice(un1);
			
			if(result > 0) {
				mv.setViewName(returnPage);
			}else{
				mv.addObject("message", "알림 보내기 실패");
				mv.setViewName("common/error");
			}
			break;
		}
		
		return mv;
	}
	
	
	@RequestMapping("adUNoticeList.do")
	public String AdUNoticeList(Model model) {
		ArrayList<User_Notice> list = noticeService.selectUserNoticeList();
		if(list.size() > 0) {
			model.addAttribute("list",list);
			return "notice/adUNoticeList";
		}else {
			model.addAttribute("message", "관리자 알림글 전체 조회 실패");
			return "common/error";
		}
	}
	
	
	@RequestMapping("adNoticeList.do")
	public String AdNoticeList(Model model) {
		ArrayList<Notice> list = noticeService.selectNoticeList();
		
		if(list.size() > 0) {
			model.addAttribute("list", list);
			return "notice/adNoticeList";
		}else {
			model.addAttribute("message", "관리자  알림 창 조회 실패");
			return "common/error";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("moveNoticeTest.do")
	public String moveNoticeTest() {
		return "notice/NoticeTest";
	}
	
	
	
}
