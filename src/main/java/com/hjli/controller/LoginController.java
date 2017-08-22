package com.hjli.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hjli.model.Userinfo;
import com.hjli.service.impl.UserServiceImpl;

@Controller
@RequestMapping("login")
public class LoginController {
	
	@Resource
	UserServiceImpl userService;
	@RequestMapping("validate")
	public @ResponseBody Map<String,Object> validate(HttpServletRequest request){
		Map<String,Object> resultMap = new HashMap<String,Object>();
		
		if(request.getParameter("uname")==null||request.getParameter("uname")==""){
			resultMap.put("result", "用户名不能为空");
			return resultMap;
		}
		if(request.getParameter("upwd")==null||request.getParameter("upwd")==""){
			resultMap.put("result", "密码不能为空");
			return resultMap;
		}
		String name = request.getParameter("uname");
		String pwd = request.getParameter("upwd");
		Userinfo user = userService.findByAccount(name);
		if(user!=null){
			if(user.getUpwd().equals(pwd)){
				//保存到session
				HttpSession session = request.getSession();
				session.removeAttribute("user");
				session.removeAttribute("typeList");
				session.setAttribute("user", user);
				resultMap.put("result", "success");
			}else{
				resultMap.put("result", "登录失败");
			}
		}else{
			resultMap.put("result", "登录失败");
		}
		return resultMap;
	}

}
