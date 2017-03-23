package org.marsplatform.extend.system.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.marsplatform.core.common.web.Response;
import org.marsplatform.core.common.web.Page;
import org.marsplatform.core.exception.GlobalException;
import org.marsplatform.extend.system.constant.SystemConstant;
import org.marsplatform.extend.system.constant.SystemConstant.MenuType;
import org.marsplatform.extend.system.model.SysMenuEntity;
import org.marsplatform.extend.system.service.SysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 系统菜单
 * 
 */
@RestController
@RequestMapping("/sys/menu")
public class SysMenuController extends AbstractController {
	@Autowired
	private SysMenuService sysMenuService;
	
	/**
	 * 所有菜单列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sys:menu:list")
	public Response list(Integer curPage, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (curPage - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<SysMenuEntity> menuList = sysMenuService.queryList(map);
		int total = sysMenuService.queryTotal(map);
		
		Page page = new Page(menuList, total, limit, curPage);
		
		return Response.ok().put("page", page);
	}
	
	/**
	 * 选择菜单(添加、修改菜单)
	 */
	@RequestMapping("/select")
	@RequiresPermissions("sys:menu:select")
	public Response select(){
		//查询列表数据
		List<SysMenuEntity> menuList = sysMenuService.queryNotButtonList();
		
		//添加顶级菜单
		SysMenuEntity root = new SysMenuEntity();
		root.setMenuId(0L);
		root.setName("一级菜单");
		root.setParentId(-1L);
		root.setOpen(true);
		menuList.add(root);
		
		return Response.ok().put("menuList", menuList);
	}
	
	/**
	 * 角色授权菜单
	 */
	@RequestMapping("/perms")
	@RequiresPermissions("sys:menu:perms")
	public Response perms(){
		//查询列表数据
		List<SysMenuEntity> menuList = sysMenuService.queryList(new HashMap<String, Object>());
		
		return Response.ok().put("menuList", menuList);
	}
	
	/**
	 * 菜单信息
	 */
	@RequestMapping("/info/{menuId}")
	@RequiresPermissions("sys:menu:info")
	public Response info(@PathVariable("menuId") Long menuId){
		SysMenuEntity menu = sysMenuService.queryObject(menuId);
		return Response.ok().put("menu", menu);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sys:menu:save")
	public Response save(@RequestBody SysMenuEntity menu){
		//数据校验
		verifyForm(menu);
		
		sysMenuService.save(menu);
		
		return Response.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sys:menu:update")
	public Response update(@RequestBody SysMenuEntity menu){
		//数据校验
		verifyForm(menu);
				
		sysMenuService.update(menu);
		
		return Response.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sys:menu:delete")
	public Response delete(@RequestBody Long[] menuIds){
		for(Long menuId : menuIds){
			if(menuId.longValue() <= 28){
				return Response.error("系统菜单，不能删除");
			}
		}
		sysMenuService.deleteBatch(menuIds);
		
		return Response.ok();
	}
	
	/**
	 * 用户菜单列表
	 */
	@RequestMapping("/user")
	public Response user(){
		List<SysMenuEntity> menuList = sysMenuService.getUserMenuList(getUserId());
		
		return Response.ok().put("menuList", menuList);
	}
	
	/**
	 * 验证参数是否正确
	 */
	private void verifyForm(SysMenuEntity menu){
		if(StringUtils.isBlank(menu.getName())){
			throw new GlobalException("菜单名称不能为空");
		}
		
		if(menu.getParentId() == null){
			throw new GlobalException("上级菜单不能为空");
		}
		
		//菜单
		if(menu.getType() == SystemConstant.MenuType.MENU.getValue()){
			if(StringUtils.isBlank(menu.getUrl())){
				throw new GlobalException("菜单URL不能为空");
			}
		}
		
		//上级菜单类型
		int parentType = SystemConstant.MenuType.CATALOG.getValue();
		if(menu.getParentId() != 0){
			SysMenuEntity parentMenu = sysMenuService.queryObject(menu.getParentId());
			parentType = parentMenu.getType();
		}
		
		//目录、菜单
		if(menu.getType() == SystemConstant.MenuType.CATALOG.getValue() ||
				menu.getType() == SystemConstant.MenuType.MENU.getValue()){
			if(parentType != SystemConstant.MenuType.CATALOG.getValue()){
				throw new GlobalException("上级菜单只能为目录类型");
			}
			return ;
		}
		
		//按钮
		if(menu.getType() == SystemConstant.MenuType.BUTTON.getValue()){
			if(parentType != SystemConstant.MenuType.MENU.getValue()){
				throw new GlobalException("上级菜单只能为菜单类型");
			}
			return ;
		}
	}
}
