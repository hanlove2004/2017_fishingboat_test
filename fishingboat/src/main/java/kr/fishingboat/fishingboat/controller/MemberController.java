package kr.fishingboat.fishingboat.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.fishingboat.common.common.CommandMap;
import kr.fishingboat.common.util.SEEDUtil;
import kr.fishingboat.fishingboat.service.MemberService;

@Controller
public class MemberController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "memberService")
	private MemberService memberService;

	@Autowired
	private JavaMailSender javaMailSender;
	
	// 회원가입 Form
	@RequestMapping(value = "/member/openJoinView.do")
	public ModelAndView openJoinView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/joinView");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "joinView");

		return mv;
	}
	
	@RequestMapping(value = "/member/insertJoin.do")
	public ModelAndView insertJoin(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		String phonetrue = commandMap.getMap().get("phone_select") + "-" + commandMap.getMap().get("phone") + "-" + commandMap.getMap().get("phone1");
		commandMap.put("phonetrue", phonetrue);
		
		String emailtrue = commandMap.getMap().get("email") + "@" + commandMap.getMap().get("email2");
		commandMap.put("emailtrue", emailtrue);
		
		System.out.println("************* 아이디		: " + commandMap.get("usrid"));
		System.out.println("************* 비밀번호	: " + commandMap.get("usrpw"));
		System.out.println("************* 이름		: " + commandMap.get("name"));
		System.out.println("************* 연락처		: " + commandMap.get("phonetrue"));
		System.out.println("************* 이메일		: " + commandMap.get("emailtrue"));
		
		int[] seedKey = SEEDUtil.getSeedRoundKey("12121212345456767888978978812312424234324890123456");
		
		//비밀번호 처리
		String pw = (String)commandMap.get("usrpw");
		String pwpw = SEEDUtil.getSeedEncrypt(pw, seedKey);
		commandMap.put("usrpw", pwpw);

		memberService.insertJoin(commandMap.getMap());
		//mv.addObject("result", result);
		System.out.println("******************** mv.toString() : " + mv.toString());

		return mv;
	}
	
	// 아이디 중복검사
	@RequestMapping(value = "/member/selectIdCheck.do")
	public ModelAndView selectIdCheck(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		Map<String, Object> result = memberService.selectIdCheck(commandMap.getMap());
		mv.addObject("result", result);

		return mv;
	}
	
	// 로그인 Form
	@RequestMapping(value = "/member/openLoginView.do")
	public ModelAndView openLoginView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/loginView");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "loginView");

		return mv;
	}
	
	@RequestMapping(value = "/member/selectLogin.do")
	public ModelAndView selectLogin(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		int[] seedKey = SEEDUtil.getSeedRoundKey("12121212345456767888978978812312424234324890123456");
		
		String pw = (String)commandMap.get("usrpw");
		//System.out.println("************* 아이디 : " + commandMap.get("usrid"));
		//System.out.println("************* 비밀번호 : " + commandMap.get("usrpw"));
		String pwpw = SEEDUtil.getSeedEncrypt(pw, seedKey);
		commandMap.put("usrpw", pwpw);
		
		System.out.println("login commandMap : " + commandMap.toString());

		Map<String, Object> loginResult = memberService.selectLogin(commandMap.getMap());
		if(loginResult != null){
			request.getSession().setAttribute("mberInfo", loginResult);
			mv.addObject("result", "success");
		} else {
			mv.addObject("result", "fail");
		}

		return mv;
	}
	
	// 로그 아웃
	@RequestMapping(value = "/member/selectLogout.do")
	public ModelAndView viewLoginOut(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/main/openMainView.do");
		
		request.getSession().setAttribute("mberInfo", null);
		request.getSession().invalidate();
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "mainView");

		return mv;
	}
	
	// 아이디찾기 Form
	@RequestMapping(value = "/member/openSearchIdView.do")
	public ModelAndView openSearchIdView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/searchIdView");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "searchIdView");

		return mv;
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/member/selectUsrIdSearch.do")
	public ModelAndView selectUsrIdSearch(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		Map<String, Object> result = memberService.selectUsrIdSearch(commandMap.getMap());
		mv.addObject("result", result);
		
		// result가 있을 경우 메일 전송
		if(result != null) {
			MimeMessage message = javaMailSender.createMimeMessage();
			try {
				message.setSubject("[어선거래시스템] 회원님의 아이디를 알려드립니다.", "UTF-8");
				String htmlContent = "<p style='font-size: 15px; font-family: verdana;'><strong>안녕하세요</strong>, 반갑습니다.</p>";
				htmlContent += "<p style='font-size: 15px; font-family: verdana;'> 어선거래시스템 관리자입니다.</p>";
				htmlContent += "<p style='font-size: 15px; font-family: verdana;'> " + result.get("NAM") + " 회원님의 아이디는 <b>" + result.get("USR_ID") + "</b> 입니다.</p>";
				htmlContent += "<p style='font-size: 15px; font-family: verdana;'> 확인하시고 다시 로그인해 주시기 바랍니다.</p>";
				// check.check 아래 링크 수정해야함.
				htmlContent += "<br /><br /><p  style='font-size: 15px; font-family: verdana;'> <a href='http://www.fishingboat-test.com' target='_blank' >[어선거래시스템]으로 이동</a></p>";
				message.setText(htmlContent, "UTF-8", "html");
				//message.setFrom(new InternetAddress("hanchan@billion21.com"));
				message.addRecipient(RecipientType.TO, new InternetAddress((String) result.get("USR_EMAIL")));
				javaMailSender.send(message);
			} catch (MailException e) {
				e.printStackTrace();
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}

		return mv;
	}
	
	// 비밀번호찾기 Form
	@RequestMapping(value = "/member/openSearchPwView.do")
	public ModelAndView openSearchPwView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/searchPwView");
		
		// check.check 페이지 평가를 위한 page 정보
		mv.addObject("page", "searchPwView");

		return mv;
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/member/selectUsrPwSearch.do")
	public ModelAndView selectUsrPwSearch(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		Map<String, Object> result = memberService.selectUsrPwSearch(commandMap.getMap());
		mv.addObject("result", result);
		
		// check.check result가 있을 경우 메일 전송 (비밀번호를 임의로 생성해서 알려주는건가?)
		if(result != null) {
			// 임시 비밀번호 생성 ///////////////////////////////////////
			int index = 0;
			int length = 8;
			char[] charSet = new char[] {
					'0','1','2','3','4','5','6','7','8','9'
					,'A','B','C','D','E','F','G','H','I','J','K','L','M'
					,'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
					,'a','b','c','d','e','f','g','h','i','j','k','l','m'
					,'n','o','p','q','r','s','t','u','v','w','x','y','z'};
			
			StringBuffer sb = new StringBuffer();
			for(int i = 0; i < length; i++){
				index = (int)(charSet.length * Math.random());
				sb.append(charSet[index]);
			}
			String tmprPw = sb.toString() + "!";
			System.out.println("************* 임시 비밀번호 : " + tmprPw);
			///////////////////////////////////////////////////////////
			
			// 비밀번호 암호화 /////////////////////////////////////////////////////////
			int[] seedKey = SEEDUtil.getSeedRoundKey("12121212345456767888978978812312424234324890123456");
			
			//비밀번호 처리
			String tmprPwPw = SEEDUtil.getSeedEncrypt(tmprPw, seedKey);
			System.out.println("************* 임시 비밀번호 (AFTER SEEDUTIL) : " + tmprPwPw);
			///////////////////////////////////////////////////////////
			
			// check.check 회원 정보의 PW를 임시비밀번호로 update
			// commandMap.put("tmpr_pw", tmprPwPw);
			// memberService.updateMemberPw(commandMap.getMap());
			
			MimeMessage message = javaMailSender.createMimeMessage();
			try {
				message.setSubject("[어선거래시스템] 회원님의 비밀번호를 알려드립니다.", "UTF-8");
				String htmlContent = "<p style='font-size: 15px; font-family: verdana;'><strong>안녕하세요</strong>, 반갑습니다.</p>";
				htmlContent += "<p style='font-size: 15px; font-family: verdana;'>어선거래시스템 관리자입니다.</p>";
				htmlContent += "<p style='font-size: 15px; font-family: verdana;'>" + result.get("NAM") + " 회원님의 비밀번호는 <b>" + result.get("PW") + "</b> 입니다.</p>";
				htmlContent += "<p style='font-size: 15px; font-family: verdana;'>" + result.get("NAM") + " 회원님의 임시 비밀번호는 <b>" + tmprPw + "</b> 입니다.</p>";
				htmlContent += "<p style='font-size: 15px; font-family: verdana;'> 확인하시고 임시비밀번호로 로그인해 주시기 바랍니다. (기존 비밀번호로는 로그인되지 않습니다.)</p>";
				// check.check 아래 링크 수정해야함.
				htmlContent += "<br /><br /> <p style='font-size: 15px; font-family: verdana;'><a href='http://www.fishingboat-test.com' target='_blank' >[어선거래시스템]으로 이동</a></p>";
				message.setText(htmlContent, "UTF-8", "html");
				//message.setFrom(new InternetAddress("hanchan@billion21.com"));
				message.addRecipient(RecipientType.TO, new InternetAddress((String) result.get("USR_EMAIL")));
				javaMailSender.send(message);
			} catch (MailException e) {
				e.printStackTrace();
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}
		
		return mv;
	}	

}
