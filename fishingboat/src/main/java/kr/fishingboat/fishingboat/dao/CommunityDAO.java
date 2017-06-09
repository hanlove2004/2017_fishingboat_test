package kr.fishingboat.fishingboat.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.fishingboat.common.dao.AbstractDAO;

@Repository("communityDAO")
public class CommunityDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("community.selectNoticeList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("community.selectNoticeDetail", map);
	}
	
	public void updateNoticeHitCnt(Map<String, Object> map) throws Exception {
		update("community.updateNoticeHitCnt", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectDataList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("community.selectDataList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectDataDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("community.selectDataDetail", map);
	}
	
	public void updateDataHitCnt(Map<String, Object> map) throws Exception {
		update("community.updateDataHitCnt", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFreeList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("community.selectFreeList", map);
	}
	
	public void insertFree(Map<String, Object> map) throws Exception {
		insert("community.insertFree", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFreeDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("community.selectFreeDetail", map);
	}
	
	public void updateFreeHitCnt(Map<String, Object> map) throws Exception {
		update("community.updateFreeHitCnt", map);
	}
	
	public void updateFree(Map<String, Object> map) throws Exception {
		update("community.updateFree", map);
	}
	
}
