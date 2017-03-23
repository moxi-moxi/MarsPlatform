package org.marsplatform.extend.system.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.marsplatform.core.common.web.Response;
import org.marsplatform.core.common.web.Page;
import org.marsplatform.core.exception.GlobalException;
import org.marsplatform.extend.system.model.ScheduleJobEntity;
import org.marsplatform.extend.system.service.ScheduleJobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 定时任务
 * 
 */
@RestController
@RequestMapping("/sys/schedule")
public class ScheduleJobController {
	@Autowired
	private ScheduleJobService scheduleJobService;
	
	/**
	 * 定时任务列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sys:schedule:list")
	public Response list(String beanName, Integer curPage, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("beanName", beanName);
		map.put("offset", (curPage - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<ScheduleJobEntity> jobList = scheduleJobService.queryList(map);
		int total = scheduleJobService.queryTotal(map);
		
		Page page = new Page(jobList, total, limit, curPage);
		
		return Response.ok().put("page", page);
	}
	
	/**
	 * 定时任务信息
	 */
	@RequestMapping("/info/{jobId}")
	@RequiresPermissions("sys:schedule:info")
	public Response info(@PathVariable("jobId") Long jobId){
		ScheduleJobEntity schedule = scheduleJobService.queryObject(jobId);
		
		return Response.ok().put("schedule", schedule);
	}
	
	/**
	 * 保存定时任务
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sys:schedule:save")
	public Response save(@RequestBody ScheduleJobEntity scheduleJob){
		//数据校验
		verifyForm(scheduleJob);
		
		scheduleJobService.save(scheduleJob);
		
		return Response.ok();
	}
	
	/**
	 * 修改定时任务
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sys:schedule:update")
	public Response update(@RequestBody ScheduleJobEntity scheduleJob){
		//数据校验
		verifyForm(scheduleJob);
				
		scheduleJobService.update(scheduleJob);
		
		return Response.ok();
	}
	
	/**
	 * 删除定时任务
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sys:schedule:delete")
	public Response delete(@RequestBody Long[] jobIds){
		scheduleJobService.deleteBatch(jobIds);
		
		return Response.ok();
	}
	
	/**
	 * 立即执行任务
	 */
	@RequestMapping("/run")
	@RequiresPermissions("sys:schedule:run")
	public Response run(@RequestBody Long[] jobIds){
		scheduleJobService.run(jobIds);
		
		return Response.ok();
	}
	
	/**
	 * 暂停定时任务
	 */
	@RequestMapping("/pause")
	@RequiresPermissions("sys:schedule:pause")
	public Response pause(@RequestBody Long[] jobIds){
		scheduleJobService.pause(jobIds);
		
		return Response.ok();
	}
	
	/**
	 * 恢复定时任务
	 */
	@RequestMapping("/resume")
	@RequiresPermissions("sys:schedule:resume")
	public Response resume(@RequestBody Long[] jobIds){
		scheduleJobService.resume(jobIds);
		
		return Response.ok();
	}
	
	/**
	 * 验证参数是否正确
	 */
	private void verifyForm(ScheduleJobEntity scheduleJob){
		if(StringUtils.isBlank(scheduleJob.getBeanName())){
			throw new GlobalException("bean名称不能为空");
		}
		
		if(StringUtils.isBlank(scheduleJob.getMethodName())){
			throw new GlobalException("方法名称不能为空");
		}
		
		if(StringUtils.isBlank(scheduleJob.getCronExpression())){
			throw new GlobalException("cron表达式不能为空");
		}
	}
}
