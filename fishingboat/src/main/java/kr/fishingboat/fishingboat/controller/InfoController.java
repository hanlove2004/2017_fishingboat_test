package kr.fishingboat.fishingboat.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.fishingboat.common.common.CommandMap;
import kr.fishingboat.fishingboat.service.InfoService;

@Controller
public class InfoController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "infoService")
	private InfoService infoService;

	// 어선기본정보 조회
	@RequestMapping(value = "/info/openInfoList.do")
	public ModelAndView openInfoList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/info/infoList");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "infoList");

		return mv;
	}

	@RequestMapping(value = "/info/selectInfoList.do")
	public ModelAndView selectInfoList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> list = infoService.selectInfoList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	// 어선기본정보 상세보기
	@RequestMapping(value = "/info/openInfoDetail.do")
	public ModelAndView openInfoDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/info/infoDetail");
		
		Map<String, Object> infoResult = infoService.selectInfoDetail(commandMap.getMap());
		
		mv.addObject("infoResult", infoResult);
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "infoDetail");

		return mv;
	}
	
	// 어선검사정보 조회
	@RequestMapping(value = "/info/openInfoSearchList.do")
	public ModelAndView openInfoSearchList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/info/infoSearchList");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "infoSearchList");

		return mv;
	}

	@RequestMapping(value = "/info/selectInfoSearchList.do")
	public ModelAndView selectInfoSearchList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> list = infoService.selectInfoSearchList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	// 어선검사정보 상세보기
	@RequestMapping(value = "/info/openInfoSearchDetail.do")
	public ModelAndView selectInfoSearchDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/info/infoSearchDetail");
		
		Map<String, Object> infoSearchResult = infoService.selectInfoSearchDetail(commandMap.getMap());
		
		mv.addObject("infoSearchResult", infoSearchResult);
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "infoSearchDetail");

		return mv;
	}
	
	// 기타 어선 관련 정보 조회 (업체 정보)
	@RequestMapping(value = "/info/openStoreList.do")
	public ModelAndView openStoreList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/info/storeList");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "storeList");

		return mv;
	}

	@RequestMapping(value = "/info/selectStoreList.do")
	public ModelAndView selectStoreList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> list = infoService.selectStoreList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	// 업체 정보 목록에서 구군 목록 검색
	@RequestMapping(value = "/info/selectGugunKeyList.do")
	public ModelAndView selectGugunKeyList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> list = infoService.selectGugunKeyList(commandMap.getMap());
		mv.addObject("list", list);

		return mv;
	}
	
	// 타 어선 관련 정보 (업체 정보) 상세보기
	@RequestMapping(value = "/info/openStoreDetail.do")
	public ModelAndView selectStoreDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/info/storeDetail");
		
		Map<String, Object> storeResult = infoService.selectStoreDetail(commandMap.getMap());
		
		mv.addObject("storeResult", storeResult);
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "storeDetail");

		return mv;
	}
	
	// 업체 등록 페이지 이동
	@RequestMapping(value = "/info/openStoreWrite.do")
	public ModelAndView openSellWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/info/storeWrite");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "storeWrite");

		return mv;
	}
	
	// 업체 등록 처리
	@RequestMapping(value = "/info/insertStore.do")
	public ModelAndView insertStore(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		System.out.println("*************** storename			::" + commandMap.getMap().get("storename"));
		System.out.println("*************** storeboss			::" + commandMap.getMap().get("storeboss"));
		System.out.println("*************** storetel			::" + commandMap.getMap().get("storetel"));
		System.out.println("*************** phonenumber			::" + commandMap.getMap().get("phonenumber"));
		System.out.println("*************** storenumber			::" + commandMap.getMap().get("storenumber"));
		System.out.println("*************** storesdate			::" + commandMap.getMap().get("storesdate"));
		System.out.println("*************** storeurl			::" + commandMap.getMap().get("storeurl"));
		System.out.println("*************** sample6_postcode	::" + commandMap.getMap().get("sample6_postcode"));
		System.out.println("*************** sample6_address		::" + commandMap.getMap().get("sample6_address"));
		System.out.println("*************** sample6_address2	::" + commandMap.getMap().get("sample6_address2"));
		System.out.println("*************** introtext			::" + commandMap.getMap().get("introtext"));
		System.out.println("*************** makeservice			::" + commandMap.getMap().get("makeservice"));
		System.out.println("*************** usr_id				::" + commandMap.getMap().get("usr_id"));
		System.out.println("*************** ORIGINAL_FILE_NAME	::" + commandMap.getMap().get("ORIGINAL_FILE_NAME"));
		System.out.println("*************** STORED_FILE_NAME	::" + commandMap.getMap().get("STORED_FILE_NAME"));
		
		infoService.insertStore(commandMap.getMap());

		return mv;
	}
	
	@RequestMapping(value = "/info/addrUpload.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView upload(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		String filePath = "C:\\2017_FISINGBOAT\\source\\fishingboat_files\\";
		
		Iterator<String> iterator =  request.getFileNames();
		MultipartFile multipartFile = null;
		
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		Map<String, Object> map = null;
		
		//String root_path = request.getSession().getServletContext().getRealPath("/");  
		//String attach_path = "file/";
		String filetype_path = "store" + "\\";
		
		//File file = new File(root_path + attach_path);
		File file = new File(filePath + filetype_path);
		
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while (iterator.hasNext()) {
			multipartFile = request.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = new Long(System.currentTimeMillis()).toString() + originalFileExtension;
				
				System.out.println("****************** originFileName :: " + originalFileName);
				System.out.println("****************** storedFileName :: " + storedFileName);

				//file = new File(root_path + attach_path + storedFileName);
				file = new File(filePath + filetype_path + storedFileName);
				multipartFile.transferTo(file);

				map = new HashMap<String, Object>();
				map.put("ORIGINAL_FILE_NAME", originalFileName);
				map.put("STORED_FILE_NAME", storedFileName);
				map.put("FILE_SIZE", multipartFile.getSize());
				map.put("board_type", "storeboard");
				
				infoService.insertStoreAddr(map);
			}
		}
		
		mv.addObject("file", map);
		
		return mv;
	}


}
