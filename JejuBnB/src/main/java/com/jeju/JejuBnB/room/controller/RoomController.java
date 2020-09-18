package com.jeju.JejuBnB.room.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

import com.jeju.JejuBnB.filter.model.service.FilterService;
import com.jeju.JejuBnB.filter.model.vo.Amenity;
import com.jeju.JejuBnB.filter.model.vo.Build_type;
import com.jeju.JejuBnB.filter.model.vo.Facility;
import com.jeju.JejuBnB.filter.model.vo.Rule;
import com.jeju.JejuBnB.review.model.service.ReviewService;
import com.jeju.JejuBnB.review.model.vo.Review;
import com.jeju.JejuBnB.room.model.service.RoomService;
import com.jeju.JejuBnB.room.model.vo.CheckTime;
import com.jeju.JejuBnB.room.model.vo.Room;
import com.jeju.JejuBnB.room.model.vo.Room_File;

@Controller
public class RoomController {
	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);
	
	@Autowired
	private RoomService roomService;
	

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private FilterService filterService;
	
	@RequestMapping("roomlist.do")
	public String SelectList(HttpServletRequest request, Model model) {
		int limit = 8;
		int currentPage = 1;
		int listCount = roomService.getListCount();
		
		Calendar cal = Calendar.getInstance();
		String inMonth = "" + (cal.get(Calendar.MONTH) + 1);
		String inday = "" + cal.get(Calendar.DAY_OF_MONTH);
		String outMonth = inMonth;
		String outday = "" + (cal.get(Calendar.DAY_OF_MONTH) + 1);
		int week = cal.get(Calendar.DAY_OF_WEEK);
		int people = 1;
		
		if (request.getParameter("page") != null) {

			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		ArrayList<Room> list = null;
		if (request.getParameter("checkin") != null) {
			
			String checkin = request.getParameter("checkin");
			String checkout = request.getParameter("checkout");
			people = Integer.parseInt(request.getParameter("people"));
			ArrayList<Room> roomNo = roomService.selectChkRNList(checkin, checkout);
			logger.info(roomNo.toString());
			list = roomService.selectChkList(roomNo, currentPage, limit, people);
			inMonth = checkin.substring(5, 7);
			inday = checkin.substring(8);
			outMonth = checkout.substring(5,7);
			outday = checkout.substring(8);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date chDate = null;
			try {
				chDate = sdf.parse(checkin);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			cal.setTime(chDate);
			week = cal.get(Calendar.DAY_OF_WEEK);
		} else {
			ArrayList<Room> roomNo = roomService.selectSysdate();
			list = roomService.selectList(currentPage, limit);
			
		}
		int maxPage = (int) (((double) listCount / limit) + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if (maxPage < endPage) {
			endPage = maxPage;
		}
		
		if (list != null) {
			model.addAttribute("inMonth", inMonth);
			model.addAttribute("inday", inday);
			model.addAttribute("outMonth", outMonth);
			model.addAttribute("outday", outday);
			model.addAttribute("week", week);
			model.addAttribute("people", people);
			model.addAttribute("maxPage", maxPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("listCount", listCount);
			model.addAttribute("list", list);
			return "room/roomListView";

		} else {
			model.addAttribute("message", "리스트 출력 실패");
			return "common/error";
		}
	
	}
	
	@RequestMapping(value = "roominsert.do", method = RequestMethod.POST)
	public String insertRoom(Room room, Model model, CheckTime ct, MultipartHttpServletRequest mrequest,
			HttpServletRequest request, @RequestParam(value = "ofile", required = false) MultipartFile ofile,
			@RequestParam("address") String address) throws UnsupportedEncodingException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		if (ofile != null) {
			String orgname = ofile.getOriginalFilename();

			String savePath = request.getSession().getServletContext().getRealPath("resources/roomThumbnail");
			room.setRoom_thumbnail_file(ofile.getOriginalFilename());
			String rename = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			rename += "." + ofile.getOriginalFilename().substring(ofile.getOriginalFilename().lastIndexOf(".") + 1);

			try {
				ofile.transferTo(new File(savePath + "\\" + rename));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			room.setRoom_thumbnail_file(ofile.getOriginalFilename());
			room.setRoom_rename_file(rename);
		}

		room.setCheckout_time(ct.getOuthour() + ct.getOutminute());
		room.setCheckin_time(ct.getInhour() + ct.getInminute());
		room.setRoom_address(room.getRoom_roadaddress() + address);
		int result = roomService.insertRoom(room);

		
		int roomno = roomService.selectRoomNo(room.getUser_id());
		List<MultipartFile> fileList = mrequest.getFiles("file");
		ArrayList<Room_File> rflist = new ArrayList<Room_File>();
		String savePath1 = request.getSession().getServletContext().getRealPath("resources/roomFiles");

		for (MultipartFile mf : fileList) {
			Room_File rf = new Room_File();
			String original = mf.getOriginalFilename();
			rf.setOriginal_file(original);
			String rename = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			rename += "." + original.substring(original.lastIndexOf(".") + 1);

			try {
				mf.transferTo(new File(savePath1 + "\\" + rename));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				model.addAttribute("message", "추가사진 저장 실패");
				return "common/error";
			}

			rf.setOriginal_file(original);
			rf.setRename_file(rename);
			rf.setRoom_no(roomno);
			rflist.add(rf);
		}
		
			String encoderName = URLEncoder.encode(room.getRoom_name(), "utf-8");
		
		logger.info(room.getRoom_name());
		int result2 = roomService.insertRoomFile(rflist);
		if (result > 0) {
			return "redirect:/insertNotice.do?toUser=" + room.getUser_id()+"&fromUser=admin&room_name="+encoderName+"&returnPage=redirect:/moveDetailView.do?room_no="+roomno +"&choice=7";
		} else {
			model.addAttribute("message", "글 등록 실패");
			return "common/error";
		}

	}
	
	@RequestMapping("moveRoomWrite.do")
	public String moveRoomWrite(Model model) {
		ArrayList<Amenity> Alist = filterService.selectAmenity();
		ArrayList<Build_type> Blist = filterService.selectBuild_type();
		ArrayList<Facility> Flist = filterService.selectFacility();
		ArrayList<Rule> Rlist = filterService.selectRule();
		model.addAttribute("Alist", Alist);
		model.addAttribute("Blist", Blist);
		model.addAttribute("Flist", Flist);
		model.addAttribute("Rlist", Rlist);
		return "room/roomWriteForm";
	}
	
	@RequestMapping("moveMyRoom.do")
	public String moveMyRoom(@RequestParam("userid") String userid, Model model) {
		ArrayList<Room> list = roomService.selectUserRoom(userid);

		if (list.size() > 0) {
			model.addAttribute("list", list);
			return "room/myRoomListView";
		} else {
			model.addAttribute("message", "회원님의 숙소 조회 실패");
			return "common/error";
		}
	}

	//숙소 상세보기  & 리뷰 리스트
	@RequestMapping("moveDetailView.do")
	public ModelAndView moveDetail(ModelAndView mv, @RequestParam("room_no") int room_no) {
		Room room = roomService.selectRoom(room_no);
		ArrayList<Review> list = reviewService.selectReply(room_no);
		
		if(room != null) {
			mv.setViewName("reservation/reservationListView");
			mv.addObject("room", room);
			mv.addObject("list", list);
			
		}else {
			mv.setViewName("common/error");
			mv.addObject("message", "게시글 조회 실패");
		}
		return mv;
	}
	
	
	@RequestMapping("moveUpdatView.do")
	public String moveUPdate(Model model, @RequestParam("roomno") int roomno) {
		Room room = roomService.selectRoom(roomno);
		ArrayList<Amenity> Alist = filterService.selectAmenity();
		ArrayList<Build_type> Blist = filterService.selectBuild_type();
		ArrayList<Facility> Flist = filterService.selectFacility();
		ArrayList<Rule> Rlist = filterService.selectRule();
		model.addAttribute("Alist", Alist);
		model.addAttribute("Blist", Blist);
		model.addAttribute("Flist", Flist);
		model.addAttribute("Rlist", Rlist);
		model.addAttribute("AlistSize", Alist.size());
		model.addAttribute("BlistSize", Blist.size());
		model.addAttribute("FlistSize", Flist.size());
		model.addAttribute("RlistSize", Rlist.size());
		if(room != null) {
			model.addAttribute("room", room);
			return "room/roomUpdateForm";
		}else {
			model.addAttribute("message","게시글 수정페이지 이동 실패");
			return "common/error";
		}
	}
	
	
	@RequestMapping("deleteRoom.do")
	public String deletrRoom(@RequestParam("roomno") int roomno, Model model) {
		int result = roomService.deleteRoom(roomno);
		if(result > 0) {
			return "redirect:/roomlist.do";
		}else {
			model.addAttribute("message", "글 삭제 실패");
			return "common/error";
		}
	}
	
	@RequestMapping("roomupdate.do")
	public String roomUpdate(Room room, CheckTime ct, Model model) {
		room.setCheckout_time("" + ct.getOuthour() + ct.getOutminute());
		room.setCheckin_time(""+ct.getInhour() + ct.getInminute());
		int result = roomService.updateRoom(room);
		
		if(result > 0) {
			model.addAttribute("roomno", room.getRoom_no());
			return "redirect:/moveDetailView.do";
		}else {
			model.addAttribute("message", "글 수정 실패");
			return "common/error";
		}
	}
	
	@RequestMapping("moveRoomBList.do")
	public String moveRoomBList(Model model, HttpServletRequest request) {
		int limit = 10;
		int currentPage = 1;
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		ArrayList<Room> list = roomService.selectBList(currentPage, limit);
		
		if(list.size()>0) {
			model.addAttribute("list", list);
			return "room/roomBListView";
		}else {
			model.addAttribute("message", "게스트 형태로 조회 실패");
			return "common/error";
		}
	}
	
	
}












 