package org.marsplatform.extend.system.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.marsplatform.core.common.web.Response;
import org.marsplatform.core.common.web.Page;
import org.marsplatform.extend.system.model.ScheduleJobLogEntity;
import org.marsplatform.extend.system.service.ScheduleJobLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 定时任务日志
 * 
 */
@RestController
@RequestMapping("/sys/scheduleLog")
public class ScheduleJobLogController {
	@Autowired
	private ScheduleJobLogService scheduleJobLogService;
	
	/**
	 * 定时任务日志列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sys:schedule:log")
	public Response list(Integer curPage, Integer limit, Integer jobId){
		Map<String, Object> map = new HashMap<>();
		map.put("jobId", jobId);
		map.put("offset", (curPage - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<ScheduleJobLogEntity> jobList = scheduleJobLogService.queryList(map);
		int total = scheduleJobLogService.queryTotal(map);
		
		Page page = new Page(jobList, total, limit, curPage);
		
		return Response.ok().put("page", page);
	}
	
	/**
	 * 定时任务日志信息
	 */
	@RequestMapping("/info/{logId}")
	public Response info(@PathVariable("logId") Long logId){
		ScheduleJobLogEntity log = scheduleJobLogService.queryObject(logId);
		
		return Response.ok().put("log", log);
	}
}
