package org.marsplatform.extend.demo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 项目基本信息
 * 
 * @author mox
 * @email moxi-moxi@hotmail.com
 * @date 2017-03-27 18:32:22
 */
@Controller
@RequestMapping("/demo")
public class DemoController {   

	@RequestMapping("/{page}.html")
	public String goTo(@PathVariable("page") String page){
		return "demo/" + page + ".html";
	}
	
}
