package kr.fishingboat.fishingboat.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.fishingboat.common.dao.AbstractDAO;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLogin(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.selectLogin", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectIdCheck(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.selectIdCheck", map);
	}
	
	public void insertJoin(Map<String, Object> map) throws Exception {
		insert("member.insertJoin", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectUsrIdSearch(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.selectUsrIdSearch", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectUsrPwSearch(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("member.selectUsrPwSearch", map);
	}
	
	public void updateMemberPw(Map<String, Object> map) throws Exception {
		update("member.updateMemberPw", map);
	}
	
}
