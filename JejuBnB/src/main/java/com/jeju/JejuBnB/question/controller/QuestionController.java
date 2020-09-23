package com.jeju.JejuBnB.question.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.JejuBnB.question.model.service.QuestionService;
import com.jeju.JejuBnB.question.model.vo.Question;

@Controller
public class QuestionController {
	private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);
	
	@Autowired
	private QuestionService questionService;
	
	@RequestMapping("QuestionListView.do")
	public ModelAndView selectList(ModelAndView mv){
		ArrayList<Question> question = questionService.selectList();
		
		if(question != null) {
			mv.setViewName("question/questionListView");
			mv.addObject("question", question);
		}else {
			mv.addObject("message", "조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping(value="myQuestionAdd.do", method=RequestMethod.POST)
	public String insertMyQuestion(Question question, Model model,MultipartHttpServletRequest mrequest,
			HttpServletRequest request,@RequestParam(value="qfile")MultipartFile qfile) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		if(qfile != null) {
			String orgname = qfile.getOriginalFilename();
			
			String savePath = request.getSession().getServletContext().getRealPath("resources/eventimg");
			question.setQuestion_fimg(qfile.getOriginalFilename());
			String rename = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			rename += "." + qfile.getOriginalFilename().substring(qfile.getOriginalFilename().lastIndexOf(".") + 1);
			
			try {
				qfile.transferTo(new File(savePath + "\\" + rename));
			}catch(IllegalStateException | IOException e){
				e.printStackTrace();
			}
			question.setQuestion_fimg(qfile.getOriginalFilename());
			question.setQuestion_rimg(rename);
		}
		
		int result = questionService.insertMyQuestion(question);
		if(result > 0) {
				return "redirect:eventPage.do";
			}else {
				model.addAttribute("message", question + "이벤트 등록 실패");
				return "common/error";
	}
	}
}
