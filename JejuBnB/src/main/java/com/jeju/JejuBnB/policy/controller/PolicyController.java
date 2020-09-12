package com.jeju.JejuBnB.policy.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.JejuBnB.policy.model.service.PolicyService;
import com.jeju.JejuBnB.policy.model.vo.Policy;

@Controller
public class PolicyController {
	private static final Logger logger = LoggerFactory.getLogger(PolicyController.class);
	
	@Autowired
	private PolicyService policyService;
	
	@RequestMapping("policyPage.do")
	public ModelAndView policyListMethod(ModelAndView mv) {
		ArrayList<Policy> policy = policyService.selectList();
		
		System.out.println(policy);
		
		if(policy != null) {
			mv.setViewName("policy/policyListView");
			 mv.addObject("policy", policy);
		}else {
			
		}
		
		return mv;
	}
	
	@RequestMapping(value="insertpolicy.do", method=RequestMethod.POST)
	public String policyInsert(Policy policy, Model model) {
		
		
		
		if(policyService.insertPolicy(policy) > 0) {
			logger.info(policy.toString());
			return "policy/policyListView";
		
		}else {
			model.addAttribute("message", "약관 등록 실패");
			return "common/error";
		}
	}
	
	@RequestMapping("movePolicyAdd.do")
	public String movePolicyAddPage() {
		return "policy/policyadd";
	}
	
	@RequestMapping("PrivacyPage.do")
	public ModelAndView policyList2Method(ModelAndView mv2) {
		ArrayList<Policy> policy = policyService.selectList();
		
		System.out.println(policy);
		
		if(policy != null) {
			mv2.setViewName("policy/PrivacyPage");
			 mv2.addObject("policy", policy);
		}else {
			
		}
		
		return mv2;
	}
	
}
