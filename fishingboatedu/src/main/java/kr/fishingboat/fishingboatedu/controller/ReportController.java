package kr.fishingboat.fishingboatedu.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.fishingboat.common.common.CommandMap;

@Controller
public class ReportController {
	Logger log = Logger.getLogger(this.getClass());
	
	/*@Resource(name = "applicationService")
	private ApplicationService applicationService;*/
	
	// 어선중개업자 교육 접수증
	@RequestMapping(value = "/application/applicationReport.do")
	public ModelAndView applicationReport(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/ClipReport4/applicationReport");

		return mv;
	}
	
	// ClipReport Test
	// 
	@RequestMapping(value = "/report/Clip.do")
	public ModelAndView Clip(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/ClipReport4/Clip");

		return mv;
	}
	
	// 
	@RequestMapping(value = "/report/Property.do")
	public ModelAndView Property(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/ClipReport4/Property");

		return mv;
	}
	
	// 
	@RequestMapping(value = "/report/sysinfo.do")
	public ModelAndView sysinfo(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/ClipReport4/sysinfo");

		return mv;
	}
	
	// 
	@RequestMapping(value = "/report/test.do")
	public ModelAndView test(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/ClipReport4/test");

		return mv;
	}
	
}
