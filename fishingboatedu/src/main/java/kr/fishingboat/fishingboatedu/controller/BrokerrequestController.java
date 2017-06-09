package kr.fishingboat.fishingboatedu.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.fishingboat.common.common.CommandMap;

@Controller
public class BrokerrequestController {
	Logger log = Logger.getLogger(this.getClass());
	
	//@Resource(name = "resultcheckService")
	//private ResultcheckService resultcheckService;
	
	// 중개업신청 페이지로 이동
	@RequestMapping(value = "/brokerrequest/openBrokerRequestView.do")
	public ModelAndView openMainView(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/brokerrequest/brokerrequestView");

		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "brokerrequestView");
		
		return mv;
	}
	
}
