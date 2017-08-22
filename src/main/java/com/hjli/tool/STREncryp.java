package com.hjli.tool;

public class STREncryp {
	
	/**
	 * 加密
	 * */
	public static String stringToAscii(String value)  
	{  
		//字符序列改变
		String newValue = "";
		char[] newCharStr = value.toCharArray();
		for(int i=newCharStr.length-1;i>=0;i--){
			newValue+=newCharStr[i];
		}
		
	    StringBuffer sbu = new StringBuffer();  
	    char[] chars = newValue.toCharArray();   
	    for (int i = 0; i < chars.length; i++) {  
	        if(i != chars.length - 1)  
	        {  
	            sbu.append((int)chars[i]).append(",");  
	        }  
	        else {  
	            sbu.append((int)chars[i]);  
	        }  
	    }  
	    
	    String towStr = sbu.toString();
	    String result = "";
	    char[] twoCharStr = towStr.toCharArray();
		for(int i=twoCharStr.length-1;i>=0;i--){
			result+=twoCharStr[i];
		}
	    return result;  
	} 
	
	/**
	 * 解密
	 * */
	public static String asciiToString(String value)  
	{  
		//字符序列改变
		String newValue = "";
		char[] newCharStr = value.toCharArray();
		for(int i=newCharStr.length-1;i>=0;i--){
			newValue+=newCharStr[i];
		}
		
	    StringBuffer sbu = new StringBuffer();  
	    String[] chars = newValue.split(",");  
	    for (int i = 0; i < chars.length; i++) {  
	        sbu.append((char) Integer.parseInt(chars[i]));  
	    }  
	    
	    
	    String towStr = sbu.toString();
	    String result = "";
	    char[] twoCharStr = towStr.toCharArray();
		for(int i=twoCharStr.length-1;i>=0;i--){
			result+=twoCharStr[i];
		}
	    return result;  
	}  
	
	
}
