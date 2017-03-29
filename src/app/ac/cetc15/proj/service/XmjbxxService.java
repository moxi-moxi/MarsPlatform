package ac.cetc15.proj.service;

import ac.cetc15.proj.model.XmjbxxEntity;

import java.util.List;
import java.util.Map;

/**
 * 项目基本信息
 * 
 * @author mox
 * @email moxi-moxi@hotmail.com
 * @date 2017-03-29 14:26:15
 */
public interface XmjbxxService {
	
	XmjbxxEntity queryObject(Long id);
	
	List<XmjbxxEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(XmjbxxEntity xmjbxx);
	
	void update(XmjbxxEntity xmjbxx);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
