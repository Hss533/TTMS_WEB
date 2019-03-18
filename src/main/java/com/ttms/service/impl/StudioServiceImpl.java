package com.ttms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.druid.sql.dialect.oracle.ast.clause.ModelClause.ReturnRowsClause;
import com.sun.jndi.url.iiopname.iiopnameURLContextFactory;
import com.ttms.dao.SeatDao;
import com.ttms.dao.SeatTypeDao;
import com.ttms.dao.StudioDao;
import com.ttms.entity.Seat;
import com.ttms.entity.SeatType;
import com.ttms.entity.Studio;
import com.ttms.service.StudioService;

@Service("studioService")
public class StudioServiceImpl implements StudioService
{
	@Resource
	private StudioDao studioDao;
	
	
	public List<Studio> find(Map map) {
		return studioDao.find(map);
	}

	public Long count(Map map) {
		return studioDao.count(map);
	}

	public int add(Studio studio) {
		return studioDao.add(studio);
	}

	public int update(Studio studio) {
		return studioDao.update(studio);
	}

	public int delete(Integer id) {
		
		return studioDao.delete(id);
	}

	public Studio findById(Integer id) {
		
		return studioDao.findById(id);
	}

	public Integer getMaxId() {
	
		return studioDao.getMaxId();
	}

}
