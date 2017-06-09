package kr.fishingboat.fishingboat.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface DealService {

	List<Map<String, Object>> selectSellList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectSellBrokerList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectSellBrokerDetail(Map<String, Object> map) throws Exception;
	
	public void updateBrokerChk(Map<String, Object> map) throws Exception;
	
	public void insertSellBrokerSms(Map<String, Object> map) throws Exception;
	
	public void updateBrokerChkno(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectSellDetail(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectSatisfaction(Map<String, Object> map) throws Exception;

	public void insertBrokerSatis(Map<String, Object> map) throws Exception;
	
	public void insertSell(Map<String, Object> map) throws Exception;
	
	public void insertSellSms(Map<String, Object> map) throws Exception;
	
	public void insertSellPic(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	Map<String, Object> selectShipChk(Map<String, Object> map) throws Exception;
	
	public void updateSell(Map<String, Object> map) throws Exception;
	
	public void deleteSell(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectBuyList(Map<String, Object> map) throws Exception;
	
	public void insertBuy(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectBuyBrokerList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectBuyDetail(Map<String, Object> map) throws Exception;
	
	public void updateBuy(Map<String, Object> map) throws Exception;
	
	public void deleteBuy(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectDealList(Map<String, Object> map) throws Exception;
	
}
