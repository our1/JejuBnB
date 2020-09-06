
package com.jeju.JejuBnB.member.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.JejuBnB.member.model.service.MemberService;
import com.jeju.JejuBnB.member.model.vo.Member;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	

	@Autowired
	private MemberService memberService;
	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping(value="login.do", method= RequestMethod.POST)
	public String loginMethod(Member member, HttpSession session, Model model) {
		logger.info("login.do user_id :   " + member.getUser_id() + "   password : " + member.getUser_pwd());
		
		Member loginMember = memberService.selectLogin(member);
		model.addAttribute("loginMember", loginMember);
		
		if(loginMember != null && bcryptPasswordEncoder.matches(member.getUser_pwd(), loginMember.getUser_pwd())) {
			
			String facebookid = loginMember.getFacebook_id();
			if(facebookid != null) {
				model.addAttribute("message" , "페이스북 아이디 입니다.");
				return "common/error" ;
			}else {
			session.setAttribute("loginMember", loginMember);
			return "member/tempPage";
			}
			
		}else {
			
			model.addAttribute("message", "회원 정보와 일치하지 않습니다.");
			return "common/error";
		}
	}
	@RequestMapping(value="facebooklogin.do", method= RequestMethod.GET)
	public String facebookLoginMethod(Member member, HttpSession session, Model model, @RequestParam("email") String email, @RequestParam("name") String name) {
		logger.info("login.do user_id :   " + member.getUser_id() + "   password : " + member.getUser_pwd());
		
		member.setUser_id(email);
		Member loginMember = memberService.selectFacebookLogin(member);
		model.addAttribute("loginMember", loginMember);
		
		if(loginMember != null  ) {
			
			String facebookid = loginMember.getFacebook_id();
			if(facebookid != null) {
				session.setAttribute("loginMember", loginMember);
				return "member/tempPage";
			}
			
			model.addAttribute("message" , "페이스북 아이디가 아닙니다.");
			return "common/error" ;
			
			
		}else {
			
			model.addAttribute("email" , email);
			model.addAttribute("name" , name);
			return "member/facebookEnrollPage" ;
		}
	}
	
	@RequestMapping("logout.do")
	public String logoutMethod(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			
			session.invalidate();
			return "common/main";
		}else {
			model.addAttribute("message", "로그인 세션이 존재하지 않습니다.");
			return "common/error";
		}
	}
	
	
	
	@RequestMapping(value= "enroll.do", method= RequestMethod.POST)
	public String memberinsert(Member member, Model model) {
		logger.info("enroll : " + member);
		
		member.setUser_pwd(bcryptPasswordEncoder.encode(member.getUser_pwd()));
		
		if(memberService.insertMember(member)> 0) {
			return "member/loginPage";
			
		}else {
			model.addAttribute("message", "회원 등록 실패했습니다.");
		}
		return "common/error";
	}
	
	@RequestMapping("myinfo.do")
	public ModelAndView myInfoMethod(@RequestParam("user_id") String user_id, ModelAndView mv) {

		/*String user_id = request.getParameter("user_id");*/
		
		Member member = memberService.selectMember(user_id);
		if(member != null) {
			
			mv.setViewName("member/myinfoPage");
			mv.addObject("member", member);
			
		}else {
			mv.addObject("message", user_id + "에 대한 정보 조회 실패 했습니다.");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	@RequestMapping("mupdate.do")
	public String moveUpdateView(Member member, Model model) {
		if(memberService.updateMember(member)>0) {
			return "redirect:/myinfo.do?user_id=" + member.getUser_id();
		}else {
			model.addAttribute("message" ," 회원 정보 수정 실패 했습니다.");
			return "common/error";
		}
		
	}
	@RequestMapping("mdel.do")
	public String memberDeleteMethod(
			@RequestParam("user_id") String user_id, Model model
			) {
		if(memberService.deleteMember(user_id)> 0) {
			return "redirect:/logout.do";
			
		}else {
			model.addAttribute("message", user_id + "회원 탈퇴를 실패했습니다.");
			return "common/error";
		}
		
	}
	@RequestMapping("idchk.do")
	public void idCheckMethod(
			@RequestParam("user_id") String user_id, Model model, HttpServletResponse response
			) {
		int idcount = memberService.selectIdCheck(user_id);
		String returnValue= null;
		if(idcount == 0) {
			returnValue= "ok";
		}else {
			returnValue= "no";
		}
		response.setContentType("text/html; chatset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.append(returnValue);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	

    @RequestMapping( value = "auth.do" , method=RequestMethod.POST )
    public ModelAndView mailSending(HttpServletRequest request, @RequestParam ("e_mail") String e_mail, HttpServletResponse response_email) throws IOException {

        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; 
        
        String setfrom = "8135123@gmail.com";
        String tomail = e_mail ;             
        String title = "회원가입 인증 이메일 입니다."; 
        String content =
        
        System.getProperty("line.separator")+ 
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 인증번호는 " +dice+ " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; 
        
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            messageHelper.setFrom(setfrom); 
            messageHelper.setTo(tomail); 
            messageHelper.setSubject(title); 
            messageHelper.setText(content); 
            
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        ModelAndView mv = new ModelAndView();    
        mv.setViewName("member/email_injeung");    
        mv.addObject("dice", dice);
        mv.addObject("user_id", tomail);
        
        System.out.println("mv : "+mv);

        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
        
        
        return mv;
        
    }
	
    @RequestMapping(value = "join_injeung.do", method = RequestMethod.POST)
    public ModelAndView join_injeung(@RequestParam("email_injeung") String email_injeung, @RequestParam ("dice") String dice, @RequestParam ("user_id") String user_id, HttpServletResponse response_equals) throws IOException {
 
        
        
        
        System.out.println("마지막 : email_injeung : "+email_injeung);
        
        System.out.println("마지막 : dice : "+dice);
        
        
         
        ModelAndView mv = new ModelAndView();
        
        mv.setViewName("/member/join.do");
        
        mv.addObject("e_mail",email_injeung);
        
        if (email_injeung.equals(dice)) {
            
            
            
            
            mv.setViewName("member/enrollPage");
            
            mv.addObject("user_id",user_id);
            

            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
            out_equals.flush();
    
            return mv;
            
            
        }else if (email_injeung != dice) {
            
            
            ModelAndView mv2 = new ModelAndView(); 
            
            mv2.setViewName("member/email_injeung");
            
            response_equals.setContentType("text/html; charset=UTF-8");
            PrintWriter out_equals = response_equals.getWriter();
            out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
            out_equals.flush();
            
    
            return mv2;
            
        }    
    
        return mv;
        
    }

	
	
	
	/* view 이동 */
	
	@RequestMapping("mupview.do")
	public ModelAndView moveUpdateView(@RequestParam("user_id") String user_id, ModelAndView mv) {
		Member member = memberService.selectMember(user_id);
		if(member != null) {
			mv.addObject("member", member);
			mv.setViewName("member/memberUpdatePage");
		}else {
			mv.addObject("message", user_id + "에 대한 수정 페이지 이동 실패 했습니다.");
			mv.setViewName("common/error");
			
		}
		
		return mv;
	}
	

	@RequestMapping("enrollPage.do")
	public String moveEnrollPage() {
		return "member/enrollPage";
	}
	


	@RequestMapping("loginPage.do")
	   public String moveLoginPage() {
	      return "member/loginPage";
	   }
	
	
	@RequestMapping("facebookenrollPage.do")
	public String moveFacebookEnrollPage() {
		return "member/facebookEnrollPage";
	}
	
	@RequestMapping("email.do")
    public String email() {
        return "member/email";
    }
	
	
}
