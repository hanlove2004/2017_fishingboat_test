package kr.fishingboat.fishingboatedu.controller;

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
import kr.fishingboat.fishingboatedu.service.MemberService;

@Controller
public class MemberController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "memberService")
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender javaMailSender;

	// 로그인 Form
	@RequestMapping(value = "/member/openEduLoginView.do")
	public ModelAndView openLoginView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/eduLoginView");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "eduLoginView");

		return mv;
	}
	
	@RequestMapping(value = "/member/selectLogin.do")
	public ModelAndView selectLogin(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		int[] seedKey = SEEDUtil.getSeedRoundKey("12121212345456767888978978812312424234324890123456");
		
		String pw = (String)commandMap.get("usrpw");
		String pwpw = SEEDUtil.getSeedEncrypt(pw, seedKey);
		commandMap.put("usrpw", pwpw);
		
		System.out.println("login commandMap : " + commandMap.toString());

		@SuppressWarnings("unchecked")
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
	@RequestMapping(value = "/member/selectEduLogout.do")
	public ModelAndView viewLoginOut(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/eduMainView");
		
		request.getSession().setAttribute("mberInfo", null);
		request.getSession().invalidate();
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "eduMainView");

		return mv;
	}
	
	// 아이디찾기 Form
	@RequestMapping(value = "/member/openBrokeSearchIdView.do")
	public ModelAndView openSearchIdView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/brokeSearchIdView");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "brokeSearchIdView");

		return mv;
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/member/selectBrokeUsrIdSearch.do")
	public ModelAndView selectUsrIdSearch(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		@SuppressWarnings("unchecked")
		Map<String, Object> result = memberService.selectBrokeUsrIdSearch(commandMap.getMap());
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
				htmlContent += "<br /><br /><p  style='font-size: 15px; font-family: verdana;'> <a href='http://www.fishingboatbroke-test.com' target='_blank' >[어선거래시스템-중개인]으로 이동</a></p>";
				message.setText(htmlContent, "UTF-8", "html");
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
	@RequestMapping(value = "/member/openBrokeSearchPwView.do")
	public ModelAndView openSearchPwView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/brokeSearchPwView");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "brokeSearchPwView");

		return mv;
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/member/selectBrokeUsrPwSearch.do")
	public ModelAndView selectUsrPwSearch(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		@SuppressWarnings("unchecked")
		Map<String, Object> result = memberService.selectBrokeUsrPwSearch(commandMap.getMap());
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
			// memberService.updateBroMemberPw(commandMap.getMap());
			
			MimeMessage message = javaMailSender.createMimeMessage();
			try {
				message.setSubject("[어선거래시스템] 회원님의 비밀번호를 알려드립니다.", "UTF-8");
				String htmlContent = "<p style='font-size: 15px; font-family: verdana;'><strong>안녕하세요</strong>, 반갑습니다.</p>";
				htmlContent += "<p style='font-size: 15px; font-family: verdana;'>어선거래시스템 관리자입니다.</p>";
				htmlContent += "<p style='font-size: 15px; font-family: verdana;'>" + result.get("NAM") + " 회원님의 비밀번호는 <b>" + result.get("PW") + "</b> 입니다.</p>";
				htmlContent += "<p style='font-size: 15px; font-family: verdana;'>" + result.get("NAM") + " 회원님의 임시 비밀번호는 <b>" + tmprPw + "</b> 입니다.</p>";
				htmlContent += "<p style='font-size: 15px; font-family: verdana;'> 확인하시고 임시비밀번호로 로그인해 주시기 바랍니다. (기존 비밀번호로는 로그인되지 않습니다.)</p>";
				// check.check 아래 링크 수정해야함.
				htmlContent += "<br /><br /><p  style='font-size: 15px; font-family: verdana;'> <a href='http://www.fishingboatbroke-test.com' target='_blank' >[어선거래시스템-중개인]으로 이동</a></p>";
				message.setText(htmlContent, "UTF-8", "html");
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
