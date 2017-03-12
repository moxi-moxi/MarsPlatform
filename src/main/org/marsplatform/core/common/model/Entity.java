package org.marsplatform.core.common.model;

import java.io.Serializable;

public interface Entity {

	public <ID extends Serializable> ID getId() throws Exception;

	public <ID extends Serializable> void setId(ID id) throws Exception;

	public void save();

	public void update();

	public void delete();

}