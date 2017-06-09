package kr.fishingboat.fishingboatedu.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.fishingboat.common.common.CommandMap;
import kr.fishingboat.fishingboatedu.service.MainService;

@Controller
public class MainController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "mainService")
	private MainService mainService;
	
	// 메인화면
	@RequestMapping(value = "/main/openEduMainView.do")
	public ModelAndView openMainView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/eduMainView");

		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "eduMainView");
		
		return mv;
	}
	
	// 로그인 시간 연장
	@RequestMapping(value = "/main/loginCheck.do")
	public ModelAndView loginCheck(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		mv.addObject("result", "ok");
		
		return mv;
	}
	
	// 페이지 평가 등록
	@RequestMapping(value = "/main/insertEval.do")
	public ModelAndView insertEval(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		System.out.println("************* 페이지명	: " + commandMap.get("page"));
		System.out.println("************* 작성자ID	: " + commandMap.get("evalid"));
		System.out.println("************* 평가점수	: " + commandMap.get("evalchk"));
		
		mainService.insertEval(commandMap.getMap());

		return mv;
	}
	
	// 페이지 로그 등록
	@RequestMapping(value = "/main/insertPageStats.do")
	public ModelAndView insertPageStats(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		System.out.println("************* IP주소		: " + commandMap.get("usr_ip"));
		System.out.println("************* 페이지		: " + commandMap.get("page"));
		System.out.println("************* id		: " + commandMap.get("usr_id"));
		
		mainService.insertPageStats(commandMap.getMap());

		return mv;
	}
	
}
