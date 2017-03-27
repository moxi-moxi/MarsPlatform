package org.marsplatform.app.proj.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;

import org.marsplatform.app.proj.model.XmjbxxEntity;
import org.marsplatform.app.proj.service.XmjbxxService;
import org.marsplatform.core.common.web.Page;
import org.marsplatform.core.common.web.Result;


/**
 * 项目基本信息
 * 
 * @author mox
 * @email moxi-moxi@hotmail.com
 * @date 2017-03-27 18:32:22
 */
@Controller
@RequestMapping("/proj/xmjbxx")
public class XmjbxxController {
	@Autowired
	private XmjbxxService xmjbxxService;
	
	@RequestMapping("/xmjbxx.html")
	public String list(){
		return "app/proj/xmjbxx.html";
	}
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("proj:xmjbxx:list")
	public Result list(Integer curPage, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (curPage - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<XmjbxxEntity> xmjbxxList = xmjbxxService.queryList(map);
		int total = xmjbxxService.queryTotal(map);
		
		Page page = new Page(xmjbxxList, total, limit, curPage);
		
		return Result.ok().put("page", page);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{id}")
	@RequiresPermissions("proj:xmjbxx:info")
	public Result info(@PathVariable("id") Long id){
		XmjbxxEntity xmjbxx = xmjbxxService.queryObject(id);
		
		return Result.ok().put("xmjbxx", xmjbxx);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("proj:xmjbxx:save")
	public Result save(@RequestBody XmjbxxEntity xmjbxx){
		xmjbxxService.save(xmjbxx);
		
		return Result.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("proj:xmjbxx:update")
	public Result update(@RequestBody XmjbxxEntity xmjbxx){
		xmjbxxService.update(xmjbxx);
		
		return Result.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("proj:xmjbxx:delete")
	public Result delete(@RequestBody Long[] ids){
		xmjbxxService.deleteBatch(ids);
		
		return Result.ok();
	}
	
}
