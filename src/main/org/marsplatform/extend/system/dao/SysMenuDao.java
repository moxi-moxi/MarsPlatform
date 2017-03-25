package org.marsplatform.extend.system.dao;

import java.util.List;

import org.marsplatform.core.common.dao.BaseDao;
import org.marsplatform.extend.system.model.SysMenuEntity;

/**
 * 菜单管理
 * 
 */
public interface SysMenuDao extends BaseDao<SysMenuEntity> {
	
	/**
	 * 根据父菜单，查询子菜单
	 * @param parentId 父菜单ID
	 */
	List<SysMenuEntity> queryListParentId(Long parentId);
	
	/**
	 * 获取不包含按钮的菜单列表
	 */
	List<SysMenuEntity> queryNotButtonList();
}
