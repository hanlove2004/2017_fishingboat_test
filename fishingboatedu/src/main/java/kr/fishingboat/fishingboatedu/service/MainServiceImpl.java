package kr.fishingboat.fishingboatedu.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import kr.fishingboat.fishingboatedu.dao.MainDAO;

@Service("mainService")
public class MainServiceImpl implements MainService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "mainDAO")
	private MainDAO mainDAO;

	@Override
	public void insertEval(Map<String, Object> map) throws Exception {
		mainDAO.insertEval(map);
	}
	
	@Override
	public void insertPageStats(Map<String, Object> map) throws Exception {
		mainDAO.insertPageStats(map);
	}

}
