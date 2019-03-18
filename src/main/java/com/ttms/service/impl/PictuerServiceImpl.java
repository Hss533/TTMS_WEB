package com.ttms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ttms.dao.PictureDao;
import com.ttms.entity.Picture;
import com.ttms.service.PictureService;

@Service("pictureService")
public class PictuerServiceImpl implements PictureService
{
	@Resource
	private PictureDao pictureDao;

	public List<Picture> findByFilmId(Integer id) {
		// TODO Auto-generated method stub
		return pictureDao.findByFilmId(id);
	}

}
