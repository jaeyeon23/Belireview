package believe.review.brw.main;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import believe.review.brw.common.common.CommandMap;
import believe.review.brw.drama.DramaService;



@Controller
public class MainController {
	 private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	   /**
	    * Simply selects the home view to render by returning its name.
	    */

	   @RequestMapping(value = "/main.br", method = RequestMethod.GET)
	   public String home(Locale locale, Model model) {

	      logger.info("Welcome home! The client locale is {}.", locale);

	      Date date = new Date();
	      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

	      String formattedDate = dateFormat.format(date);

	      model.addAttribute("serverTime", formattedDate);

	      return "main";
	   }
	   

		@Resource(name="mainService")
		private MainService mainService;
		
	   @RequestMapping(value="/admin/main.br")
	   public String admin_home(Model model) throws Exception{
		   
		   return "adminMain";
	   }
	   
	   @RequestMapping(value = "mainSearch.br")
		
		public ModelAndView mainSearch(CommandMap commandMap, HttpServletRequest request) throws Exception {

			ModelAndView mv = new ModelAndView("mainSearch");
			List<Map<String,Object>> searchMain = mainService.mainSerach(commandMap.getMap());
			List<Map<String,Object>> searchMovie = mainService.movieSerach(commandMap.getMap());
			List<Map<String,Object>> searchDrama = mainService.dramaSerach(commandMap.getMap());
			List<Map<String,Object>> searchAd = mainService.adSerach(commandMap.getMap());
			
			mv.addObject("request",request.getParameter("searchText"));
			/*mv.addObject("searchMain",searchMain);*/
			mv.addObject("searchMovie",searchMovie);
			mv.addObject("searchDrama",searchDrama);
			mv.addObject("searchAd",searchAd);

			
			return mv;
		}	
}
