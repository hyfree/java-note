package com.hjli.start;

import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.webapp.WebAppContext;


public class Program {

	public static void main(String[] args) throws Exception {
		String webapp = "src/main/webapp";  
		  
		Server server = new Server(8080);  
		  
		WebAppContext context = new WebAppContext();  
		context.setDescriptor(webapp + "/WEB-INF/web.xml");  
		context.setResourceBase(webapp);  
		context.setContextPath("/");  
		context.setClassLoader(  
		    Thread.currentThread().getContextClassLoader());  
		  
		server.setHandler(context);  
		  
		server.start();  
		server.join(); 
	}
}
