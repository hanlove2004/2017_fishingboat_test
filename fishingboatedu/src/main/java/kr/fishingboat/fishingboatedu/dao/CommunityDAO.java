package kr.fishingboat.fishingboatedu.dao;

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
	
}
