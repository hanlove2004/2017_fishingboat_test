package kr.fishingboat.fishingboat.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import kr.fishingboat.fishingboat.dao.SearchDAO;

@Service("searchService")
public class SearchServiceImpl implements SearchService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "searchDAO")
	private SearchDAO searchDAO;
	
	@Override
	public List<Map<String, Object>> selectSearchList(Map<String, Object> map) throws Exception {
		return searchDAO.selectSearchList(map);
	}

}
