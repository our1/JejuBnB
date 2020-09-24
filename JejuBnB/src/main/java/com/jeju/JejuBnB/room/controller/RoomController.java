package com.jeju.JejuBnB.room.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.jeju.JejuBnB.myroom.model.service.MyRoomService;
import com.jeju.JejuBnB.myroom.model.vo.MyRoom;
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
	
	@Autowired
	private MyRoomService myroomService;
	
	@RequestMapping("roomlist.do")
	public String SelectList(HttpServletRequest request, Model model, HttpSession session) {
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
			session.setAttribute("checkin", checkin);
			session.setAttribute("checkout", checkout);
			session.setAttribute("people",people);
			
			ArrayList<Room> roomNo = roomService.selectChkRNList(checkin, checkout);
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
			list = roomService.selectList(currentPage, limit);
			
		}
		int maxPage = (int) (((double) listCount / limit) + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if (maxPage < endPage) {
			endPage = maxPage;
		}
		
		//회원이 좋아요 누른 룸 리스트 번호 가져오기
		if(request.getParameter("userid") != null) {
		ArrayList<MyRoom> mlist = myroomService.selectMyRoom(request.getParameter("userid"));
		model.addAttribute("mlist", mlist);
		}
		// 사진파일 가져오기
		ArrayList<Room_File> rflist = roomService.selectRoomFileList(list);
		model.addAttribute("rflist",rflist);
		
		// 리뷰 평점 평균, 갯수 가져오기
		ArrayList<Review> rvlist = reviewService.selectReviewList(list);		
		model.addAttribute("rvlist", rvlist);
		
		if (list != null) {
			logger.info("룸 객체 : " + list.toString());
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
			HttpServletRequest request,	@RequestParam("address") String address) throws UnsupportedEncodingException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		room.setCheckout_time(ct.getOuthour() + ct.getOutminute());
		room.setCheckin_time(ct.getInhour() + ct.getInminute());
		room.setRoom_address(room.getRoom_roadaddress() +" " + address);
		int result = roomService.insertRoom(room);

		int roomno = roomService.selectRoomNo(room.getUser_id());
		
		List<MultipartFile> fileList = mrequest.getFiles("file");
		ArrayList<Room_File> rflist = new ArrayList<Room_File>();
		String savePath1 = request.getSession().getServletContext().getRealPath("resources/roomFiles");
		int i = 0;
		for (MultipartFile mf : fileList) {
			i += 1;
			Room_File rf = new Room_File();
			String original = mf.getOriginalFilename();
			rf.setOriginal_file(original);
			String rename = sdf.format(new java.sql.Date(System.currentTimeMillis())) + i;
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
		ArrayList<Room_File> rflist = roomService.selectRoomFile(roomno);
		ArrayList<Amenity> Alist = filterService.selectAmenity();
		ArrayList<Build_type> Blist = filterService.selectBuild_type();
		ArrayList<Facility> Flist = filterService.selectFacility();
		ArrayList<Rule> Rlist = filterService.selectRule();
		model.addAttribute("Alist", Alist);
		model.addAttribute("Blist", Blist);
		model.addAttribute("Flist", Flist);
		model.addAttribute("Rlist", Rlist);
		model.addAttribute("rflist", rflist);
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
	
	@RequestMapping("roomUpdate.do")
	public String roomUpdate(Room room, CheckTime ct, Model model, MultipartHttpServletRequest mrequest, HttpServletRequest request,
			@RequestParam(name="address", required=false) String address) {
		room.setCheckout_time("" + ct.getOuthour() + ct.getOutminute());
		room.setCheckin_time(""+ct.getInhour() + ct.getInminute());
		room.setRoom_address(room.getRoom_roadaddress() +" " + address);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		List<MultipartFile> fileList = mrequest.getFiles("files");
		String fileName = fileList.get(0).getOriginalFilename();
		if(fileName.length() != 0) {
		ArrayList<Room_File> rflist = new ArrayList<Room_File>();
		String savePath1 = request.getSession().getServletContext().getRealPath("resources/roomFiles");
		int i = 0;
			for (MultipartFile mf : fileList) {
				i += 1;
				Room_File rf = new Room_File();
				String original = mf.getOriginalFilename();
				rf.setOriginal_file(original);
				String rename = sdf.format(new java.sql.Date(System.currentTimeMillis())) + i;
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
				rf.setRoom_no(room.getRoom_no());
				rflist.add(rf);
			}
			int result2 = roomService.insertRoomFile(rflist);
		}
		int result = roomService.updateRoom(room);
		
		if(result > 0) {
			return "redirect:/moveDetailView.do?room_no="+room.getRoom_no();
		}else {
			model.addAttribute("message", "수정 실패");
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
	
	@RequestMapping(value="SearchFilter.do", method = RequestMethod.POST)
	public String SearchFilter(Room room, Model model, HttpServletRequest request) {
		room.setBed(Integer.parseInt(request.getParameter("bedCount")));
		room.setBedroom(Integer.parseInt(request.getParameter("bedroomCount")));
		room.setBathroom(Integer.parseInt(request.getParameter("bathroomCount")));

		ArrayList<Room> list = roomService.selectSearchFilter(room);
		logger.info("필터 검색 : " + list.toString());
		if (list.size() > 0) {
			model.addAttribute("list", list);
			return "room/roomListView";
		} else {
			model.addAttribute("message", "조회 실패");
			return "common/error";
		}
	}

	@RequestMapping("moveFilterPage.do")
	public String moveFilterPage(Model model) {
		ArrayList<Amenity> Alist = filterService.selectAmenity();
		ArrayList<Build_type> Blist = filterService.selectBuild_type();
		ArrayList<Facility> Flist = filterService.selectFacility();
		ArrayList<Rule> Rlist = filterService.selectRule();
		model.addAttribute("Alist", Alist);
		model.addAttribute("Blist", Blist);
		model.addAttribute("Flist", Flist);
		model.addAttribute("Rlist", Rlist);
		return "room/roomFilterView";
	}

	@RequestMapping("moveSearchList.do")
	public String moveSearchList(@RequestParam("list") ArrayList<Room> list, Model model) {
		model.addAttribute("list", list);
		return "room/roomListView";
	}
	
	@RequestMapping("roomChangePass.do") 
	public String roomChangePass(@RequestParam("user_id") String user_id, Model model) {
		if(roomService.updateRoomChangePass(user_id)> 0) { 
			return "redirect:/moveAdminMemberPage.do"; }
		else {
			model.addAttribute("message", user_id + "님의 호스트 등업을 실패했습니다."); 
			return "common/error"; 
			} 
	}
	
	@RequestMapping(value="deleteFile.do", method=RequestMethod.POST)
	public void deleteFile(Model model, Room_File rfile, HttpServletResponse response) {
		logger.info(rfile.toString());
		int result = roomService.deleteRoomFile(rfile);
		
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












 