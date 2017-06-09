package kr.fishingboat.fishingboat.service;

import java.util.Map;

public interface LoginmemberService {

	Map<String, Object> selectMemberInfo(Map<String, Object> map) throws Exception;
	
	public void updateMemberInfo(Map<String, Object> map) throws Exception;
	
	public void deleteMember(Map<String, Object> map) throws Exception;

}
