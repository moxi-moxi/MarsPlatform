package org.marsplatform.extend.system.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.marsplatform.core.common.web.Response;
import org.marsplatform.core.common.web.Page;
import org.marsplatform.extend.system.model.SysRoleEntity;
import org.marsplatform.extend.system.service.SysRoleMenuService;
import org.marsplatform.extend.system.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 角色管理
 * 
 */
@RestController
@RequestMapping("/sys/role")
public class SysRoleController extends AbstractController {
	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private SysRoleMenuService sysRoleMenuService;
	
	/**
	 * 角色列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sys:role:list")
	public Response list(String roleName, Integer curPage, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("roleName", roleName);
		map.put("offset", (curPage - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<SysRoleEntity> list = sysRoleService.queryList(map);
		int total = sysRoleService.queryTotal(map);
		
		Page page = new Page(list, total, limit, curPage);
		
		return Response.ok().put("page", page);
	}
	
	/**
	 * 角色列表
	 */
	@RequestMapping("/select")
	@RequiresPermissions("sys:role:select")
	public Response select(){
		//查询列表数据
		List<SysRoleEntity> list = sysRoleService.queryList(new HashMap<String, Object>());
		
		return Response.ok().put("list", list);
	}
	
	/**
	 * 角色信息
	 */
	@RequestMapping("/info/{roleId}")
	@RequiresPermissions("sys:role:info")
	public Response info(@PathVariable("roleId") Long roleId){
		SysRoleEntity role = sysRoleService.queryObject(roleId);
		
		//查询角色对应的菜单
		List<Long> menuIdList = sysRoleMenuService.queryMenuIdList(roleId);
		role.setMenuIdList(menuIdList);
		
		return Response.ok().put("role", role);
	}
	
	/**
	 * 保存角色
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sys:role:save")
	public Response save(@RequestBody SysRoleEntity role){
		if(StringUtils.isBlank(role.getRoleName())){
			return Response.error("角色名称不能为空");
		}
		
		sysRoleService.save(role);
		
		return Response.ok();
	}
	
	/**
	 * 修改角色
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sys:role:update")
	public Response update(@RequestBody SysRoleEntity role){
		if(StringUtils.isBlank(role.getRoleName())){
			return Response.error("角色名称不能为空");
		}
		
		sysRoleService.update(role);
		
		return Response.ok();
	}
	
	/**
	 * 删除角色
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sys:role:delete")
	public Response delete(@RequestBody Long[] roleIds){
		sysRoleService.deleteBatch(roleIds);
		
		return Response.ok();
	}
}
