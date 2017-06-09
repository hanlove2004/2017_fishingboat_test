package kr.fishingboat.fishingboat.service;

import java.util.List;
import java.util.Map;

public interface MainService {

	public void insertEval(Map<String, Object> map) throws Exception;
	
	public void insertPageStats(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectShipTotal(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectDealList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectPopupList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectSellList(Map<String, Object> map) throws Exception;
	
}
