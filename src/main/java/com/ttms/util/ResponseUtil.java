package com.ttms.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

/**
 * 工具类，用于response返回数据
 * @author Administrator
 *
 */
/**
 * out.write();支持输出字符类型数据，字符，字符数组，字符串等
 * out.print();支持各种类型的数据，通过默认编码转换成bytes字节形式
 * out方法就是后端向前端输出字符流
 * jsp中有out对象
 * @author hu
 *
 */
public class ResponseUtil 
{
	
	public static void write(HttpServletResponse response,Object o)throws Exception
	{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println(o.toString());
		out.flush();
		out.close();
	}
}
