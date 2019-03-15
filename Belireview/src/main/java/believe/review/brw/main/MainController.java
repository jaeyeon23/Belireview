package believe.review.brw.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import believe.review.brw.common.common.CommandMap;
import believe.review.brw.common.util.Paging;

@Controller
public class MainController {
	private int currentPage = 1;	 
	private int totalCount;
	private int blockCount = 10;	 
	private int blockPage = 5; 	 
	private String pagingHtml; 
	private Paging page;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Resource(name="mainService")
	private MainService mainService;
	
	@RequestMapping(value = "/main.br", method = RequestMethod.GET)
	public String home(Model model) throws Exception{

		List<Map<String, Object>> drama_list = mainService.dramaListTop8();
		List<Map<String, Object>> movie_list = mainService.movieListTop8();
		List<Map<String, Object>> ad_list = mainService.adListTop8();
		
		model.addAttribute("drama_list", drama_list);
		model.addAttribute("movie_list", movie_list);
		model.addAttribute("ad_list", ad_list);
		
		return "main";
	}
	
	@RequestMapping(value = "mainSearch.br")
	public ModelAndView mainSearch(CommandMap commandMap,HttpServletRequest request) throws Exception {
		
		String p = request.getParameter("currentPage");
		System.out.println(p);
		
		if(p == null || p.trim().isEmpty() || p.equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		ModelAndView mv = new ModelAndView("mainSearch");
		
		List<Map<String,Object>> searchMain = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> searchMovie = mainService.movieSerach(commandMap.getMap());
		List<Map<String,Object>> searchDrama = mainService.dramaSerach(commandMap.getMap());
		List<Map<String,Object>> searchAd = mainService.adSerach(commandMap.getMap());
		
		for(int i=0 ;i<searchMovie.size();i++) {
			Map<String,Object> tmp = new HashMap<String,Object>();
			tmp.put("NO", searchMovie.get(i).get("MOVIE_NO"));
			tmp.put("NAME", searchMovie.get(i).get("MOVIE_NAME"));
			tmp.put("DATE", searchMovie.get(i).get("MOVIE_DATE"));
			tmp.put("GENRE", searchMovie.get(i).get("MOVIE_GENRE"));
			tmp.put("TYPE", "영화");
			searchMain.add(i,tmp);
		}
		for(int i=searchMain.size(), j=0;j<searchDrama.size();j++,i++) {
			Map<String,Object> tmp = new HashMap<String,Object>();
			tmp.put("NO", searchDrama.get(j).get("DRAMA_NO"));
			tmp.put("NAME", searchDrama.get(j).get("DRAMA_NAME"));
			tmp.put("DATE", searchDrama.get(j).get("DRAMA_DATE"));
			tmp.put("GENRE", searchDrama.get(j).get("DRAMA_GENRE"));
			tmp.put("TYPE", "TV");
			searchMain.add(i,tmp);
		}
		for(int i=searchMain.size(),j=0;j<searchAd.size();j++,i++) {
			Map<String,Object> tmp = new HashMap<String,Object>();
			tmp.put("NO", searchAd.get(j).get("AD_NO"));
			tmp.put("NAME", searchAd.get(j).get("AD_NAME"));
			tmp.put("DATE", searchAd.get(j).get("AD_READCOUNT"));
			tmp.put("GENRE", searchAd.get(j).get("AD_COMPANY"));
			tmp.put("TYPE", "광고");
			searchMain.add(i,tmp);
		}
		
		totalCount = searchMain.size();
		
		page = new Paging(currentPage, totalCount, blockCount, blockPage, "/brw/main/mainSearch");
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		searchMain = searchMain.subList(page.getStartCount(), lastCount);
				
			mv.addObject("request",request.getParameter("searchText"));
			mv.addObject("searchMain",searchMain);
			mv.addObject("searchMovie",searchMovie);
			mv.addObject("searchDrama",searchDrama);
			mv.addObject("searchAd",searchAd);

			return mv;
		}	
		@RequestMapping(value = "mainSearch2.br")
		@ResponseBody
		public Map<String,Object> mainSearch2(CommandMap commandMap,HttpServletRequest request) throws Exception {
			
			String p = request.getParameter("currentPage");
			
			if(p == null || p.trim().isEmpty() || p.equals("0")) {
	            currentPage = 1;
	        } else {
	            currentPage = Integer.parseInt(request.getParameter("currentPage"));
	        }
			Map<String,Object> mv = new HashMap<String,Object>();
			
			List<Map<String,Object>> searchMain = new ArrayList<Map<String,Object>>();
			List<Map<String,Object>> searchMovie = mainService.movieSerach(commandMap.getMap());
			List<Map<String,Object>> searchDrama = mainService.dramaSerach(commandMap.getMap());
			List<Map<String,Object>> searchAd = mainService.adSerach(commandMap.getMap());
			
			for(int i=0 ;i<searchMovie.size();i++) {
				Map<String,Object> tmp = new HashMap<String,Object>();
				tmp.put("NO", searchMovie.get(i).get("MOVIE_NO"));
				tmp.put("NAME", searchMovie.get(i).get("MOVIE_NAME"));
				tmp.put("DATE", searchMovie.get(i).get("MOVIE_DATE"));
				tmp.put("GENRE", searchMovie.get(i).get("MOVIE_GENRE"));
				tmp.put("TYPE", "영화");
				searchMain.add(i,tmp);
			}
			for(int i=searchMain.size(), j=0;j<searchDrama.size();j++,i++) {
				Map<String,Object> tmp = new HashMap<String,Object>();
				tmp.put("NO", searchDrama.get(j).get("DRAMA_NO"));
				tmp.put("NAME", searchDrama.get(j).get("DRAMA_NAME"));
				tmp.put("DATE", searchDrama.get(j).get("DRAMA_DATE"));
				tmp.put("GENRE", searchDrama.get(j).get("DRAMA_GENRE"));
				tmp.put("TYPE", "TV");
				searchMain.add(i,tmp);
			}
			for(int i=searchMain.size(),j=0;j<searchAd.size();j++,i++) {
				Map<String,Object> tmp = new HashMap<String,Object>();
				tmp.put("NO", searchAd.get(j).get("AD_NO"));
				tmp.put("NAME", searchAd.get(j).get("AD_NAME"));
				tmp.put("DATE", searchAd.get(j).get("AD_READCOUNT"));
				tmp.put("GENRE", searchAd.get(j).get("AD_COMPANY"));
				tmp.put("TYPE", "광고");
				searchMain.add(i,tmp);
			}
			totalCount = searchMain.size();
			
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "/brw/main/mainSearch");
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(p == null || p.trim().isEmpty() || p.equals("0")) {
	            currentPage = 1;
	        } else {
	            currentPage = Integer.parseInt(request.getParameter("currentPage"));
	        }
			
			searchMain = searchMain.subList(page.getStartCount(), lastCount);
			
			StringBuffer sb = new StringBuffer();
			
			for(Map m : searchMain) {
				sb.append("<li class=\"ContentListItemWithPoster__Self-swai1z-0 hKRvvO\">");
				
				if(m.get("TYPE").toString().equals("영화")) {
					sb.append("<a href=\"/brw/movie/movieDetail.br?MOVIE_NO=").append(m.get("NO")).append("\">");
				}else if(m.get("TYPE").toString().equals("TV")) {
					sb.append("<a href=\"/brw/drama/dramaDetail.br?DRAMA_NO=").append(m.get("NO")).append("\">");
				}else {
					sb.append("<a href=\"/brw/ad/adDetail.br?AD_NO=").append(m.get("NO")).append("\">");
				}
				sb.append("<div class=\"ContentListItemWithPoster__ContentPosterBlock-swai1z-1 kxDIaJ\">")
				.append("<div class=\"LazyLoadingImg__Self-s1jb87ps-0 csJkbb\">")
				.append("<img class=\"LazyLoadingImg__Self-s1jb87ps-0 csJkbb\" data-image-id=\"20\" src=\"/brw/resources/images/3-girls.jpg\"></div></div>")
				.append("<div class=\"ContentListItemWithPoster__ContentInfo-swai1z-2 kVeCGy\">")
				.append("<div class=\"SearchResultsSection__TopResultItemTitle-s1qazrkm-1 kBOijn\">").append(m.get("NAME")).append("</div>")
				.append("<div class=\"SearchResultsSection__TopResultItemExtraInfo-s1qazrkm-2 dGUMNT\">").append(m.get("DATE")).append(" ・ ").append(m.get("GENRE")).append("</div>")
				.append("<div class=\"SearchResultsSection__TopResultContentType-s1qazrkm-3 eeOgLY\">").append(m.get("TYPE")).append("</div>")
				.append("</div></a></li>");
			}		
					
			mv.put("request",request.getParameter("searchText"));
			mv.put("searchMain",sb.toString());
	
			return mv;
		}	
		
		/*메인 검색영화*/
		
		@RequestMapping(value = "mdaSearch.br")
		@ResponseBody
		public Map<String,Object>mdaSearch(CommandMap commandMap,HttpServletRequest request) throws Exception {
			
			String p = request.getParameter("currentPage");
			
			if(p == null || p.trim().isEmpty() || p.equals("0")) {
				
	            currentPage = 1;
	        } else {
	            currentPage = Integer.parseInt(request.getParameter("currentPage"));
	        }

			Map<String,Object> mv = new HashMap<String,Object>();
			
			List<Map<String,Object>> mdaSearch = new ArrayList();
			String TYPE = commandMap.getMap().get("type").toString();
			
			if(TYPE.equals("1")){
				 mdaSearch = mainService.movieSerach(commandMap.getMap());
			}else if(TYPE.equals("2")) {
				mdaSearch = mainService.dramaSerach(commandMap.getMap());
			}else {
				mdaSearch = mainService.adSerach(commandMap.getMap());
			}
			
			totalCount = mdaSearch.size();
			
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "/brw/main/mainSearch");
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			mdaSearch = mdaSearch.subList(page.getStartCount(), lastCount);
			
			
			StringBuffer sb = new StringBuffer();
			
			for(Map mda : mdaSearch) {
				sb.append("<li class=\"StackableListItem-s18nuw36-0 cIJjio\">");
				if(TYPE.equals("1")){
					sb.append("<a lng=\"ko-KR\" class=\"InnerPartOfListWithImage__LinkSelf-s11a1hqv-1 gmbtJD\" title=\"${request}\" href=\"/brw/movie/movieDetail.br?MOVIE_NO=").append(mda.get("MOVIE_NO")).append("\">");
				}else if(TYPE.equals("2")) {
					sb.append("<a lng=\"ko-KR\" class=\"InnerPartOfListWithImage__LinkSelf-s11a1hqv-1 gmbtJD\" title=\"${request}\" href=\"/brw/drama/dramaDetail.br?MOVIE_NO=").append(mda.get("DRAMA_NO")).append("\">");
				}else {
					sb.append("<a lng=\"ko-KR\" class=\"InnerPartOfListWithImage__LinkSelf-s11a1hqv-1 gmbtJD\" title=\"${request}\" href=\"/brw/ad/adDetail.br?MOVIE_NO=").append(mda.get("AD_NO")).append("\">");
				}
				sb.append("<div class=\"InnerPartOfListWithImage__ImageBlock-s11a1hqv-3 kXgAWr\">");
				sb.append("<div class=\"LazyLoadingBackground-cgbyi4-0 cioRyq LazyLoadingBackgroundw__Self-s1stfhov-0 jXCeuY\" alt=\"${request}\">");
				sb.append("<span class=\"LazyLoadingBackgroundw__BackgroundImage-s1stfhov-1 mPWPS\" data-background-image-id=\"38\">");
				sb.append("<img class=\"LazyLoadingBackground__StylingMerged-cgbyi4-2 kDLFDU LazyLoadingBackground__Self-cgbyi4-0 dxPvni\" src=\"/brw/resources/images/3-girls.jpg\"></span>");
				sb.append("</div></div>");
				sb.append("<div class=\"InnerPartOfListWithImage__Info-s11a1hqv-5 hufKbr\">");
				sb.append("<div class=\"InnerPartOfListWithImage__Titles-s11a1hqv-4 jtpmaI\">");
				
				if(TYPE.equals("1")){
					sb.append("<div class=\"SearchResultItemForContent__ResultTitle-s1phcxqf-1 gGTmOM\">").append(mda.get("MOVIE_NAME")).append("</div>");
					sb.append("<div class=\"SearchResultItemForContent__ResultExtraInfo-s1phcxqf-0 crwUoZ\">").append(mda.get("MOVIE_DATE")).append(" ・ ").append(mda.get("MOVIE_GENRE")).append("</div>");
				}else if(TYPE.equals("2")) {
					sb.append("<div class=\"SearchResultItemForContent__ResultTitle-s1phcxqf-1 gGTmOM\">").append(mda.get("DRAMA_NAME")).append("</div>");
					sb.append("<div class=\"SearchResultItemForContent__ResultExtraInfo-s1phcxqf-0 crwUoZ\">").append(mda.get("DRAMA_DATE")).append(" ・ ").append(mda.get("DRAMA_GENRE")).append("</div>");
				}else {
					sb.append("<div class=\"SearchResultItemForContent__ResultTitle-s1phcxqf-1 gGTmOM\">").append(mda.get("AD_NAME")).append("</div>");
					sb.append("<div class=\"SearchResultItemForContent__ResultExtraInfo-s1phcxqf-0 crwUoZ\">").append(mda.get("AD_READCOUNT")).append(" ・ ").append(mda.get("AD_COMPANY")).append("</div>");
				}
				sb.append("</div></div></div>");
				sb.append("</div></a></li>");
			}		
					
			mv.put("request",request.getParameter("searchText"));
			mv.put("mdaSearch",sb.toString());
	
			return mv;
		}	
		
}
