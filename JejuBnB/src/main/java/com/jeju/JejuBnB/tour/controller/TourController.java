package com.jeju.JejuBnB.tour.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.JejuBnB.tour.model.service.TourService;
import com.jeju.JejuBnB.tour.model.vo.Tour;
import com.jeju.JejuBnB.tour.model.vo.Tour_Review;

@Controller
public class TourController {
	private static final Logger logger = LoggerFactory.getLogger(TourController.class);
	
	@Autowired
	private TourService tourService;
	
	@RequestMapping("tlist.do")
	public String Tourlist(HttpServletRequest request, Model model) {
		int limit = 15;
		int currentPage = 1;
		if ( request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		ArrayList<Tour> list = tourService.selectTour(currentPage, limit);
		
		if(list != null) {
			model.addAttribute("list", list);
			logger.info(list.toString());
			return "tour/tourListView";
		} else {
			model.addAttribute("message", "조회 실패");
			return "common/error";
		}
	}
	@RequestMapping("tourNoMap.do")
	public String TourNoMaplist(HttpServletRequest request, Model model) {
		int limit = 15;
		int currentPage = 1;
		if ( request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		ArrayList<Tour> list = tourService.selectTour(currentPage, limit);
		
		if(list != null) {
			model.addAttribute("list", list);
			logger.info(list.toString());
			return "tour/tourNoMapList";
		} else {
			model.addAttribute("message", "조회 실패");
			return "common/error";
		}
	}
	
	@RequestMapping("tdetail.do")
	public ModelAndView TourDetail(ModelAndView mv, @RequestParam("tour_no") int tour_no) {
		Tour tour = tourService.SelectTourDetail(tour_no);
		if( tour != null) {
			mv.setViewName("tour/tourDetailView");
			mv.addObject("tour", tour);
			logger.info(tour.toString());
		} else {
			mv.setViewName("common/error");
			mv.addObject("message","조회 실패");
		}
		return mv;
	}

	@RequestMapping("tmovewrite.do")
	public String MoveTourWriteForm() {
		return "tour/tourWriteForm";
	}
	
	/*@RequestMapping(value="tinsert.do", method = RequestMethod.POST)
	public String TourInsert(Tour tour, Model model, MultipartHttpServletRequest mrequest, HttpServletRequest request,
	        @RequestParam(value = "ofile", required = false) MultipartFile ofile, @RequestParam("address") String address ) {
		String orgname = ofile.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyMMddHHmmss");
		
		if (!orgname.isEmpty()) {
			String savePath =request.getSession().getServletContext().getRealPath("resources/tourThumbnail");
			tour.setTour_thumbnail_original_file(ofile.getOriginalFilename());
			String rename = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			rename += "." + ofile.getOriginalFilename().substring(ofile.getOriginalFilename().lastIndexOf(".") + 1);
			
			try {
				ofile.transferTo(new File(savePath + "\\" + rename));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			} 
			tour.setTour_thumbnail_original_file(ofile.getOriginalFilename());
			tour.setTour_thumbnail_rename_file(rename);
		}
		
		Tour tono = tourService.selectTourNo(tour.getUser_id());
		int touno = tono.getTour_no() + 1;
		logger.info("" + touno);
		List<MultipartFile> fileList = mrequest.getFiles("file");
		ArrayList<Tour_Image> tilist = new ArrayList<Tour_Image>();
		String savePath1 = request.getSession().getServletContext().getRealPath("resources/tourImage");
		
		for (MultipartFile mf : fileList) {
			Tour_Image ti = new Tour_Image();
			String original = mf.getOriginalFilename();
			ti.setTour_original_file(original);
			String rename = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			rename += "." + original.substring(original.lastIndexOf(".") + 1);
			
			try {
				mf.transferTo(new File(savePath1 + "\\" + rename));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				model.addAttribute("message", "사진 저장 실패");
				return "common/error";
			}
			
			ti.setTour_original_file(original);
			ti.setTour_rename_file(rename);
			ti.setTour_no(touno);
			tilist.add(ti);
		}
		
		tour.setTour_address(tour.getTour_address() + address);
		
		int result = tourService.insertTour(tour);
		int result2 = tourService.insertTourImage(tilist);
		if ( result > 0 ) {
			return "rediret:/tlist.do";
		} else {
			model.addAttribute("message", "등록 실패");
			return "common/error";
		}
	}*/
	
	
	@RequestMapping("trwrite.do")
	public String MoveReviewWrite() {
		return "tour/tourReviewWriteForm";
	}
	
	@RequestMapping("cou.do")
	public String cou() {
		return "tour/cou";
	}
	
	@RequestMapping("test.do")
	public String test() {
		return "tour/test";
	}
	
	@RequestMapping("movetupdate.do")
	public ModelAndView moverTourView(@RequestParam("tour_no") int tour_no, ModelAndView mv) {
		Tour tour = tourService.SelectTourDetail(tour_no);
		if ( tour != null ) {
			mv.addObject("tour", tour);
			mv.setViewName("tour/tourUpdateForm");
		} else {
			mv.addObject("message", "수정 페이지 이동 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping("tdelete.do")
	public String deleteTourMethod(@RequestParam("tour_no") int tour_no, Model model) {
		int result = tourService.deleteTour(tour_no);
		if (result > 0) {
			return "redirect:/tlist.do";
		} else {
			model.addAttribute("message", "관광지 게시글  삭제 실패");
			return "common/error";
		}
	}
	
    @RequestMapping("trlist.do")
    public ModelAndView ReviewList(ModelAndView mv,Tour_Review tour_review) {
    	List<Tour_Review> list = tourService.selectTourReview(tour_review);
    	
    	Map<String,Object> map = new HashMap<>();
    	
    	map.put("list", list);
    	
    	mv.addObject("map", map);
    	
    	mv.setViewName("tour/tourReviewList");
    	
    	return mv;
    }
    @RequestMapping("trinsert.do")
    public void insertReview(Tour_Review tour_review, HttpSession session, @RequestParam(value="tour_review_no") int tour_review_no, @RequestParam(value="tour_review_content") String tour_review_content, @RequestParam(value="tour_score") int tour_score) {
    	logger.info("" + tour_review);
    	
    	if ( session.getAttribute("user_id") != null) {
    		String user_id = (String)session.getAttribute("user_id");
    		tour_review.setUser_id(user_id);
    	}
    	
    	tour_review.setTour_review_content(tour_review_content);
    	tour_review.setTour_score(tour_score);
    	
    	tourService.insertTourReview(tour_review);
    }
	@RequestMapping("trupdate.do")
	public String updateReview(@RequestParam(value="tour_review_no") int tour_review_no, @RequestParam(value="tour_review_content") String tour_review_content,
			@RequestParam(value="tour_score") int tour_score, @RequestParam(value="user_id") String user_id, Tour_Review tour_review ) {
		
			tour_review.setTour_review_no(tour_review_no);
			tour_review.setTour_review_content(tour_review_content);
			tour_review.setTour_score(tour_score);
			tour_review.setUser_id(user_id);
			
			tourService.updateTourReview(tour_review);
			
			return "tour/tourReviewList";
	}
	@RequestMapping("tinsert.do") 
	public String insertTour(Tour tour) {
		tourService.insertTour(tour); 
		return "redirect:tlist.do";
		}

	
	@GetMapping("tupdate.do")
	public String modify(@RequestParam("tour_no") int tour_no, Model model) {
		model.addAttribute("tour", tourService.SelectTourDetail(tour_no));
		return "tour/tourDetailView";
	}

	@PostMapping("tupdate.do")
	public String modify(Tour tour) {
		tourService.updateTour(tour);
		return "redirect:tdetail.do?tour_no="+ tour.getTour_no();
	}
}

