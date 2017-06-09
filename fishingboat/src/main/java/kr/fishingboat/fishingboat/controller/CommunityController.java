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
import kr.fishingboat.fishingboat.service.CommunityService;

@Controller
public class CommunityController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "communityService")
	private CommunityService communityService;

	// 공지사항 목록
	@RequestMapping(value = "/community/openNoticeList.do")
	public ModelAndView openNoticeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/community/noticeList");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "noticeList");

		return mv;
	}

	@RequestMapping(value = "/community/selectNoticeList.do")
	public ModelAndView selectNoticeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> list = communityService.selectNoticeList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	// 공지사항 상세 보기
	@RequestMapping(value="/community/openNoticeDetail.do")
	public ModelAndView openNoticeDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/community/noticeDetail");
		
		Map<String, Object> map = communityService.selectNoticeDetail(commandMap.getMap());
		mv.addObject("noticeDetail", map.get("map"));
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "noticeDetail");

		return mv;
	}
	
	// 자료실
	@RequestMapping(value = "/community/openDataList.do")
	public ModelAndView openDataList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/community/dataList");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "dataList");

		return mv;
	}

	@RequestMapping(value = "/community/selectDataList.do")
	public ModelAndView selectDataList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> list = communityService.selectDataList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	// 자료실 상세 보기
	@RequestMapping(value="/community/openDataDetail.do")
	public ModelAndView openDataDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/community/dataDetail");
		
		Map<String, Object> map = communityService.selectDataDetail(commandMap.getMap());
		mv.addObject("dataDetail", map.get("map"));
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "dataDetail");

		return mv;
	}
	
	// 자유게시판
	@RequestMapping(value = "/community/openFreeList.do")
	public ModelAndView openFreeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/community/freeList");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "freeList");

		return mv;
	}

	@RequestMapping(value = "/community/selectFreeList.do")
	public ModelAndView selectFreeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> list = communityService.selectFreeList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	// 자유게시판 쓰기 페이지 이동
	@RequestMapping(value = "/community/openFreeWrite.do")
	public ModelAndView openFreeWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/community/freeWrite");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "freeWrite");

		return mv;
	}
	
	// 자유게시판 쓰기 처리
	@RequestMapping(value = "/community/insertFree.do")
	public ModelAndView insertFree(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		@SuppressWarnings("rawtypes")
		Map mberInfo = (Map) request.getSession().getAttribute("mberInfo");
		commandMap.put("usrid", mberInfo.get("USR_ID"));

		System.out.println("************* 제목		: " + commandMap.get("title"));
		System.out.println("************* 내용		: " + commandMap.get("content"));
		System.out.println("************* 작성자ID	: " + commandMap.get("usrid"));
		
		communityService.insertFree(commandMap.getMap());

		return mv;
	}
	
	// 자유게시판 상세 보기
	@RequestMapping(value="/community/openFreeDetail.do")
	public ModelAndView openFreeDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/community/freeDetail");
		
		commandMap.put("view", "detail");
		
		Map<String, Object> map = communityService.selectFreeDetail(commandMap.getMap());
		mv.addObject("freeDetail", map.get("map"));
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "freeDetail");

		return mv;
	}
	
	// 자유게시판 수정 페이지 이동
	@RequestMapping(value="/community/openFreeUpdate.do")
	public ModelAndView openFreeUpdate(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/community/freeUpdate");
		
		commandMap.put("view", "update");
		
		Map<String, Object> map = communityService.selectFreeDetail(commandMap.getMap());
		mv.addObject("freeDetail", map.get("map"));
		
		System.out.println(map.get("map").toString());
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "freeUpdate");
		
		return mv;
	}
	
	// 자유게시판 수정 처리
	@RequestMapping(value = "/community/updateFree.do")
	public ModelAndView updateFree(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		System.out.println("************* 제목		: " + commandMap.get("title"));
		System.out.println("************* 내용		: " + commandMap.get("content"));
		System.out.println("************* seq		: " + commandMap.get("seq"));
		
		communityService.updateFree(commandMap.getMap());

		return mv;
	}

}
