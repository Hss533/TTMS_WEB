package com.ttms.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.FilmDao;
import com.ttms.entity.Film;
import com.ttms.entity.Picture;
import com.ttms.service.FilmService;

/**
 * 电影Service实现类
 * @author Administrator
 *
 */
@Service("filmService")
public class FilmServiceImpl implements FilmService
{
	@Resource
	private FilmDao filmDao;
	
	/**
	 * 获取电影列表
	 */
	public List<Film> find(Map map) {
		return filmDao.find(map);
	}

	public Long count(Map map) {
		return filmDao.count(map);
	}

	public int add(Film film) {
		return filmDao.add(film);
	}

	public int update(Film film) {
		return filmDao.update(film);
	}

	public int delete(Integer id) {
		return filmDao.delete(id);
	}

	public Integer getMaxId() {
		return filmDao.getMaxId();
	}

	public Integer addMiddleTable(Map map) {
		return filmDao.addMiddleTable(map);
	}

	public Integer addPictures(Map map) {
		return filmDao.addPictures(map);
	}

	public Film findById(Integer id) {
		return filmDao.findById(id);
	}

	public Integer getHotNum() {
		return filmDao.getHotNum();
	}

	public List<Film> getFilmByHot(Map map) {
		return filmDao.getFilmByHot(map);
	}

	public List<Film> getFilmByBox(Map map) {
		return filmDao.getFilmByBox(map);
	}

	public List<Film> getFilmByClickHit(Map map) {
		return filmDao.getFilmByClickHit(map);
	}

	public List<Film> getFilmByScore(Map map) {
		return filmDao.getFilmByScore(map);
	}

	public List<Film> findByFilmTypeId(Integer id) {
		return filmDao.findByFilmTypeId(id);
	}

	public int deleteByFilmId(Integer id) {
		return filmDao.deleteByFilmId(id);
	}

	public int deletePictures(Integer id) {
		// TODO Auto-generated method stub
		return filmDao.deletePictures(id);
	}
	public List<Film> findByName(String name) {
		// TODO Auto-generated method stub
		return filmDao.findByName(name);
	}

	public Integer findCountByName(String name) {
		// TODO Auto-generated method stub
		return filmDao.findCountByName(name);
	}

}
