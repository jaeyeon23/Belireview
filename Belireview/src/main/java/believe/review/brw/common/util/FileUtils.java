package believe.review.brw.common.util;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	public Map<String, Object> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request, String filePath) throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = "";	
		String poster_image = "";
		String main_image = "";
		String content_image = "";	
		int count = 1;
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		File file = null;
		
		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				if(multipartFile.getName().equals("poster_image")) {
					storedFileName = map.get("media") + "_poster_image_" + map.get("no") + originalFileExtension;
					poster_image = storedFileName;
					file = new File(filePath + "poster\\" + storedFileName);
				}else if(multipartFile.getName().equals("main_image")) {
					storedFileName = map.get("media") + "_main_image_" + map.get("no") + originalFileExtension;
					main_image = storedFileName;
					file = new File(filePath + "main\\" + storedFileName);
				}else {
					storedFileName = map.get("media") + "_content_image_" + map.get("no") + "_" + count++ + originalFileExtension;
					
					if(content_image.trim().length() != 0) {
						content_image += ", ";
					}
					
					content_image += storedFileName;
					file = new File(filePath + "content\\" + storedFileName);
				}
				
				multipartFile.transferTo(file);
			}
		}
		
		listMap.put("poster_image", poster_image);
		listMap.put("main_image", main_image);
		listMap.put("content_image", content_image);

		return listMap;
	}
}
