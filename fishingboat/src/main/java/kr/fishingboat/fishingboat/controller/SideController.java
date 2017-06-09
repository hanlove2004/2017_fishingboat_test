package kr.fishingboat.fishingboat.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.fishingboat.common.common.CommandMap;

@Controller
public class SideController {
	Logger log = Logger.getLogger(this.getClass());

	// 이용안내
	@RequestMapping(value = "/side/openSideView.do")
	public ModelAndView openSideView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/side/sideView");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "sideView");

		return mv;
	}
	
	// 개인정보처리방침
	@RequestMapping(value = "/side/openPersonalView.do")
	public ModelAndView openPersonalView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/side/personalView");

		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "personalView");
		
		return mv;
	}
	
	// 저작권법 정책
	@RequestMapping(value = "/side/openClauseView.do")
	public ModelAndView openClauseView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/side/clauseView");

		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "clauseView");
		
		return mv;
	}
	
	// 찾아오시는 길
	@RequestMapping(value = "/side/openAddrView.do")
	public ModelAndView openAddrView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/side/addrView");

		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "addrView");
		
		return mv;
	}
	
	// 사이트맵
	@RequestMapping(value = "/side/openSitemapView.do")
	public ModelAndView openSitemapView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/side/sitemapView");

		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "sitemapView");
		
		return mv;
	}
	
	// 뷰어다운로드
	@RequestMapping(value = "/side/openViewerView.do")
	public ModelAndView openViewerView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/side/viewerView");

		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "viewerView");
		
		return mv;
	}
	
}
