package kr.fishingboat.fishingboat.service;

import java.util.List;
import java.util.Map;

public interface InfoService {

	List<Map<String, Object>> selectInfoList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectInfoDetail(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectInfoSearchList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectInfoSearchDetail(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectStoreList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectGugunKeyList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectStoreDetail(Map<String, Object> map) throws Exception;
	
	public void insertStoreAddr(Map<String, Object> map) throws Exception;
	
	public void insertStore(Map<String, Object> map) throws Exception;
	
}
