package kr.fishingboat.fishingboat.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import kr.fishingboat.common.util.FileUtils;
import kr.fishingboat.fishingboat.dao.MemberDAO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "memberDAO")
	private MemberDAO memberDAO;
	
	@Override
	public Map<String, Object> selectLogin(Map<String, Object> map) throws Exception {
		return memberDAO.selectLogin(map);
	}
	
	@Override
	public Map<String, Object> selectIdCheck(Map<String, Object> map) throws Exception {
		return memberDAO.selectIdCheck(map);
	}
	
	@Override
	public void insertJoin(Map<String, Object> map) throws Exception {
		memberDAO.insertJoin(map);
	}
	
	@Override
	public Map<String, Object> selectUsrIdSearch(Map<String, Object> map) throws Exception {
		return memberDAO.selectUsrIdSearch(map);
	}
	
	@Override
	public Map<String, Object> selectUsrPwSearch(Map<String, Object> map) throws Exception {
		return memberDAO.selectUsrPwSearch(map);
	}
	
	@Override
	public void updateMemberPw(Map<String, Object> map) throws Exception {
		memberDAO.updateMemberPw(map);
	}

}
