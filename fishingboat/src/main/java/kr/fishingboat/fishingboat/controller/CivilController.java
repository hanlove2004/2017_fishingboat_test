package kr.fishingboat.fishingboat.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.fishingboat.common.common.CommandMap;
import kr.fishingboat.fishingboat.service.CivilService;

@Controller
public class CivilController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "civilService")
	private CivilService civilService;

	// Q&A
	@RequestMapping(value = "/civil/openQnaList.do")
	public ModelAndView openQnaList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/civil/qnaList");

		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "qnaList");
		
		return mv;
	}

	@RequestMapping(value = "/civil/selectQnaList.do")
	public ModelAndView selectQnaList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> list = civilService.selectQnaList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	// Q&A 상세보기
	@RequestMapping(value = "/civil/openQnaDetail.do")
	public ModelAndView openQnaDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/civil/qnaDetail");
		
		Map<String, Object> qnaResult = civilService.selectQnaDetail(commandMap.getMap());
		
		mv.addObject("qnaResult", qnaResult);
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "qnaDetail");
		
		return mv;
	}
	
	// Q&A 쓰기 페이지 이동
	@RequestMapping(value = "/civil/openQnaWrite.do")
	public ModelAndView openQnaWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/civil/qnaWrite");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "qnaWrite");

		return mv;
	}
	
	// Q&A 쓰기 처리
	@RequestMapping(value = "/civil/insertQna.do")
	public ModelAndView insertQna(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		@SuppressWarnings("rawtypes")
		Map mberInfo = (Map) request.getSession().getAttribute("mberInfo");
		commandMap.put("usrid", mberInfo.get("USR_ID"));

		System.out.println("************* 내용		: " + commandMap.get("content"));
		System.out.println("************* 작성자ID	: " + commandMap.get("usrid"));
		
		civilService.insertQna(commandMap.getMap());

		return mv;
	}
	
	// FAQ
	@RequestMapping(value = "/civil/openFaqView.do")
	public ModelAndView openFaqView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/civil/faqView");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "faqView");

		return mv;
	}
	
	// 어선거래절차
	@RequestMapping(value = "/civil/openStepView.do")
	public ModelAndView openStepView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/civil/stepView");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "stepView");

		return mv;
	}
	
	// 관련규정 및 서식
	@RequestMapping(value = "/civil/openRuleList.do")
	public ModelAndView openRuleList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/civil/ruleList");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "ruleList");

		return mv;
	}

	@RequestMapping(value = "/civil/selectRuleList.do")
	public ModelAndView selectRuleList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> list = civilService.selectRuleList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	// 법령 및 제도
	@RequestMapping(value = "/civil/openCivilView.do")
	public ModelAndView openCivilView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/civil/civilView");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "civilView");

		return mv;
	}
	
}
