package org.marsplatform.core.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.AuthorizationException;
import org.marsplatform.core.common.web.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

/**
 * 异常处理器
 * 
 */
@Component
public class GlobalExceptionHandler implements HandlerExceptionResolver {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
		Result r = new Result();
		try {
			response.setContentType("application/json;charset=utf-8");
			response.setCharacterEncoding("utf-8");
			
			if (ex instanceof GlobalException) {
				r.put("code", ((GlobalException) ex).getCode());
				r.put("msg", ((GlobalException) ex).getMessage());
			}else if(ex instanceof DuplicateKeyException){
				r = r.error("数据库中已存在该记录");
			}else if(ex instanceof AuthorizationException){
				r = r.error("没有权限，请联系管理员授权");
			}else{
				r = r.error();
			}
			
			//记录异常日志
			logger.error(ex.getMessage(), ex);
			
			String json = JSON.toJSONString(r);
			response.getWriter().print(json);
		} catch (Exception e) {
			logger.error("MPExceptionHandler 异常处理失败", e);
		}
		return new ModelAndView();
	}
}
