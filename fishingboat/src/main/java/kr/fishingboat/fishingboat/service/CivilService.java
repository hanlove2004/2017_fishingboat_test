package kr.fishingboat.fishingboat.service;

import java.util.List;
import java.util.Map;

public interface CivilService {

	List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception;
	
	public void insertQna(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectRuleList(Map<String, Object> map) throws Exception;
	
}
