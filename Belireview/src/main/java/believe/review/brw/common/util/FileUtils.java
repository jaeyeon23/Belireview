package believe.review.brw.common.util;

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
	private static final String filePath = "C:\\Users\\박재연\\Desktop\\Belireview\\Belireview\\src\\main\\webapp\\resources\\images\\";

	public Map<String, Object> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;	//파일 하나씩
		String poster_image = null;
		String main_image = null;
		String content_image = null;	//DB에 저장될 파일들의 이름 +=
		int count = 1;
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		
		File file = new File(filePath);
		
		if(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				poster_image = map.get("media") + "_poster_image_" + map.get("no") + originalFileExtension;
			}
			
			listMap.put("poster_image", poster_image);
		}
		
		if(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				main_image = map.get("media") + "_main_image_" + map.get("no") + originalFileExtension;
			}
			
			listMap.put("poster_image", poster_image);
		}
		
		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				
				storedFileName = map.get("media") + "_content_image_" + map.get("no") + count++ + originalFileExtension;
				if(content_image != null) {
					content_image += ", ";
				}
				
				content_image += storedFileName;
						
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
			}
		}
		
		listMap.put("content_image", content_image);

		return listMap;
	}
}
