package kr.fishingboat.fishingboat.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import kr.fishingboat.common.util.FileUtils;
import kr.fishingboat.fishingboat.dao.CommunityDAO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "communityDAO")
	private CommunityDAO communityDAO;

	@Override
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		return communityDAO.selectNoticeList(map);
	}
	
	@Override
	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception {
		communityDAO.updateNoticeHitCnt(map);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = communityDAO.selectNoticeDetail(map);
		resultMap.put("map", tempMap);

		return resultMap;
	}
	
	@Override
	public List<Map<String, Object>> selectDataList(Map<String, Object> map) throws Exception {
		return communityDAO.selectDataList(map);
	}
	
	@Override
	public Map<String, Object> selectDataDetail(Map<String, Object> map) throws Exception {
		communityDAO.updateDataHitCnt(map);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = communityDAO.selectDataDetail(map);
		resultMap.put("map", tempMap);

		return resultMap;
	}
	
	@Override
	public List<Map<String, Object>> selectFreeList(Map<String, Object> map) throws Exception {
		return communityDAO.selectFreeList(map);
	}
	
	@Override
	public void insertFree(Map<String, Object> map) throws Exception {
		communityDAO.insertFree(map);
	}
	
	@Override
	public Map<String, Object> selectFreeDetail(Map<String, Object> map) throws Exception {
		if(map.get("view").equals("detail")){
			communityDAO.updateFreeHitCnt(map);
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = communityDAO.selectFreeDetail(map);
		resultMap.put("map", tempMap);

		return resultMap;
	}
	
	@Override
	public void updateFree(Map<String, Object> map) throws Exception {
		communityDAO.updateFree(map);
	}

}
