package com.hjli.tool;

import java.security.MessageDigest;

public class MD5Encryp {
	
	
	/**
	 * 注释：String To MD5
	 * 作者：Haojie Li
	 * 时间：2017-04-27 23:20
	 * */
	public static String stringToMD5(String text) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(text.getBytes());
			byte b[] = md.digest();

			int i;
			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			
			return buf.toString().substring(4, 20);
			// System.out.println("32λ: " + buf.toString());// 32位
			// System.out.println("16λ: " + buf.toString().substring(8, 24));//
			// 16位
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
