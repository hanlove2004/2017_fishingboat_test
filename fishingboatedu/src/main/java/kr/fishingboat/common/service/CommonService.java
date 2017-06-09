package kr.fishingboat.common.service;

import java.util.Map;

public interface CommonService {

	Map<String, Object> selectFishFileInfo(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
}
