package com.ttms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.FilmTypeDao;
import com.ttms.entity.FilmType;
import com.ttms.service.FilmTypeService;

/**
 * 电影类型Service实现层
 * @author Administrator
 *
 */
@Service("filmTypeService")
public class FilmTypeServiceImpl implements FilmTypeService
{
	@Resource
	private FilmTypeDao filmTypeDao;
	
	/**
	 * 查询
	 */
	public List<FilmType> find(Map map) {
		// TODO Auto-generated method stub
		return filmTypeDao.find(map);
	}
	
	/**
	 * 获取总记录数
	 */
	public Long count(Map map) {
		// TODO Auto-generated method stub
		return filmTypeDao.count(map);
	}
	
	/**
	 * 添加
	 */
	public int add(FilmType filmType) {
		// TODO Auto-generated method stub
		return filmTypeDao.add(filmType);
	}
	
	/**
	 * 修改
	 */
	public int update(FilmType filmType) {
		// TODO Auto-generated method stub
		return filmTypeDao.update(filmType);
	}
	
	/**
	 * 删除
	 */
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return filmTypeDao.delete(id);
	}

}
