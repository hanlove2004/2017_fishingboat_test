package kr.fishingboat.fishingboatedu.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
import kr.fishingboat.common.util.SEEDUtil;
import kr.fishingboat.fishingboatedu.service.ApplicationService;

@Controller
public class ApplicationController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "applicationService")
	private ApplicationService applicationService;
	
	// 교육신청 페이지로 이동
	@RequestMapping(value = "/application/openApplicationView.do")
	public ModelAndView openApplicationView(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/application/applicationView");

		@SuppressWarnings("rawtypes")
		Map mberInfo = (Map) request.getSession().getAttribute("mberInfo");
		
		if(mberInfo != null) {
			commandMap.put("edu_num", mberInfo.get("EDU_NUM"));
			Map<String, Object> applicationDetail = applicationService.selectApplication(commandMap.getMap());
			mv.addObject("applicationDetail", applicationDetail);
		} else {
			mv.addObject("applicationDetail", "");
		}
		
		// 교육신청 가능 목록 조회
		List<Map<String, Object>> eduList = applicationService.selectEducationList(commandMap.getMap());
		mv.addObject("eduList", eduList);
		
		// 중개업 수행 지역 (시도) 목록 조회
		List<Map<String, Object>> brokerSidoList = applicationService.selectBrokerSidoList(commandMap.getMap());
		mv.addObject("brokerSidoList", brokerSidoList);
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "applicationView");
		
		return mv;
	}
	
	// 반명함사진 파일 처리
	@RequestMapping(value = "/application/faceImgageUpload.do", method = RequestMethod.POST)
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
		
		String filetype_path = "education" + "\\";
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

				file = new File(filePath + filetype_path + storedFileName);
				multipartFile.transferTo(file);

				map = new HashMap<String, Object>();
				map.put("ORIGINAL_FILE_NAME", originalFileName);
				map.put("STORED_FILE_NAME", storedFileName);
				map.put("FILE_SIZE", multipartFile.getSize());
				map.put("board_type", "education");
				
				applicationService.insertApplicationImage(map);
			}
		}
		
		mv.addObject("file", map);
		
		return mv;
	}
	
	// 교육신청 처리
	@RequestMapping(value = "/application/insertApplication.do")
	public ModelAndView insertApplication(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		String emailtrue = commandMap.getMap().get("email") + "@" + commandMap.getMap().get("email2");
		commandMap.put("emailtrue", emailtrue);
		
		@SuppressWarnings("rawtypes")
		Map edu_num = applicationService.selectEduNum(commandMap.getMap());
		commandMap.put("edu_num", edu_num.get("EDU_NUM"));
		
		System.out.println("****** edu_infor_seq(교육정보 순번)		::" + commandMap.getMap().get("edu_infor_seq"));
		System.out.println("*************** edu_num(접수번호)		::" + commandMap.getMap().get("edu_num"));
		System.out.println("*************** ORIGINAL_FILE_NAME	::" + commandMap.getMap().get("ORIGINAL_FILE_NAME"));
		System.out.println("*************** STORED_FILE_NAME	::" + commandMap.getMap().get("STORED_FILE_NAME"));
		System.out.println("*************** name				::" + commandMap.getMap().get("name"));
		System.out.println("*************** birth				::" + commandMap.getMap().get("birth"));
		System.out.println("*************** emailtrue			::" + commandMap.getMap().get("emailtrue"));
		System.out.println("*************** phone				::" + commandMap.getMap().get("phone"));
		System.out.println("*************** sample6_postcode	::" + commandMap.getMap().get("sample6_postcode"));
		System.out.println("*************** sample6_address		::" + commandMap.getMap().get("sample6_address"));
		System.out.println("*************** sample6_address2	::" + commandMap.getMap().get("sample6_address2"));
		System.out.println("*************** dormitoryYN			::" + commandMap.getMap().get("dormitoryYN"));
		System.out.println("*************** brokerYN			::" + commandMap.getMap().get("brokerYN"));
		System.out.println("*************** broker_sido			::" + commandMap.getMap().get("broker_sido"));
		System.out.println("*************** broker_gugun		::" + commandMap.getMap().get("broker_gugun"));
		System.out.println("*************** pwd					::" + commandMap.getMap().get("pwd"));
		
		// check.check 비밀번호 암호화 처리
		int[] seedKey = SEEDUtil.getSeedRoundKey("12121212345456767888978978812312424234324890123456");
		
		//비밀번호 처리
		String pwd = (String)commandMap.get("pwd");
		String pwdpwd = SEEDUtil.getSeedEncrypt(pwd, seedKey);
		commandMap.put("pwd", pwdpwd);
		
		applicationService.insertApplication(commandMap.getMap());
		mv.addObject("edu_num", edu_num.get("EDU_NUM"));

		return mv;
	}
	
	// 교육신청 취소
	@RequestMapping(value = "/application/updateApplicationState.do")
	public ModelAndView updateApplicationState(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		commandMap.put("edu_app_state", "s3");
		
		System.out.println("*************** edu_num(접수번호)		::" + commandMap.getMap().get("edu_num"));
		System.out.println("*************** seq					::" + commandMap.getMap().get("seq"));
		
		applicationService.updateApplicationState(commandMap.getMap());
		
		request.getSession().setAttribute("mberInfo", null);
		request.getSession().invalidate();

		return mv;
	}
	
	// 교육 접수증 출력 페이지로 이동
	@RequestMapping(value = "/application/openApplicationReport.do")
	public ModelAndView openApplicationReport(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/application/reportView");
		
		@SuppressWarnings("rawtypes")
		Map mberInfo = (Map) request.getSession().getAttribute("mberInfo");
		
		if(commandMap.getMap().get("edu_num") != null){
			Map<String, Object> applicationDetail = applicationService.selectApplication(commandMap.getMap());
			mv.addObject("applicationDetail", applicationDetail);
		} else if(commandMap.getMap().get("edu_num") == null && mberInfo != null) {
			commandMap.put("edu_num", mberInfo.get("EDU_NUM"));
			Map<String, Object> applicationDetail = applicationService.selectApplication(commandMap.getMap());
			mv.addObject("applicationDetail", applicationDetail);
		} else {
			mv.addObject("applicationDetail", "");
		}
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "reportView");
		
		return mv;
	}
	
	// 중개업 수행 지역 조회
	@RequestMapping(value = "/application/selectBrokerGugunList.do")
	public ModelAndView selectBrokerGugunList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String, Object>> brokerGugunList = applicationService.selectBrokerGugunList(commandMap.getMap());
		mv.addObject("brokerGugunList", brokerGugunList);
		
		return mv;
	}
	
}
