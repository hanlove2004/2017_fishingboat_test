package kr.fishingboat.fishingboat.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.fishingboat.common.dao.AbstractDAO;

@Repository("loginmemberDAO")
public class LoginmemberDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberInfo(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("loginmember.selectMemberInfo", map);
	}
	
	public void updateMemberInfo(Map<String, Object> map) throws Exception {
		update("loginmember.updateMemberInfo", map);
	}
	
	public void deleteMember(Map<String, Object> map) throws Exception {
		delete("loginmember.deleteMember", map);
	}
	
}
