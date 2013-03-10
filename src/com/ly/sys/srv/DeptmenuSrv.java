package com.ly.sys.srv;

import org.nutz.ioc.loader.annotation.IocBean;
import com.ly.comm.BaseSrv;
import com.ly.sys.pojo.Deptmenu;



@IocBean(name="deptmenuSrv",fields = { "dao" })
public class DeptmenuSrv  extends BaseSrv<Deptmenu> {
	

}

