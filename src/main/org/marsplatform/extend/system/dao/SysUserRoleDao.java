package org.marsplatform.extend.system.dao;

import java.util.List;

import org.marsplatform.core.common.dao.BaseDao;
import org.marsplatform.extend.system.model.SysUserRoleEntity;

/**
 * 用户与角色对应关系
 * 
 */
public interface SysUserRoleDao extends BaseDao<SysUserRoleEntity> {
	
	/**
	 * 根据用户ID，获取角色ID列表
	 */
	List<Long> queryRoleIdList(Long userId);
}
