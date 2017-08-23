package com.hjli.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hjli.model.NoteinfoWithBLOBs;
import com.hjli.model.Noteinfo;
import com.hjli.service.impl.NoteServiceImpl;
import com.hjli.tool.TemplateTool;

@Controller
@RequestMapping("notes")
public class NoteController {
	
	@Resource
	NoteServiceImpl noteService;
	
	/**
	 * 添加笔记
	 * */
	@RequestMapping("add")
	public @ResponseBody Map<String,Object> add(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> msg = new HashMap<String,Object>();
		Map<String,String> ftlMap = new HashMap<String,String>();
		ftlMap.put("mdtext", request.getParameter("mdtext"));
		ftlMap.put("content", request.getParameter("content"));
		ftlMap.put("rootpath", request.getContextPath());
		ftlMap.put("title", request.getParameter("title"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy年MM月dd日");
		Date date = new Date();
		String fileName = sdf.format(date);
		
		//生成html
		if(TemplateTool.createHtml(ftlMap, "templates", "note.ftl", "html", fileName+".html", request, response)=="200"){
			//文件保存地址
			String address = "html/"+fileName+".html";
			String dateStr = sdf2.format(date);
			String title = request.getParameter("title");
			String typeid = request.getParameter("typeid");
			String content = request.getParameter("content");
			String mdtext = request.getParameter("mdtext");
			//添加到数据库
			NoteinfoWithBLOBs note = new NoteinfoWithBLOBs();
			note.setnAddress(address);
			note.setnContent(content);
			note.setnMdtext(mdtext);
			note.setnTitle(title);
			note.setnTypeid(typeid);
			note.setnDate(dateStr);
			
			if(noteService.insertSelective(note)==1){
				msg.put("result", "success");
			}else{
				msg.put("result", "添加失败");
			}
		}else{
			msg.put("result", "添加失败");
		}
		return msg;
		
	}
	


}
