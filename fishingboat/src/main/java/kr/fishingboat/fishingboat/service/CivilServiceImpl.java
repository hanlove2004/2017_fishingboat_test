package kr.fishingboat.fishingboat.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import kr.fishingboat.common.util.FileUtils;
import kr.fishingboat.fishingboat.dao.CivilDAO;

@Service("civilService")
public class CivilServiceImpl implements CivilService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "civilDAO")
	private CivilDAO civilDAO;

	@Override
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {
		return civilDAO.selectQnaList(map);
	}
	
	@Override
	public Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception {
		return civilDAO.selectQnaDetail(map);
	}
	
	@Override
	public void insertQna(Map<String, Object> map) throws Exception {
		civilDAO.insertQna(map);
	}
	
	@Override
	public List<Map<String, Object>> selectRuleList(Map<String, Object> map) throws Exception {
		return civilDAO.selectRuleList(map);
	}

}
