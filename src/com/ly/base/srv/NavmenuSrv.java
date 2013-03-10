package com.ly.base.srv;

import org.nutz.ioc.loader.annotation.IocBean;

import com.ly.base.pojo.Navmenu;
import com.ly.comm.BaseSrv;



@IocBean(name="navmenuSrv",fields = { "dao" })
public class NavmenuSrv  extends BaseSrv<Navmenu> {
	

}

