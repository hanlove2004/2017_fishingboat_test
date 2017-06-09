package kr.fishingboat.fishingboat.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.fishingboat.common.dao.AbstractDAO;

@Repository("civilDAO")
public class CivilDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("civil.selectQnaList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("civil.selectQnaDetail", map);
	}
	
	public void insertQna(Map<String, Object> map) throws Exception {
		insert("civil.insertQna", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRuleList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("civil.selectRuleList", map);
	}
	
}
