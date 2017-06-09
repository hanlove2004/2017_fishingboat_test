package kr.fishingboat.fishingboatedu.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import kr.fishingboat.fishingboatedu.dao.ApplicationDAO;

@Service("applicationService")
public class ApplicationServiceImpl implements ApplicationService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "applicationDAO")
	private ApplicationDAO applicationDAO;
	
	@Override
	public List<Map<String, Object>> selectEducationList(Map<String, Object> map) throws Exception {
		return applicationDAO.selectEducationList(map);
	}
	
	@Override
	public Map<String, Object> selectEduNum(Map<String, Object> map) throws Exception {
		return applicationDAO.selectEduNum(map);
	}
	
	@Override
	public void insertApplication(Map<String, Object> map) throws Exception {
		applicationDAO.insertApplication(map);
	}
	
	@Override
	public void insertApplicationImage(Map<String, Object> map) throws Exception {
		applicationDAO.insertApplicationImage(map);
	}
	
	@Override
	public void updateApplicationState(Map<String, Object> map) throws Exception {
		applicationDAO.updateApplicationState(map);
	}
	
	@Override
	public Map<String, Object> selectApplication(Map<String, Object> map) throws Exception {
		return applicationDAO.selectApplication(map);
	}
	
	@Override
	public List<Map<String, Object>> selectBrokerSidoList(Map<String, Object> map) throws Exception {
		return applicationDAO.selectBrokerSidoList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectBrokerGugunList(Map<String, Object> map) throws Exception {
		return applicationDAO.selectBrokerGugunList(map);
	}
	
}
