package kr.fishingboat.fishingboat.service;

import java.util.List;
import java.util.Map;

public interface SearchService {

	List<Map<String, Object>> selectSearchList(Map<String, Object> map) throws Exception;
	
}
