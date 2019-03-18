package com.ttms.util;

/**
 * 字符串工具类
 * @author Administrator
 *
 */
public class StringUtil 
{
	/**
	 * 判断String为空
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str)
	{
		if("".equals(str)|| str==null){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 判断String不为空
	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty(String str)
	{
		if(!"".equals(str)&&str!=null){
			return true;
		}else{
			return false;
		}
	}
	
	/**
	 * 主要用于模糊查询
	 * @param str
	 * @return
	 */
	public static String formatLike(String str)
	{
		if(isNotEmpty(str))
		{
			return "%"+str+"%";
		}
		else
		{
			return null;
		}
	}

}
