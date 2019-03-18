package com.ttms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.InformationDao;
import com.ttms.entity.Information;
import com.ttms.service.InformationService;

/**
 * 资讯Service实现类
 * @author Administrator
 *
 */
@Service("informationService")
public class InformationServiceImpl implements InformationService
{
	@Resource
	private InformationDao informationDao;

	public List<Information> find(Map map) {
		// TODO Auto-generated method stub
		return informationDao.find(map);
	}

	public Long count(Map map) {
		// TODO Auto-generated method stub
		return informationDao.count(map);
	}

	public Integer add(Information information) {
		// TODO Auto-generated method stub
		return informationDao.add(information);
	}

	public List<Information> findNew() {
		// TODO Auto-generated method stub
		return informationDao.findNew();
	}

	public Information findById(Integer id) {
		// TODO Auto-generated method stub
		return informationDao.findById(id);
	}

	public List<Information> findByFilmId(Integer id) {
		// TODO Auto-generated method stub
		return informationDao.findByFilmId(id);
	}

	public int deleteByFilmId(Integer id) {
		// TODO Auto-generated method stub
		return informationDao.deleteByFilmId(id);
	}

	public int update(Information information) {
		// TODO Auto-generated method stub
		return informationDao.update(information);
	}

	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return informationDao.delete(id);
	}

	
}
