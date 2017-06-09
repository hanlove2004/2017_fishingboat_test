package kr.fishingboat.fishingboatedu.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.fishingboat.common.common.CommandMap;

@Controller
public class RegistrationController {
	Logger log = Logger.getLogger(this.getClass());
	
	//@Resource(name = "registrationService")
	//private RegistrationService registrationService;
	
	// 등록증발급 페이지로 이동
	@RequestMapping(value = "/registration/openRegistrationView.do")
	public ModelAndView openMainView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/registration/registrationView");

		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "registrationView");
		
		return mv;
	}
	
}
