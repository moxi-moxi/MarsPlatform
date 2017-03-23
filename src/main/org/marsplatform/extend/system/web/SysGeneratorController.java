package org.marsplatform.extend.system.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.marsplatform.core.common.web.Response;
import org.marsplatform.core.common.web.Page;
import org.marsplatform.extend.system.service.SysGeneratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

/**
 * 代码生成器
 * 
 */
@Controller
@RequestMapping("/sys/generator")
public class SysGeneratorController {
	@Autowired
	private SysGeneratorService sysGeneratorService;
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("sys:generator:list")
	public Response list(String tableName, Integer curPage, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("tableName", tableName);
		map.put("offset", (curPage - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<Map<String, Object>> list = sysGeneratorService.queryList(map);
		int total = sysGeneratorService.queryTotal(map);
		
		Page page = new Page(list, total, limit, curPage);
		
		return Response.ok().put("page", page);
	}
	
	/**
	 * 生成代码
	 */
	@RequestMapping("/code")
	@RequiresPermissions("sys:generator:code")
	public void code(String tables, HttpServletResponse response) throws IOException{
		String[] tableNames = new String[]{};
		tableNames = JSON.parseArray(tables).toArray(tableNames);
		
		byte[] data = sysGeneratorService.generateCode(tableNames);
		
		response.reset();  
        response.setHeader("Content-Disposition", "attachment; filename=\"mars-platform.zip\"");  
        response.addHeader("Content-Length", "" + data.length);  
        response.setContentType("application/octet-stream; charset=UTF-8");  
  
        IOUtils.write(data, response.getOutputStream());  
	}
}
