package kr.fishingboat.fishingboat.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import kr.fishingboat.common.util.FileUtils;
import kr.fishingboat.fishingboat.dao.LoginmemberDAO;

@Service("loginmemberService")
public class LoginmemberServiceImpl implements LoginmemberService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "loginmemberDAO")
	private LoginmemberDAO loginmemberDAO;

	@Override
	public Map<String, Object> selectMemberInfo(Map<String, Object> map) throws Exception {
		return loginmemberDAO.selectMemberInfo(map);
	}
	
	@Override
	public void updateMemberInfo(Map<String, Object> map) throws Exception {
		loginmemberDAO.updateMemberInfo(map);
	}
	
	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		loginmemberDAO.deleteMember(map);
	}
	
}
