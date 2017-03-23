package org.marsplatform.extend.system.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.marsplatform.core.common.web.Response;
import org.marsplatform.core.common.web.Page;
import org.marsplatform.core.exception.GlobalException;
import org.marsplatform.extend.system.model.SysConfigEntity;
import org.marsplatform.extend.system.service.SysConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 系统配置信息
 * 
 */
@RestController
@RequestMapping("/sys/config")
public class SysConfigController extends AbstractController {
	@Autowired
	private SysConfigService sysConfigService;
	
	/**
	 * 所有配置列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sys:config:list")
	public Response list(String key, Integer curPage, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("key", key);
		map.put("offset", (curPage - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<SysConfigEntity> configList = sysConfigService.queryList(map);
		int total = sysConfigService.queryTotal(map);
		
		Page page = new Page(configList, total, limit, curPage);
		
		return Response.ok().put("page", page);
	}
	
	
	/**
	 * 配置信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("sys:config:info")
	public Response info(@PathVariable("id") Long id){
		SysConfigEntity config = sysConfigService.queryObject(id);
		
		return Response.ok().put("config", config);
	}
	
	/**
	 * 保存配置
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sys:config:save")
	public Response save(@RequestBody SysConfigEntity config){
		//参数校验
		verifyForm(config);

		sysConfigService.save(config);
		
		return Response.ok();
	}
	
	/**
	 * 修改配置
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sys:config:update")
	public Response update(@RequestBody SysConfigEntity config){
		//参数校验
		verifyForm(config);
		
		sysConfigService.update(config);
		
		return Response.ok();
	}
	
	/**
	 * 删除配置
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sys:config:delete")
	public Response delete(@RequestBody Long[] ids){
		sysConfigService.deleteBatch(ids);
		
		return Response.ok();
	}
	
	/**
	 * 验证参数是否正确
	 */
	private void verifyForm(SysConfigEntity config){
		if(StringUtils.isBlank(config.getKey())){
			throw new GlobalException("参数名不能为空");
		}
		
		if(StringUtils.isBlank(config.getValue())){
			throw new GlobalException("参数值不能为空");
		}
	}
}
