package com.ttms.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ttms.entity.User;


@Controller
@RequestMapping("/test")
public class TestController {

	/**
	 * 上传文件实现
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("/upload")
	public String  upload(MultipartFile file1,HttpServletRequest request) throws IllegalStateException, IOException
	{
		//如果想上传多个文件的话，需要用MultipartFile[] files进行接收
		/*
		 *前端： 
		 * <input type="file" name="files">
		 * <input type="file" name="files">
		 * <input type="file" name="files">
		 * 然后再进行提交表单
		 */
		//file1.getContentType();获取文件类型
		//file1.getName();表单中文件组件对应name值
		//file1.getOriginalFilename();文件原始名称，包括后缀名
		//MultipartFile.getSize();文件大小单位为k，:27128 
		//MultipartFile.isEmpty();文件是否为空
		
		System.out.println("request.getRemoteUser()"+request.getRemoteUser());
		String paths=System.getProperty("bookdier");
		System.out.println("通过web.xml进行配置所得的"+paths);
		/**
		 * 
		 * request.getSession().getServletContext().getRealPath("\\");
		 * 获取文件上传的路径
		 * 
		 * 
		 */
		
		String  realPath=request.getSession().getServletContext().getRealPath("\\");
		String filename=file1.getOriginalFilename();
		File dir=new File(realPath+"\\static\\image\\test\\",filename);
		if(!dir.exists())
		{
			dir.mkdirs();
		}
		
		file1.transferTo(dir);//这个的用处应该是把文件写入硬盘
		
		return "redirect:/testzhaopian.jsp";
		/*
		 *  return "testzhaopian";这个也返回的是testzhaipian.jsp
		 *  因为再后面要加上后缀
		 * 	
		 */
	}
	/**
	 * 下载文件实现
	 */
	@SuppressWarnings("resource")
	@RequestMapping("/download")
	public void  download(HttpServletRequest request,HttpServletResponse response)throws  Exception
	{
		String  path=request.getSession().getServletContext().getRealPath("\\")+"\\static\\image\\1.jpg";//文件目录
		InputStream bInputStream=new BufferedInputStream(new FileInputStream(new File(path)));
		String  filename="下载文件.jpg";
		filename=URLEncoder.encode(filename,"UTF-8");
		response.addHeader("Content-Disposition", "attachment;filename="+filename);
		response.setContentType("multipart/form-data");
		BufferedOutputStream outputStream=new BufferedOutputStream(response.getOutputStream());
		int len=0;
		while((len=bInputStream.read())!=-1)
		{
			outputStream.write(len);
			outputStream.flush();
		}
		outputStream.close();	
	}
	
	@ResponseBody
	@RequestMapping(value="/name",method = RequestMethod.POST)
	public void name(@RequestBody User user,HttpServletResponse response,HttpServletRequest request) throws IOException
	{
		
		System.out.println(request.getParameter("account"));
		System.out.println(user.getAccount());
	}
	/*
	 * 使用ajax进行传值
	 * @RequestBody获得对象
	 * 还不知道要不要进行配置？？
	 * 
	 */
}
