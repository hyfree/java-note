package com.hjli.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hjli.model.Userinfo;

public class LoginFilter implements Filter {

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) req;  
		HttpServletResponse response = (HttpServletResponse) resp;
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String appContext = request.getContextPath().toString();
//		System.out.println("---doFilter()"+request.getRequestURI());
		String requestURL = request.getRequestURI();
		String loginUrl = request.getScheme()+"://"+request.getServerName()+":"+ request.getServerPort() + appContext+"/login";
		if(requestURL.contains("login")||requestURL.contains("assets")||requestURL.contains("validate")){
			chain.doFilter(req, resp);
		}else{
			HttpSession session = request.getSession();
			Userinfo user = (Userinfo)session.getAttribute("user");
			if(session!=null&&user!=null){
				chain.doFilter(req, resp);
			}else{	
				  
				response.sendRedirect(loginUrl);
			}
		}
	}

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
