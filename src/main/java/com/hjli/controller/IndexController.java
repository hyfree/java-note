package com.hjli.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hjli.model.Noteinfo;
import com.hjli.model.Userinfo;
import com.hjli.service.impl.NoteServiceImpl;
import com.hjli.tool.TemplateTool;

@Controller
public class IndexController {
	@Resource
	NoteServiceImpl noteService;

	@RequestMapping("index")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("index");
		return model;
	}

	/**
	 * 笔记列表
	 * */
	@RequestMapping("list")
	public ModelAndView list(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView model = new ModelAndView("list");
		// 查询笔记20条
		HttpSession session = request.getSession();
		Userinfo user = (Userinfo) session.getAttribute("user");
		List<Noteinfo> list = noteService.findTwenty(user.getId().toString());
		//生成Html文件
		//判断是否有文件夹  没有就生成
		String filePath = request.getRealPath("/");
		File file = new File(filePath+"/html");
		html(readFile(file),list,request,response);
		model.addObject("list", list);
		return model;
	}

	@RequestMapping("login")
	public ModelAndView login() {
		ModelAndView model = new ModelAndView("login");
		return model;
	}

	public List<String> readFile(File file) {
		List<String> list = new ArrayList<String>();
		File[] fs = file.listFiles();
		for (File f : fs) {
//			System.out.println(f.isDirectory() ? "文件夹：" + f.getAbsolutePath()
//					: "文件：" + f.getName());
			list.add(f.getName());
			if (f.isDirectory()) {
				readFile(f);
			}
		}
//		System.out.println(fs.length + ":" + list.size());
		return list;
	}

	public void html(List<String> fileList, List<Noteinfo> dataList,
			HttpServletRequest request, HttpServletResponse response) {
		if (fileList.size() > 0) {
			for (Noteinfo note : dataList) {
				Map<String, String> ftlMap = new HashMap<String, String>();
				ftlMap.put("content", note.getnContent());
				ftlMap.put("rootpath", request.getContextPath());
				ftlMap.put("title", note.getnTitle());
				String fileName = note.getnAddress().replace("html/", "");
				// 生成html文件
				if (!fileList.contains(fileName)) {
					TemplateTool.createHtml(ftlMap, "templates", "note.ftl","html", fileName, request, response);
				}
			}
		} else {
			if (dataList.size() > 0) {
				for (Noteinfo note : dataList) {
					Map<String, String> ftlMap = new HashMap<String, String>();
					ftlMap.put("content", note.getnContent());
					ftlMap.put("rootpath", request.getContextPath());
					ftlMap.put("title", note.getnTitle());
					String fileName = note.getnAddress().replace("html/", "");
					// 生成html文件
					TemplateTool.createHtml(ftlMap, "templates", "note.ftl",
							"html", fileName, request, response);
				}
			}

		}
	}
}
