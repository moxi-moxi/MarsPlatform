package ac.cetc15.proj.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import ac.cetc15.proj.dao.XmjbxxDao;
import ac.cetc15.proj.model.XmjbxxEntity;
import ac.cetc15.proj.service.XmjbxxService;



@Service("xmjbxxService")
public class XmjbxxServiceImpl implements XmjbxxService {
	@Autowired
	private XmjbxxDao xmjbxxDao;
	
	@Override
	public XmjbxxEntity queryObject(Long id){
		return xmjbxxDao.queryObject(id);
	}
	
	@Override
	public List<XmjbxxEntity> queryList(Map<String, Object> map){
		return xmjbxxDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return xmjbxxDao.queryTotal(map);
	}
	
	@Override
	public void save(XmjbxxEntity xmjbxx){
		xmjbxxDao.save(xmjbxx);
	}
	
	@Override
	public void update(XmjbxxEntity xmjbxx){
		xmjbxxDao.update(xmjbxx);
	}
	
	@Override
	public void delete(Long id){
		xmjbxxDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		xmjbxxDao.deleteBatch(ids);
	}
	
}
