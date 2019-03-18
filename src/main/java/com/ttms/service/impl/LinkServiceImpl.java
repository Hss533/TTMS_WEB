package com.ttms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.LinkDao;
import com.ttms.entity.Link;
import com.ttms.service.LinkService;

/**
 * 友情链接Service实现层
 * @author Administrator
 *
 */
@Service("linkService")
public class LinkServiceImpl implements LinkService
{
	@Resource
	private LinkDao linkDao;
	
	/**
	 * 查找
	 */
	public List<Link> find(Map map) {
		// TODO Auto-generated method stub
		return linkDao.find(map);
	}
	
	/**
	 * 获取总记录数
	 */
	public Long count(Map map) {
		// TODO Auto-generated method stub
		return linkDao.count(map);
	}
	
	/**
	 * 添加
	 */
	public int add(Link link) {
		// TODO Auto-generated method stub
		return linkDao.add(link);
	}
	
	/**
	 * 修改
	 */
	public int update(Link link) {
		// TODO Auto-generated method stub
		return linkDao.update(link);
	}
	
	/**
	 * 删除
	 */
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return linkDao.delete(id);
	}

}
