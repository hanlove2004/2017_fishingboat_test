package kr.fishingboat.fishingboat.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.fishingboat.common.common.CommandMap;
import kr.fishingboat.fishingboat.service.SearchService;

@Controller
public class SearchController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "searchService")
	private SearchService searchService;

	// 검색 목록
	@RequestMapping(value = "/search/openSearchList.do")
	public ModelAndView openSearchList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/search/searchList");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "searchList");

		return mv;
	}

	@RequestMapping(value = "/search/selectSearchList.do")
	public ModelAndView selectSearchList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		System.out.println("**************************** " + commandMap.getMap().get("search_type"));
		
		List<Map<String, Object>> list = searchService.selectSearchList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}

}
