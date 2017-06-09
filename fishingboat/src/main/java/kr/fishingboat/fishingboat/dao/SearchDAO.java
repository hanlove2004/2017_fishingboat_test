package kr.fishingboat.fishingboat.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.fishingboat.common.dao.AbstractDAO;

@Repository("searchDAO")
public class SearchDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectSearchList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("search.selectSearchList", map);
	}
	
}
