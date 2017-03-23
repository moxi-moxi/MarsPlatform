package org.marsplatform.extend.system.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.marsplatform.core.common.web.Response;
import org.marsplatform.core.common.web.Page;
import org.marsplatform.extend.system.model.SysUserEntity;
import org.marsplatform.extend.system.security.ShiroUtils;
import org.marsplatform.extend.system.service.SysUserRoleService;
import org.marsplatform.extend.system.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 系统用户
 * 
 */
@RestController
@RequestMapping("/sys/user")
public class SysUserController extends AbstractController {
	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysUserRoleService sysUserRoleService;
	
	/**
	 * 所有用户列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sys:user:list")
	public Response list(String username, Integer curPage, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("username", username);
		map.put("offset", (curPage - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<SysUserEntity> userList = sysUserService.queryList(map);
		int total = sysUserService.queryTotal(map);
		
		Page page = new Page(userList, total, limit, curPage);
		
		return Response.ok().put("page", page);
	}
	
	/**
	 * 获取登录的用户信息
	 */
	@RequestMapping("/info")
	public Response info(){
		return Response.ok().put("user", getUser());
	}
	
	/**
	 * 修改登录用户密码
	 */
	@RequestMapping("/password")
	public Response password(String password, String newPassword){
		if(StringUtils.isBlank(newPassword)){
			return Response.error("新密码不为能空");
		}
		
		//sha256加密
		password = new Sha256Hash(password).toHex();
		//sha256加密
		newPassword = new Sha256Hash(newPassword).toHex();
				
		//更新密码
		int count = sysUserService.updatePassword(getUserId(), password, newPassword);
		if(count == 0){
			return Response.error("原密码不正确");
		}
		
		//退出
		ShiroUtils.logout();
		
		return Response.ok();
	}
	
	/**
	 * 用户信息
	 */
	@RequestMapping("/info/{userId}")
	@RequiresPermissions("sys:user:info")
	public Response info(@PathVariable("userId") Long userId){
		SysUserEntity user = sysUserService.queryObject(userId);
		
		//获取用户所属的角色列表
		List<Long> roleIdList = sysUserRoleService.queryRoleIdList(userId);
		user.setRoleIdList(roleIdList);
		
		return Response.ok().put("user", user);
	}
	
	/**
	 * 保存用户
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sys:user:save")
	public Response save(@RequestBody SysUserEntity user){
		if(StringUtils.isBlank(user.getUsername())){
			return Response.error("用户名不能为空");
		}
		if(StringUtils.isBlank(user.getPassword())){
			return Response.error("密码不能为空");
		}
		
		sysUserService.save(user);
		
		return Response.ok();
	}
	
	/**
	 * 修改用户
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sys:user:update")
	public Response update(@RequestBody SysUserEntity user){
		if(StringUtils.isBlank(user.getUsername())){
			return Response.error("用户名不能为空");
		}
		
		sysUserService.update(user);
		
		return Response.ok();
	}
	
	/**
	 * 删除用户
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sys:user:delete")
	public Response delete(@RequestBody Long[] userIds){
		if(ArrayUtils.contains(userIds, 1L)){
			return Response.error("系统管理员不能删除");
		}
		
		if(ArrayUtils.contains(userIds, getUserId())){
			return Response.error("当前用户不能删除");
		}
		
		sysUserService.deleteBatch(userIds);
		
		return Response.ok();
	}
}
