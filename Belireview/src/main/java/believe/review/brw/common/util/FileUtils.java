package believe.review.brw.common.util;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	public void fileDelete(Map<String, Object> map, String filePath, String media) throws Exception{
		String poster_image = null;
		String main_image = null;
		String[] content_image = null;
		File file = null;
		
		if(media.equals("drama")) {
			poster_image = (String) map.get("DRAMA_POSTER_IMAGE");
			main_image = (String)map.get("DRAMA_MAIN_IMAGE");
			content_image = ((String) map.get("DRAMA_CONTENT_IMAGE")).split(",");
		}else if(media.equals("movie")) {
			poster_image = (String) map.get("MOVIE_POSTER_IMAGE");
			main_image = (String)map.get("MOVIE_MAIN_IMAGE");
			content_image = ((String) map.get("MOVIE_GALLERY_IMAGE")).split(",");
		}else if(media.equals("ad")) {
			poster_image = (String)map.get("AD_POSTER_IMAGE");
			main_image = (String)map.get("AD_MAIN_IMAGE");
			content_image = ((String) map.get("AD_CONTENT_IMAGE")).split(",");
		}
		
		file = new File(filePath + "poster\\" + poster_image);
		file.delete();
		file = new File(filePath + "main\\" + main_image);
		file.delete();
		
		for(int i = 0 ; i < content_image.length ; i++) {
			file = new File(filePath + "content\\" + content_image[i]);
			file.delete();
		}
	}

	//user용
	private static final String filePath_P = "C:\\인영\\sts\\Belireview\\Belireview\\src\\main\\webapp\\resources\\images\\user_profile\\";
	
	public Map<String, Object> parseInsertFileInfo(Map<String, Object> map, HttpServletRequest request)
			throws Exception {
		
		HttpSession session = request.getSession();
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

		Map<String, Object> listMap = new HashMap<String, Object>();

		String MEMBER_ID = map.get("id").toString(); // 멤버 아이디
		
		File file = new File(filePath_P);
		if (file.exists() == false) { //디렉토리가 존재하지 않는다면 디렉토리 만듬
			file.mkdirs();
		}
		
	    //기존파일제거
		file = new File(filePath_P + session.getAttribute("PROFILE_IMAGE"));
		file.delete();
		

		MultipartFile multipartFile = multipartHttpServletRequest.getFile("profile_image");
				
		String originalFileName = multipartFile.getOriginalFilename();
		
		listMap.put("ID", MEMBER_ID);
		
		if(originalFileName != "") {
			String newFileName = MEMBER_ID+ "-" + originalFileName;
		
			file = new File(filePath_P + newFileName);
			multipartFile.transferTo(file);
			listMap.put("PROFILE_IMAGE",newFileName);
			
		}else {
			listMap.put("PROFILE_IMAGE", null);
		}
		
		
		return listMap;
	}
	
}
