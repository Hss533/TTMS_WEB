package com.ttms.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ttms.entity.Manager;

public class FilterController implements Filter{

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	public void  doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpServletRequest request2=(HttpServletRequest)request;
		HttpServletResponse response2=(HttpServletResponse)response;
		if(request2.getSession().getAttribute("currentManager")==null)
		{
			request2.getRequestDispatcher("/backlogin.jsp").forward(request2, response2);
			
		}
		else {
			chain.doFilter(request,response);
		}
		
	}

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
