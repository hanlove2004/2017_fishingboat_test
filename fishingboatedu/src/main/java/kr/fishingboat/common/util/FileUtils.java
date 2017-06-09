package kr.fishingboat.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	// 추후 수정이 필요함
	private static final String filePath = "C:\\2017_FISINGBOAT\\source\\fishingboat_files\\";

	public List<Map<String, Object>> parseInsertFileInfo(Map<String, Object> map, HttpServletRequest request)
			throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		
		//String root_path = request.getSession().getServletContext().getRealPath("/");  
		//String attach_path = "file/data/";
		
		String filetype_path = (String) map.get("path") + "\\";
		File file = new File(filePath + filetype_path);
		/*File file = new File(root_path + attach_path);*/
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				//storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				storedFileName = new Long(System.currentTimeMillis()).toString() + originalFileExtension;

				file = new File(filePath + filetype_path +  storedFileName);
				/*file = new File(root_path + attach_path + storedFileName);*/
				multipartFile.transferTo(file);

				listMap = new HashMap<String, Object>();
				listMap.put("ORIGINAL_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}
	
	// 사용여부 확인 후 추후 삭제
	public List<Map<String, Object>> parseUpdateFileInfo(Map<String, Object> map, HttpServletRequest request)
			throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		//String boardIdx = (String) map.get("IDX");
		String requestName = null;
		String idx = null;

		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;

				multipartFile.transferTo(new File(filePath + storedFileName));

				listMap = new HashMap<String, Object>();
				listMap.put("IS_NEW", "Y");
				//listMap.put("BOARD_IDX", boardIdx);
				listMap.put("ORIGINAL_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			} else {
				requestName = multipartFile.getName();
				idx = "IDX_" + requestName.substring(requestName.indexOf("_") + 1);
				if (map.containsKey(idx) == true && map.get(idx) != null) {
					listMap = new HashMap<String, Object>();
					listMap.put("IS_NEW", "N");
					listMap.put("FILE_IDX", map.get(idx));
					list.add(listMap);
				}
			}
		}
		return list;
	}
}
