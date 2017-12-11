package com.hjli.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hjli.model.NoteinfoWithBLOBs;
import com.hjli.model.Typeinfo;
import com.hjli.model.Userinfo;
import com.hjli.service.impl.NoteServiceImpl;
import com.hjli.service.impl.TypeServiceImpl;
import com.hjli.tool.TemplateTool;

@Controller
@RequestMapping("type")
public class TypeController {

	@Resource
	TypeServiceImpl typeService;
	
	@Resource
	NoteServiceImpl noteService;
	/**
	 * 根据用户信息获取文件夹信息
	 * */
	@RequestMapping("list")
	public @ResponseBody Map<String,Object> list(HttpServletRequest request ){
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		List<Map<String,Object>> listResult = new ArrayList<Map<String,Object>>();
		listResult = getAllNode(request);
		resultMap.put("result", listResult);
		
		return resultMap;
	}
	
	/*
	 * 添加
	 * */
	@RequestMapping("add")
	public @ResponseBody Map<String,Object> add(HttpServletRequest request ){
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		
		//获取到 添加信息
		String pid = request.getParameter("pid");
		String name = request.getParameter("name");
		HttpSession session = request.getSession();
		Userinfo user = (Userinfo)session.getAttribute("user");
		String userid = user.getId().toString();
//		String userid = "1";
		Typeinfo typeInfo = new Typeinfo();
//		typeInfo.setId(123456);
		typeInfo.settName(name);
		typeInfo.settPid(pid);
		typeInfo.settUserid(userid);
		if(typeService.insertSelective(typeInfo)==1){
			getAllNode(request);
			//获得刚才添加的id;
			resultMap.put("result", typeService.findMaxId());
		}else{
			resultMap.put("result", "0");
		}
		return resultMap;
	}
	
	/**
	 * 更新
	 * */
	@RequestMapping("update")
	public @ResponseBody Map<String,Object> update(HttpServletRequest request ){
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		
		//获取到 添加信息
		String id = request.getParameter("id").toString();
		String name = request.getParameter("name");
		Typeinfo type = new Typeinfo();
		type.setId(Integer.parseInt(id));
		type.settName(name);
		if(typeService.updateByPrimaryKeySelective(type)>=1){
			getAllNode(request);
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "更新失败.");
		}
		return resultMap;
	}
	
	
	/**
	 * 删除
	 * */
	@RequestMapping("delete")
	public @ResponseBody Map<String,Object> delete(HttpServletRequest request ){
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		
		//获取到 添加信息
		String id = request.getParameter("id").toString();
		
		if(typeService.deleteByPrimaryKey(Integer.parseInt(id))>=1){
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "删除失败.");
		}
		return resultMap;
	}
	
	/**
	 * 获取根节点
	 * */
	@RequestMapping("rootNode")
	public @ResponseBody Map<String,Object> rootNode(HttpServletRequest request){
		Map<String,Object> msg = new HashMap<String,Object>();
		//获取到id
		String id = request.getParameter("id");
		if(id!=""){
			//筛选
			HttpSession session = request.getSession();
			List<Map<String,Object>> sessionList = (List<Map<String,Object>>)session.getAttribute("typeList");
			List<Map<String,Object>> listResult = new ArrayList<Map<String,Object>>();
			if(sessionList!=null){
				listResult = getNode(request,sessionList,id);
			}else{
				sessionList = getAllNode(request);
				listResult = getNode(request,sessionList,id);
			}
			if(!id.equals("1")&&!id.equals("0")){
				List<NoteinfoWithBLOBs> noteList = noteService.findByTypeId(id);//这里获取笔记  自己新增方法 findByType
				msg.put("noteList", noteList);
			}
			msg.put("result", listResult);
		}else{
			msg.put("result", "[]");
		}
		return msg;
	}
	
	//根据用户信息查询节点
	public List<Map<String,Object>> getAllNode(HttpServletRequest request){
		HttpSession session = request.getSession();
		Userinfo user = (Userinfo)session.getAttribute("user");
		List<Typeinfo> list = typeService.findByUserId(user.getId().toString());
		List<Map<String,Object>> listResult = new ArrayList<Map<String,Object>>();
		Map<String,Object> mapBase = new HashMap<String,Object>();
		mapBase.put("id", 1);
		mapBase.put("pId", 0);
		mapBase.put("name", "笔记根目录");
		mapBase.put("isParent", true);
		mapBase.put("open", true);
		listResult.add(mapBase);
		for(Typeinfo type : list){
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("id", type.getId());
			map.put("pId", Integer.parseInt(type.gettPid()));
			map.put("name", type.gettName() );
			map.put("isParent", true);
			listResult.add(map);
			
		}
		//存放session
//		HttpSession session = request.getSession();
		session.setAttribute("typeList", listResult);
		return listResult;
	}
	
	//获取到子节点
	public List<Map<String,Object>> getNode(HttpServletRequest request,List<Map<String,Object>> sessionList,String compareId){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		for(Map<String,Object> map : sessionList){
			if(map.get("pId").toString().equals(compareId)){
				list.add(map);
			}
		}
		return list;
	}
   
}
