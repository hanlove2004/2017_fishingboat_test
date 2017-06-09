package kr.fishingboat.fishingboatedu.service;

import java.util.List;
import java.util.Map;

public interface ApplicationService {
	
	List<Map<String, Object>> selectEducationList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectEduNum(Map<String, Object> map) throws Exception;
	
	public void insertApplication(Map<String, Object> map) throws Exception;
	
	public void insertApplicationImage(Map<String, Object> map) throws Exception;
	
	public void updateApplicationState(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectApplication(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectBrokerSidoList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectBrokerGugunList(Map<String, Object> map) throws Exception;
	
}
