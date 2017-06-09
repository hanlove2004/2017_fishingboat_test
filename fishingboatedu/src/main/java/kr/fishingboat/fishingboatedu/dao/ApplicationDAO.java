package kr.fishingboat.fishingboatedu.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.fishingboat.common.dao.AbstractDAO;

@Repository("applicationDAO")
public class ApplicationDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectEducationList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("application.selectEducationList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectEduNum(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("application.selectEduNum", map);
	}
	
	public void insertApplication(Map<String, Object> map) throws Exception {
		insert("application.insertApplication", map);
	}
	
	public void insertApplicationImage(Map<String, Object> map) throws Exception {
		insert("application.insertApplicationImage", map);
	}
	
	public void updateApplicationState(Map<String, Object> map) throws Exception {
		update("application.updateApplicationState", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectApplication(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("application.selectApplication", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBrokerSidoList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("application.selectBrokerSidoList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBrokerGugunList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("application.selectBrokerGugunList", map);
	}
	
}
