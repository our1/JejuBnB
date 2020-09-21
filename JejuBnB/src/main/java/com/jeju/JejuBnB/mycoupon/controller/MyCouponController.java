package com.jeju.JejuBnB.mycoupon.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jeju.JejuBnB.mycoupon.model.service.MyCouponService;
import com.jeju.JejuBnB.mycoupon.model.vo.MyCoupon;


@Controller
public class MyCouponController {
	private static final Logger logger = LoggerFactory.getLogger(MyCouponController.class);
	
	@Autowired
	private MyCouponService mycouponService;
	
	@RequestMapping("insertMyCoupon.do")
	public String insertMyCoupon(MyCoupon mycoupon, Model model) {
		MyCoupon mycouponlist = mycouponService.selectList(mycoupon);
		
		if(mycouponlist == null) {
			
			if(mycouponService.insertMyCoupon(mycoupon) > 0) {
				return "redirect:main.do";
			}else {
				model.addAttribute("message", "쿠폰 등록이 실패 했습니다.");
				return "common/error";
			}
		}else {
			model.addAttribute("message", "중복 되었습니다.");
			return "common/error";
		}

	}
	
}
