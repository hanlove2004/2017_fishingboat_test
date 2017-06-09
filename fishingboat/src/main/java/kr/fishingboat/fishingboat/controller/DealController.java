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
import kr.fishingboat.common.util.FileUtils;
import kr.fishingboat.fishingboat.service.DealService;

@Controller
public class DealController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "dealService")
	private DealService dealService;
	
	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	// 어선매도
	@RequestMapping(value = "/deal/openSellList.do")
	public ModelAndView openSellList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/deal/sellList");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "sellList");
		
		return mv;
	}

	@RequestMapping(value = "/deal/selectSellList.do")
	public ModelAndView selectSellList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		@SuppressWarnings("rawtypes")
		Map mberInfo = (Map) request.getSession().getAttribute("mberInfo");
		commandMap.put("usrid", mberInfo.get("USR_ID"));

		List<Map<String, Object>> list = dealService.selectSellList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	// 어선매도 목록에서 중개인 목록 보기
	@RequestMapping(value = "/deal/openSellBrokerList.do")
	public ModelAndView openSellBrokerList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/deal/sellBrokerList");
		
		List<Map<String, Object>> list = dealService.selectSellBrokerList(commandMap.getMap());
		mv.addObject("list", list);
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "sellBrokerList");

		return mv;
	}
	
	// 어선매도 목록에서 중개인 상세 보기
	@RequestMapping(value = "/deal/openSellBrokerDetail.do")
	public ModelAndView openSellBrokerDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/deal/sellBrokerDetail");
		
		Map<String, Object> brokerResult = dealService.selectSellBrokerDetail(commandMap.getMap());
		mv.addObject("brokerResult", brokerResult);
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "sellBrokerDetail");

		return mv;
	}
	
	// 중개인 선정
	@RequestMapping(value = "/deal/updateBrokerChk.do")
	public ModelAndView updateBrokerChk(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		System.out.println("************* 중개인ID		: " + commandMap.get("broid"));
		System.out.println("************* 작성자ID		: " + commandMap.get("usrid"));
		System.out.println("************* borokerSEQ	: " + commandMap.get("broseq"));
		System.out.println("************* SEQ			: " + commandMap.get("seq"));
		System.out.println("************* brotype		: " + commandMap.get("brotype"));
		
		dealService.updateBrokerChk(commandMap.getMap());

		return mv;
	}
	
	// 중개인 선정 시 SMS 발송
	@RequestMapping(value = "/deal/insertSellBrokerSms.do")
	public ModelAndView insertSellBrokerSms(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		dealService.insertSellBrokerSms(commandMap.getMap());

		return mv;
	}
		
	// 중개인 선정 취소
	@RequestMapping(value = "/deal/updateBrokerChkno.do")
	public ModelAndView updateBrokerChkno(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		System.out.println("************* 중개인ID		: " + commandMap.get("broid"));
		System.out.println("************* 작성자ID		: " + commandMap.get("usrid"));
		System.out.println("************* borokerSEQ	: " + commandMap.get("broseq"));
		System.out.println("************* SEQ			: " + commandMap.get("seq"));
		System.out.println("************* brotype		: " + commandMap.get("brotype"));
		
		dealService.updateBrokerChkno(commandMap.getMap());

		return mv;
	}
	
	// 어선매도 상세보기
	@RequestMapping(value = "/deal/openSellDetail.do")
	public ModelAndView openSellDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/deal/sellDetail");
		
		// 추후에 login한 usrid로 할 것인가 등록한 id로 할 것인가는 결정 필요
		// (현재 list 자체가 login한 아이디의 값으로 출력되기 때문에 문제 없음)
		@SuppressWarnings("rawtypes")
		Map mberInfo = (Map) request.getSession().getAttribute("mberInfo");
		commandMap.put("usrid", mberInfo.get("USR_ID"));
		
		Map<String, Object> sellMap = dealService.selectSellDetail(commandMap.getMap());
		
		mv.addObject("sellResult", sellMap.get("sellResult"));
		mv.addObject("sellImgList", sellMap.get("sellImgList"));
		mv.addObject("brokeYn", sellMap.get("brokeYn"));
		//mv.addObject("brokeSatis", sellMap.get("brokeSatis"));
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "sellDetail");

		return mv;
	}
	
	// 중개인 평가 조회
	@RequestMapping(value = "/deal/selectSatisfaction.do")
	public ModelAndView selectSatisfaction(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		System.out.println("************* 중개인ID	: " + commandMap.get("broid"));
		System.out.println("************* 작성자ID	: " + commandMap.get("usrid"));
		System.out.println("************* SEQ		: " + commandMap.get("seq"));
		
		Map<String, Object> safisResult = dealService.selectSatisfaction(commandMap.getMap());
		
		mv.addObject("safisResult", safisResult);

		return mv;
	}
	
	// 중개인 평가 등록
	@RequestMapping(value = "/deal/insertBrokerSatis.do")
	public ModelAndView insertBrokerSatis(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		System.out.println("************* 중개인ID	: " + commandMap.get("broid"));
		System.out.println("************* 작성자ID	: " + commandMap.get("usrid"));
		System.out.println("************* SEQ		: " + commandMap.get("seq"));
		System.out.println("************* 평점		: " + commandMap.get("rate"));
		
		dealService.insertBrokerSatis(commandMap.getMap());

		return mv;
	}
	
	// 어선매도 등록 페이지 이동
	@RequestMapping(value = "/deal/openSellWrite.do")
	public ModelAndView openSellWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/deal/sellWrite");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "sellWrite");

		return mv;
	}
	
	// 어선매도 등록
	@RequestMapping(value = "/deal/insertSell.do")
	public ModelAndView insertSell(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		dealService.insertSell(commandMap.getMap());

		return mv;
	}
	
	// 어선매도 등록 시 SMS 발송
	@RequestMapping(value = "/deal/insertSellSms.do")
	public ModelAndView insertSellSms(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		dealService.insertSellSms(commandMap.getMap());

		return mv;
	}
	
	// 어선매도 사진 등록
	@RequestMapping(value = "/deal/insertSellPic.do")
	public ModelAndView insertSellPic(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/deal/openSellList.do");
		
		dealService.insertSellPic(commandMap.getMap(), request);

		return mv;
	}
	
	// 어선정보 조회
	@RequestMapping(value = "/deal/selectShipChk.do")
	public ModelAndView selectShipChk(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		System.out.println("************* 어선번호	: " + commandMap.get("shipno"));
		
		Map<String, Object> shipResult = dealService.selectShipChk(commandMap.getMap());
		
		mv.addObject("shipResult", shipResult);

		return mv;
	}
	
	// 어선매도 수정화면으로 이동
	@RequestMapping(value = "/deal/openSellUpdate.do")
	public ModelAndView openSellUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/deal/sellUpdate");
		
		Map<String, Object> sellMap = dealService.selectSellDetail(commandMap.getMap());
		
		mv.addObject("sellResult", sellMap.get("sellResult"));
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "sellUpdate");

		return mv;
	}
	
	// 어선매도 수정
	@RequestMapping(value = "/deal/updateSell.do")
	public ModelAndView updateSell(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		dealService.updateSell(commandMap.getMap());

		return mv;
	}
	
	// 어선매도 삭제
	@RequestMapping(value = "/deal/deleteSell.do")
	public ModelAndView deleteSell(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		System.out.println("************* seq ::" + commandMap.getMap().get("seq"));
		System.out.println("************* usrid ::" + commandMap.getMap().get("usrid"));
		
		dealService.deleteSell(commandMap.getMap());

		return mv;
	}
	
	// 어선매수
	@RequestMapping(value = "/deal/openBuyList.do")
	public ModelAndView openBuyList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/deal/buyList");

		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "buyList");
		
		return mv;
	}

	@RequestMapping(value = "/deal/selectBuyList.do")
	public ModelAndView selectBuyList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		@SuppressWarnings("rawtypes")
		Map mberInfo = (Map) request.getSession().getAttribute("mberInfo");
		commandMap.put("usrid", mberInfo.get("USR_ID"));

		List<Map<String, Object>> list = dealService.selectBuyList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	// 어선매수 등록 페이지 이동
	@RequestMapping(value = "/deal/openBuyWrite.do")
	public ModelAndView openBuyWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/deal/buyWrite");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "buyWrite");

		return mv;
	}
	
	// 어선매수 등록
	@RequestMapping(value = "/deal/insertBuy.do")
	public ModelAndView insertBuy(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		dealService.insertBuy(commandMap.getMap());

		return mv;
	}
	
	// 어선매수 목록에서 중개인 목록 보기
	@RequestMapping(value = "/deal/openBuyBrokerList.do")
	public ModelAndView openBuyBrokerList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/deal/buyBrokerList");
		
		List<Map<String, Object>> list = dealService.selectBuyBrokerList(commandMap.getMap());
		mv.addObject("list", list);
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "buyBrokerList");

		return mv;
	}
	
	// 어선매수 목록에서 중개인 상세 보기
	@RequestMapping(value = "/deal/openBuyBrokerDetail.do")
	public ModelAndView openBuyBrokerDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/deal/buyBrokerDetail");
		
		Map<String, Object> brokerResult = dealService.selectSellBrokerDetail(commandMap.getMap());
		mv.addObject("brokerResult", brokerResult);
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "buyBrokerDetail");

		return mv;
	}
	
	// 어선매수 상세보기
	@RequestMapping(value = "/deal/openBuyDetail.do")
	public ModelAndView openBuyDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/deal/buyDetail");
		
		// 추후에 login한 usrid로 할 것인가 등록한 id로 할 것인가는 결정 필요
		// (현재 list 자체가 login한 아이디의 값으로 출력되기 때문에 문제 없음)
		@SuppressWarnings("rawtypes")
		Map mberInfo = (Map) request.getSession().getAttribute("mberInfo");
		commandMap.put("usrid", mberInfo.get("USR_ID"));
		
		Map<String, Object> buyMap = dealService.selectBuyDetail(commandMap.getMap());
		
		mv.addObject("buyResult", buyMap.get("buyResult"));
		mv.addObject("brokeYn", buyMap.get("brokeYn"));
		//mv.addObject("brokeSatis", sellMap.get("brokeSatis"));
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "buyDetail");

		return mv;
	}
	
	// 어선매수 수정화면으로 이동
	@RequestMapping(value = "/deal/openBuyUpdate.do")
	public ModelAndView openBuyUpdate(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/deal/buyUpdate");
		
		Map<String, Object> sellMap = dealService.selectBuyDetail(commandMap.getMap());
		mv.addObject("buyResult", sellMap.get("buyResult"));
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "buyUpdate");

		return mv;
	}
	
	// 어선매수 수정
	@RequestMapping(value = "/deal/updateBuy.do")
	public ModelAndView updateBuy(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		dealService.updateBuy(commandMap.getMap());

		return mv;
	}
	
	// 어선매수 삭제
	@RequestMapping(value = "/deal/deleteBuy.do")
	public ModelAndView deleteBuy(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		dealService.deleteBuy(commandMap.getMap());

		return mv;
	}
	
	// 매물현황
	@RequestMapping(value = "/deal/openDealList.do")
	public ModelAndView openDealList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/deal/dealList");
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "dealList");

		return mv;
	}

	@RequestMapping(value = "/deal/selectDealList.do")
	public ModelAndView selectDealList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String, Object>> list = dealService.selectDealList(commandMap.getMap());
		mv.addObject("list", list);
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}

		return mv;
	}
	
	// 매물현황 상세보기
	@RequestMapping(value = "/deal/openDealDetail.do")
	public ModelAndView openDealDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/deal/dealDetail");
		
		if(commandMap.getMap().get("brotype").equals("sell")){
			Map<String, Object> sellMap = dealService.selectSellDetail(commandMap.getMap());
			
			mv.addObject("sellResult", sellMap.get("sellResult"));
			mv.addObject("sellImgList", sellMap.get("sellImgList"));
		} else if(commandMap.getMap().get("brotype").equals("buy")) {
			Map<String, Object> buyMap = dealService.selectBuyDetail(commandMap.getMap());
			
			mv.addObject("buyResult", buyMap.get("buyResult"));
		}
		
		// 페이지 평가를 위한 page 정보
		mv.addObject("page", "dealDetail");

		return mv;
	}

}
