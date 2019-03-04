package believe.review.brw.drama;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

@RequestMapping("/drama")
public class DramaController {

	@RequestMapping(value="dramaList.br")
	public ModelAndView dramaList() throws Exception{
		
		ModelAndView mv = new ModelAndView("/drama/dramaList");
		
		return mv;
		
	
	}
	
	@RequestMapping(value="dramaDetail.br")
	public ModelAndView dramaDetail() throws Exception{
		
		ModelAndView mv = new ModelAndView("/drama/dramaDetail");
		
		return mv;
		
	
	}
	
	@RequestMapping(value="dramaInfo.br")
	public ModelAndView dramaInfo() throws Exception{
		
		ModelAndView mv = new ModelAndView("/drama/dramaInfo");
		
		return mv;
		
	
	}
	
	@RequestMapping(value="dramaComment.br")
	public ModelAndView dramaComment() throws Exception{
		
		ModelAndView mv = new ModelAndView("/drama/dramaComment");
		
		return mv;
		
	
	}
}
