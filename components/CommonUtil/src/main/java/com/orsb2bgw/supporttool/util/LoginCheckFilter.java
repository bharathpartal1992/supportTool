package com.orsb2bgw.supporttool.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginCheckFilter implements Filter
{

	@Override
	public void destroy() {
		
		
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {

	       HttpServletRequest request = (HttpServletRequest) servletRequest;
	       HttpServletResponse response = (HttpServletResponse) servletResponse;


	       if(request.getUserPrincipal()!= null && request.getParameterNames().hasMoreElements()? !request.getParameterNames().nextElement().equals("logout"):true && request.getSession().getAttribute("sessionusername")!=null){ //If user is already authenticated
		       
	    	   response.sendRedirect(request.getContextPath()+"/user");// or, forward using RequestDispatcher
	       } else{
	    	   if (request.getHeader("X-AjaxRequest") != null && request.getHeader("X-AjaxRequest").equals("1")) {
                   response.sendError(601, "");
                   filterChain.doFilter(request, response);
                   }else
                  filterChain.doFilter(request, response);
	           //filterChain.doFilter(servletRequest, servletResponse);
	       }
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}