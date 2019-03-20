package believe.review.brw.rank;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RankController {
	
	@Resource(name="rankService")
	private RankService rankService;
	
	@RequestMapping(value="/rank.br")
	public String rankPage(Model model) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("value", "total");
		List<Map<String, Object>> movie_total = rankService.selectMovieTotal(map);
		map.put("value", "read");
		List<Map<String, Object>> movie_read = rankService.selectMovieTotal(map);
		map.put("value", "grade");
		List<Map<String, Object>> movie_grade = rankService.selectMovieTotal(map);
		
		model.addAttribute("movie_total", movie_total);
		model.addAttribute("movie_read", movie_read);
		model.addAttribute("movie_grade", movie_grade);
		
		return "/rank/rankPage";
	}
}
