package com.ly.comm;


import java.text.SimpleDateFormat;
import java.util.Date;

import com.ly.util.DateUtils;

public class PKID {
	
	private static int i=0;
	
	private static int j=0;
	
	public static String getId(){
		String id = DateUtils.format(new java.util.Date(),"yyyyMMddHHmmssSSS");
		id += String.valueOf((++i>=99?1:i));
		return id;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println(PKID.getId());
	}
	
	/**
	 * 随机编号
	 * @param prefix 前缀 例如：SN1011261331653 SN为前缀
	 * @return
	 */
	public static String getNo(String prefix){
		String id = DateUtils.format(new java.util.Date(),"yyMMddHHmmssSSS");
		id += String.valueOf((++i>=99?1:i));
		return prefix+id;
		
    }

}
