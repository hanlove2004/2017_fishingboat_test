package kr.fishingboat.fishingboatedu.dao;

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
	
}
