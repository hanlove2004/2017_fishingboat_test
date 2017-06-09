package kr.fishingboat.fishingboat.service;

import java.util.Map;

public interface MemberService {

	Map<String, Object> selectLogin(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectIdCheck(Map<String, Object> map) throws Exception;
	
	void insertJoin(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectUsrIdSearch(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectUsrPwSearch(Map<String, Object> map) throws Exception;
	
	void updateMemberPw(Map<String, Object> map) throws Exception;

}
