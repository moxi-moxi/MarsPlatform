package org.marsplatform.core.common.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.marsplatform.core.common.model.Entity;

public interface Dao {

	<T extends Entity, ID extends Serializable> ID save(T entity) throws Exception;

	<T extends Entity> void update(T entity) throws Exception;

	<T extends Entity> void saveOrUpdate(T entity) throws Exception;

	public <T extends Entity> void saveOrUpdate(Collection<T> entities) throws Exception;

	public <T extends Entity> void delete(T entity) throws Exception;

	public <T extends Entity> void delete(Collection<T> entities) throws Exception;

	public <T extends Entity, ID extends Serializable> void delete(Class<T> clazz, ID id) throws Exception;

	public <T extends Entity> void delete(Class<T> clazz, Map<String, Object> paramMap) throws Exception;

	public <T extends Entity, ID extends Serializable> T get(Class<T> clazz, ID id) throws Exception;

	public <T extends Entity> T get(Class<T> clazz, Map<String, Object> paramMap) throws Exception;

	public <T extends Entity> List<T> list(Class<T> clazz) throws Exception;

	public <T extends Entity> List<T> list(Class<T> clazz, int pageNum, int pageSize) throws Exception;

	public <T extends Entity> List<T> find(Class<T> clazz, Map<String, Object> paramMap) throws Exception;

	public <T extends Entity> List<T> find(Class<T> clazz, Map<String, Object> paramMap, int pageNum, int pageSize)
			throws Exception;

	public <T extends Entity> List<T> find(Class<T> clazz, Map<String, Object> paramMap, String orderBy, boolean isAsc)
			throws Exception;

	public <T extends Entity> List<T> find(Class<T> clazz, Map<String, Object> paramMap, String orderBy, boolean isAsc,
			int pageNum, int pageSize) throws Exception;

	public <T extends Entity> int count(Class<T> clazz) throws Exception;

	public <T extends Entity> int count(Class<T> clazz, Map<String, Object> paramMap) throws Exception;

}
