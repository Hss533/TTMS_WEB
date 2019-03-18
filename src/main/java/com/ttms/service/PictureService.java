package com.ttms.service;

import java.util.List;

import com.ttms.entity.Picture;

public interface PictureService 
{
	/**
	 * 获取电影所有图片
	 * @param id
	 * @return
	 */
	public List<Picture> findByFilmId(Integer id);

}
