package com.ly;

import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;

import com.ly.comm.AppContext;
import com.ly.comm.CBData;

public class MvcSetup implements Setup {

	//private static final Log log = Logs.getLog(MvcSetup.class);

	public void destroy(NutConfig arg0) {
		// TODO Auto-generated method stub
		
	}

	public void init(NutConfig config) {
		AppContext.ioc = config.getIoc();
		
		//初始化基础信息数据
		CBData.getInstance().init();
	}

}
