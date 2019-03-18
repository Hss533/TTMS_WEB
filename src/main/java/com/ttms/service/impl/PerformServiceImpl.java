package com.ttms.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.PerformDao;
import com.ttms.entity.Perform;
import com.ttms.service.PerformService;

@Service("performService")
public class PerformServiceImpl implements PerformService
{
	@Resource
	private PerformDao performDao;
	
	public List<Perform> find(Map map) {
		// TODO Auto-generated method stub
		return performDao.find(map);
	}

	public Long count(Map map) {
		// TODO Auto-generated method stub
		return performDao.count(map);
	}

	public int add(Perform perform) {
		// TODO Auto-generated method stub
		return performDao.add(perform);
	}

	public int update(Perform perform) {
		// TODO Auto-generated method stub
		return performDao.update(perform);
	}

	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return performDao.delete(id);
	}

	public Perform findById(Integer id) {
		// TODO Auto-generated method stub
		return performDao.findById(id);
	}

	public Perform getLeft(Date time) {
		// TODO Auto-generated method stub
		return performDao.getLeft(time);
	}

	public Perform getRight(Date time) {
		// TODO Auto-generated method stub
		return performDao.getRight(time);
	}
	
	
}
