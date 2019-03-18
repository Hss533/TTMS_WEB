package com.ttms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.PowerDao;
import com.ttms.entity.Power;
import com.ttms.service.PowerService;

/**
 * 权限管理Service层
 * @author Administrator
 *
 */
@Service("powerService")
public class PowerServiceImpl implements PowerService
{
	@Resource
	public PowerDao powerDao;
	
	public List<Power> find(Map<String ,Object> map) {
		return powerDao.find(map);
	}

	public Long count(Map<String, Object> map) {
		return powerDao.count(map);
	}

	public int add(Power power) {
		return powerDao.add(power);
	}

	public int update(Power power) {
		return powerDao.update(power);
	}

	public int delete(Integer id) {
		return powerDao.delete(id);
	}

	public Power findById(Integer id) {
		// TODO Auto-generated method stub
		return powerDao.findById(id);
	}

}
