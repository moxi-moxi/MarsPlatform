package ac.cetc15.jdjc.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 项目基本信息
 * 
 * @author mox
 * @email moxi-moxi@hotmail.com
 * @date 2017-03-27 18:32:22
 */
@Controller
@RequestMapping("/jdjc")
public class JdjcController {
	
	@RequestMapping("/chart.html")
	public String chart(){
		return "app/jdjc/chart.html";
	}
	
	@RequestMapping("/map.html")
	public String map(){
		return "app/jdjc/map.html";
	}

	
}
