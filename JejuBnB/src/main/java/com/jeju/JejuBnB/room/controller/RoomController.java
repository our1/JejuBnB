package com.jeju.JejuBnB.room.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.jeju.JejuBnB.room.model.service.RoomService;
import com.jeju.JejuBnB.room.model.vo.CheckTime;
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
	
	@RequestMapping(value="roominsert.do", method=RequestMethod.POST)
	public String insertRoom(Room room, Model model, CheckTime ct, HttpServletRequest request, @RequestParam(name="ofile", required=false) MultipartFile ofile) {
		logger.info(room.toString());
		logger.info(ct.toString());
		if(ofile != null) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/roomThumbnail");
			room.setRoom_thumbnail_file(ofile.getOriginalFilename());
			try {
				ofile.transferTo(new File(savePath + "\\" + ofile.getOriginalFilename()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		room.setCheckout_time("" + ct.getOuthour() + ct.getOutminute());
		room.setCheckin_time(""+ct.getInhour() + ct.getInminute());
		
		room.setUser_id("admin");
		room.setAmenity("주방");
		room.setFacility("주차장");
		room.setBuild_type("주택");
		room.setRule("흡연 금지");
		room.setRoom_thumbnail_file("1.jpg");
		room.setRoom_rename_file("1.jpg");
		logger.info(room.toString());

		int result = roomService.insertRoom(room);
		if(result > 0) {
			return "redirect:/roomlist.do";
		} else {
			model.addAttribute("message", "글 등록 실패");
			return "common/error";
		}
		
		
	}
	
	@RequestMapping("moveroomwrite.do")
	public String moveRoomWrite() {
		return "room/roomWriteForm";
	}

}
 