package org.marsplatform.extend.system.dao;

import java.util.Map;

import org.marsplatform.extend.system.model.ScheduleJobEntity;

/**
 * 定时任务
 * 
 */
public interface ScheduleJobDao extends BaseDao<ScheduleJobEntity> {
	
	/**
	 * 批量更新状态
	 */
	int updateBatch(Map<String, Object> map);
}
