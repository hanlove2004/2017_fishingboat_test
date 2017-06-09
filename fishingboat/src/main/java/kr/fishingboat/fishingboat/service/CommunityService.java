package kr.fishingboat.fishingboat.service;

import java.util.List;
import java.util.Map;

public interface CommunityService {

	List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectDataList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectDataDetail(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectFreeList(Map<String, Object> map) throws Exception;
	
	void insertFree(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectFreeDetail(Map<String, Object> map) throws Exception;
	
	void updateFree(Map<String, Object> map) throws Exception;

}
