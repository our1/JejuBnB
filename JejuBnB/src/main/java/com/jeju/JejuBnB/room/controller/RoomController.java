package com.jeju.JejuBnB.room.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeju.JejuBnB.room.model.service.RoomService;
import com.jeju.JejuBnB.room.model.vo.Room;

@Controller
public class RoomController {
	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	
	@Autowired
	private RoomService roomService;
	
	@RequestMapping("roomlist.do")
	public String SelectList(HttpServletRequest request, Model model) {
		int limit = 10;
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		ArrayList<Room> list = roomService.selectList(currentPage, limit);
		

		if(list != null) {
		model.addAttribute("list", list);
		logger.info(list.toString());
		return "room/roomListView";
		} else {
			model.addAttribute("message", "리스트 출력 실패");
			return "common/error";
		}
	}

}
 