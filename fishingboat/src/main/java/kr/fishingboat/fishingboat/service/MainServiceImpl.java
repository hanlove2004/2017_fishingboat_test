package kr.fishingboat.fishingboat.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import kr.fishingboat.fishingboat.dao.MainDAO;

@Service("mainService")
public class MainServiceImpl implements MainService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "mainDAO")
	private MainDAO mainDAO;

	@Override
	public void insertEval(Map<String, Object> map) throws Exception {
		mainDAO.insertEval(map);
	}
	
	@Override
	public void insertPageStats(Map<String, Object> map) throws Exception {
		mainDAO.insertPageStats(map);
	}

	@Override
	public Map<String, Object> selectShipTotal(Map<String, Object> map) throws Exception {
		return mainDAO.selectShipTotal(map);
	}
	
	@Override
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		return mainDAO.selectNoticeList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectDealList(Map<String, Object> map) throws Exception {
		return mainDAO.selectDealList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectPopupList(Map<String, Object> map) throws Exception {
		return mainDAO.selectPopupList(map);
	}
	@Override
	public List<Map<String, Object>> selectSellList(Map<String, Object> map) throws Exception {
		return mainDAO.selectSellList(map);
	}
	
}
