package kr.fishingboat.fishingboatedu.service;

import java.util.Map;

public interface MemberService {

	Map<String, Object> selectLogin(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectIdCheck(Map<String, Object> map) throws Exception;
	
	void insertJoin(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectBrokeUsrIdSearch(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectBrokeUsrPwSearch(Map<String, Object> map) throws Exception;
	
	void updateBroMemberPw(Map<String, Object> map) throws Exception;

}
