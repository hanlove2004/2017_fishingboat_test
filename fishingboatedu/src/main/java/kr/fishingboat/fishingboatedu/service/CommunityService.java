package kr.fishingboat.fishingboatedu.service;

import java.util.List;
import java.util.Map;

public interface CommunityService {

	List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception;

}
