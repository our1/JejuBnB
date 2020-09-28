package com.jeju.JejuBnB.myroom.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jeju.JejuBnB.myroom.model.service.MyRoomService;
import com.jeju.JejuBnB.myroom.model.vo.MyRoom;

@Controller
public class MyRoomController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	MyRoomService myroomService;
	
	@RequestMapping(value="insertMyRoom.do", method=RequestMethod.POST)
	public void insertMyRoom(MyRoom mroom, HttpServletResponse response) {
		
		int result = myroomService.insertMyRoom(mroom);
		response.setContentType("text/html; charset=utf-8");
		
		try {
			PrintWriter out = response.getWriter();
			if(result > 0) {
				out.append("ok");
				out.flush();
			}else {
				out.append("no");
				out.flush();
			}
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value="deleteMyRoom.do", method=RequestMethod.POST)
	public void deleteMyRoom(@RequestParam("room_no") int roomNo, HttpServletResponse response) {
		logger.info(""+roomNo);
		int result = myroomService.deleteMyRoom(roomNo);
		
		response.setContentType("text/html; charset=utf-8");
		
		try {
			PrintWriter out = response.getWriter();
			if(result > 0) {
				out.append("ok");
				out.flush();
			}else {
				out.append("no");
				out.flush();
			}
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
