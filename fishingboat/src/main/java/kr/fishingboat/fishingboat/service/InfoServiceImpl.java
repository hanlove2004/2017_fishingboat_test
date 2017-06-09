package kr.fishingboat.fishingboat.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import kr.fishingboat.common.util.FileUtils;
import kr.fishingboat.fishingboat.dao.InfoDAO;

@Service("infoService")
public class InfoServiceImpl implements InfoService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "infoDAO")
	private InfoDAO infoDAO;

	@Override
	public List<Map<String, Object>> selectInfoList(Map<String, Object> map) throws Exception {
		return infoDAO.selectInfoList(map);
	}
	
	@Override
	public Map<String, Object> selectInfoDetail(Map<String, Object> map) throws Exception {
		return infoDAO.selectInfoDetail(map);
	}
	
	@Override
	public List<Map<String, Object>> selectInfoSearchList(Map<String, Object> map) throws Exception {
		return infoDAO.selectInfoSearchList(map);
	}
	
	@Override
	public Map<String, Object> selectInfoSearchDetail(Map<String, Object> map) throws Exception {
		return infoDAO.selectInfoSearchDetail(map);
	}
	
	@Override
	public List<Map<String, Object>> selectStoreList(Map<String, Object> map) throws Exception {
		return infoDAO.selectStoreList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectGugunKeyList(Map<String, Object> map) throws Exception {
		return infoDAO.selectGugunKeyList(map);
	}
	
	@Override
	public Map<String, Object> selectStoreDetail(Map<String, Object> map) throws Exception {
		return infoDAO.selectStoreDetail(map);
	}
	
	@Override
	public void insertStoreAddr(Map<String, Object> map) throws Exception {
		infoDAO.insertStoreAddr(map);
	}
	
	@Override
	public void insertStore(Map<String, Object> map) throws Exception {
		infoDAO.insertStore(map);
	}

}
