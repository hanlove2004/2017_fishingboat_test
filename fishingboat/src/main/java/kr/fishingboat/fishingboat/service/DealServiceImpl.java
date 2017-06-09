package kr.fishingboat.fishingboat.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import kr.fishingboat.common.util.FileUtils;
import kr.fishingboat.fishingboat.dao.DealDAO;

@Service("dealService")
public class DealServiceImpl implements DealService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "dealDAO")
	private DealDAO dealDAO;

	@Override
	public List<Map<String, Object>> selectSellList(Map<String, Object> map) throws Exception {
		return dealDAO.selectSellList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectSellBrokerList(Map<String, Object> map) throws Exception {
		return dealDAO.selectSellBrokerList(map);
	}
	
	@Override
	public Map<String, Object> selectSellBrokerDetail(Map<String, Object> map) throws Exception {
		return dealDAO.selectSellBrokerDetail(map);
	}
	
	@Override
	public void updateBrokerChk(Map<String, Object> map) throws Exception {
		dealDAO.updateBrokerChk(map);
	}
	
	@Override
	public void insertSellBrokerSms(Map<String, Object> map) throws Exception {
		dealDAO.insertSellBrokerSms(map);
	}
	
	@Override
	public void updateBrokerChkno(Map<String, Object> map) throws Exception {
		dealDAO.updateBrokerChkno(map);
	}
	
	@Override
	public Map<String, Object> selectSellDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> sellResult = dealDAO.selectSellDetail(map);
		resultMap.put("sellResult", sellResult);

		List<Map<String, Object>> sellImgList = dealDAO.selectSellImgList(map);
		resultMap.put("sellImgList", sellImgList);
		
		List<Map<String, Object>> brokeYn = dealDAO.selectBrokerYn(map);
		resultMap.put("brokeYn", brokeYn);
		
		/*List<Map<String, Object>> brokeSatis = dealDAO.selectBrokerSatis(map);
		resultMap.put("brokeSatis", brokeSatis);*/
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectSatisfaction(Map<String, Object> map) throws Exception {
		return dealDAO.selectSatisfaction(map);
	}
	
	@Override
	public void insertBrokerSatis(Map<String, Object> map) throws Exception {
		dealDAO.insertBrokerSatis(map);
	}
	
	@Override
	public void insertSell(Map<String, Object> map) throws Exception {
		dealDAO.insertSell(map);
	}
	
	@Override
	public void insertSellSms(Map<String, Object> map) throws Exception {
		dealDAO.insertSellSms(map);
	}
	
	@Override
	public void insertSellPic(Map<String, Object> map, HttpServletRequest request) throws Exception {
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for (int i = 0, size = list.size(); i < size; i++) {
			dealDAO.insertSellPic(list.get(i));
		}
	}
	
	@Override
	public Map<String, Object> selectShipChk(Map<String, Object> map) throws Exception {
		return dealDAO.selectShipChk(map);
	}
	
	@Override
	public void updateSell(Map<String, Object> map) throws Exception {
		dealDAO.updateSell(map);
	}
	
	@Override
	public void deleteSell(Map<String, Object> map) throws Exception {
		dealDAO.deleteSell(map);
	}
	
	@Override
	public List<Map<String, Object>> selectBuyList(Map<String, Object> map) throws Exception {
		return dealDAO.selectBuyList(map);
	}
	
	@Override
	public void insertBuy(Map<String, Object> map) throws Exception {
		dealDAO.insertBuy(map);
	}
	
	@Override
	public List<Map<String, Object>> selectBuyBrokerList(Map<String, Object> map) throws Exception {
		return dealDAO.selectBuyBrokerList(map);
	}
	
	@Override
	public Map<String, Object> selectBuyDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> buyResult = dealDAO.selectBuyDetail(map);
		resultMap.put("buyResult", buyResult);
		
		List<Map<String, Object>> brokeYn = dealDAO.selectBrokerYn(map);
		resultMap.put("brokeYn", brokeYn);
		
		return resultMap;
	}
	
	@Override
	public void updateBuy(Map<String, Object> map) throws Exception {
		dealDAO.updateBuy(map);
	}
	
	@Override
	public void deleteBuy(Map<String, Object> map) throws Exception {
		dealDAO.deleteBuy(map);
	}
	
	@Override
	public List<Map<String, Object>> selectDealList(Map<String, Object> map) throws Exception {
		return dealDAO.selectDealList(map);
	}

}
