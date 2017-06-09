package kr.fishingboat.fishingboat.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.fishingboat.common.dao.AbstractDAO;

@Repository("mainDAO")
public class MainDAO extends AbstractDAO {

	public void insertEval(Map<String, Object> map) throws Exception {
		insert("main.insertEval", map);
	}
	
	public void insertPageStats(Map<String, Object> map) throws Exception {
		insert("main.insertPageStats", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectShipTotal(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("main.selectShipTotal", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("main.selectNoticeList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectDealList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("main.selectDealList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPopupList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("main.selectPopupList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSellList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("main.selectSellList", map);
	}
	
}
