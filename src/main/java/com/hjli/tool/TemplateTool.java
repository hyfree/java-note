package com.hjli.tool;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class TemplateTool {

	public static void print(Map<String,String> map,String path,String templateName,HttpServletRequest request,HttpServletResponse response){
		
//		Map<String,String> map = new HashMap<String,String>();
//		map.put("title", "Programer 猿笔记");
//		map.put("sys_name", "Programer</strong> <small>猿笔记");
//		map.put("user_name", "haojieli");
//		
//		//设置模版路径
//		String path = "templates";
//		
//		//模版名字
//		String templateName = "admin-index.ftl";
		try{
			//模版配置
			Configuration cfg = new Configuration(); 
			
			//设置模版编码
			cfg.setDefaultEncoding("UTF-8");
			
			// 指定FreeMarker模板文件的位置  
	        cfg.setServletContextForTemplateLoading(request.getServletContext(),path);
	        
	        // 获取模板文件  
	        Template template = cfg.getTemplate(templateName);
	        
	        //设置编码
	        template.setEncoding("UTF-8");
	        
	        response.setContentType("text/html; charset=" + template.getEncoding()); 
	        
	        Writer out = response.getWriter();   
	        
	        template.process(map, out);
		}catch(Exception e){
			//错误日志
			System.out.println("加载模版Error"+e.getMessage());
		}
		 
        
	}
	
	public static String createHtml(Map<String,String> map,String templatePath,String templateName,String htmlFilePath,String htmlFileName,HttpServletRequest request,HttpServletResponse response){
		try{
			
			//模版配置
			Configuration cfg = new Configuration(); 
			
			//设置模版编码
			cfg.setDefaultEncoding("UTF-8");
			
			// 指定FreeMarker模板文件的位置  
	        cfg.setServletContextForTemplateLoading(request.getServletContext(),templatePath);
	        
	        // 获取模板文件  
	        Template template = cfg.getTemplate(templateName);
	        
	        //设置编码
	        template.setEncoding("UTF-8");
	        
	        response.setContentType("text/html; charset=" + template.getEncoding()); 
	
	        
	        
	        String basePath = request.getSession().getServletContext().getRealPath("/");  
//	        System.out.println(basePath+"::::::::::"+request.getRealPath("/")+":::"+request.getContextPath() );
            String fileLloder = basePath +"/"+ htmlFilePath +"/"; 
            String file1 = basePath +"/"+ htmlFilePath +"/"+ htmlFileName; 
            File file = new File(fileLloder);  
            if (!file.exists())  
                file.mkdir();  
            
            File file2 = new File(file1);  
            if (!file2.exists())  
            	file2.createNewFile();   
            Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file2), "UTF-8")); 
            template.process(map, out); // 往模板里写数据  
            out.flush();
            return "200";
		}catch(Exception e){
			//错误日志
			System.out.println("生成模版Error"+e.getMessage());
			return "error";
		}
	}
}
