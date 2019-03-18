package com.ttms.dao;

import java.util.List;

import com.ttms.entity.Picture;

/**
 * 图集Dao层接口
 * @author Administrator
 *
 */
public interface PictureDao 
{
	/**
	 * 获取电影所有图片
	 * @param id
	 * @return
	 */
	public List<Picture> findByFilmId(Integer id);
}
