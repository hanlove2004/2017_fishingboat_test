package kr.fishingboat.fishingboat.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.fishingboat.common.dao.AbstractDAO;

@Repository("infoDAO")
public class InfoDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectInfoList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("info.selectInfoList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectInfoDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("info.selectInfoDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectInfoSearchList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("info.selectInfoSearchList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectInfoSearchDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("info.selectInfoSearchDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectStoreList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("info.selectStoreList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGugunKeyList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("info.selectGugunKeyList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectStoreDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("info.selectStoreDetail", map);
	}
	
	public void insertStoreAddr(Map<String, Object> map) throws Exception {
		insert("info.insertStoreAddr", map);
	}
	
	public void insertStore(Map<String, Object> map) throws Exception {
		insert("info.insertStore", map);
	}
	
}
