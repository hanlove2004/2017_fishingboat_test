package kr.fishingboat.fishingboat.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.fishingboat.common.common.CommandMap;
import kr.fishingboat.common.util.SEEDUtil;
import kr.fishingboat.fishingboat.service.LoginmemberService;

@Controller
public class LoginmemberController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "loginmemberService")
	private LoginmemberService loginmemberService;
	
	// 회원정보수정 화면으로 이동
	@RequestMapping(value = "/loginmember/openMemberInfoView.do")
	public ModelAndView openMemberInfoView(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/loginmember/memberUpdate");
		if(request.getSession().getAttribute("mberInfo") != null){
			@SuppressWarnings("rawtypes")
			Map mberInfo = (Map) request.getSession().getAttribute("mberInfo");
			commandMap.put("usrid", mberInfo.get("USR_ID"));
			Map<String, Object> memberResult = loginmemberService.selectMemberInfo(commandMap.getMap());
			
			// 비밀번호 복호화
			int[] seedKey = SEEDUtil.getSeedRoundKey("12121212345456767888978978812312424234324890123456");
			String pw = (String)memberResult.get("PW");
			System.out.println("************* 이전 비밀번호 : " + pw);
			String pwpw = SEEDUtil.getSeedDecrypt(pw, seedKey);
			System.out.println("************* 이후 비밀번호 : " + pwpw);
			memberResult.put("PW", pwpw);
			
			mv.addObject("memberResult", memberResult);
		}
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "memberUpdate");

		return mv;
	}
	
	// 회원정보 수정
	@RequestMapping(value = "/loginmember/updateMemberInfo.do")
	public ModelAndView updateMemberInfo(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		@SuppressWarnings("rawtypes")
		Map mberInfo = (Map) request.getSession().getAttribute("mberInfo");
		commandMap.put("usrid", mberInfo.get("USR_ID"));
		
		String phonetrue = commandMap.getMap().get("phone_select") + "-" + commandMap.getMap().get("phone") + "-" + commandMap.getMap().get("phone1");
		commandMap.put("phonetrue", phonetrue);
		
		String emailtrue = commandMap.getMap().get("email") + "@" + commandMap.getMap().get("email2");
		commandMap.put("emailtrue", emailtrue);
		
		System.out.println("************* 아이디		: " + mberInfo.get("USR_ID"));
		System.out.println("************* 비밀번호	: " + commandMap.get("usrpw"));
		System.out.println("************* 연락처		: " + commandMap.get("phonetrue"));
		System.out.println("************* 이메일		: " + commandMap.get("emailtrue"));
		
		int[] seedKey = SEEDUtil.getSeedRoundKey("12121212345456767888978978812312424234324890123456");
		
		//비밀번호 처리
		String pw = (String)commandMap.get("usrpw");
		String pwpw = SEEDUtil.getSeedEncrypt(pw, seedKey);
		commandMap.put("usrpw", pwpw);

		loginmemberService.updateMemberInfo(commandMap.getMap());

		return mv;
	}
	
	// 회원탈퇴 화면으로 이동
	@RequestMapping(value = "/loginmember/openMemberDeleteView.do")
	public ModelAndView openMemberDeleteView(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/loginmember/memberDelete");
		if(request.getSession().getAttribute("mberInfo") != null){
			@SuppressWarnings("rawtypes")
			Map mberInfo = (Map) request.getSession().getAttribute("mberInfo");
			commandMap.put("usrid", mberInfo.get("USR_ID"));
			
			Map<String, Object> memberResult = loginmemberService.selectMemberInfo(commandMap.getMap());
			
			// 비밀번호 복호화
			int[] seedKey = SEEDUtil.getSeedRoundKey("12121212345456767888978978812312424234324890123456");
			String pw = (String)memberResult.get("PW");
			System.out.println("************* 이전 비밀번호 : " + pw);
			String pwpw = SEEDUtil.getSeedDecrypt(pw, seedKey);
			System.out.println("************* 이후 비밀번호 : " + pwpw);
			memberResult.put("PW", pwpw);
			
			mv.addObject("memberResult", memberResult);
		}
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "memberDelete");

		return mv;
	}
	
	// 회원탈퇴
	@RequestMapping(value = "/loginmember/deleteMember.do")
	public ModelAndView deleteMember(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		@SuppressWarnings("rawtypes")
		Map mberInfo = (Map) request.getSession().getAttribute("mberInfo");
		commandMap.put("usrid", mberInfo.get("USR_ID"));
		
		loginmemberService.deleteMember(commandMap.getMap());
		
		request.getSession().setAttribute("mberInfo", null);
		request.getSession().invalidate();

		return mv;
	}

}
