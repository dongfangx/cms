package com.ly.sys.srv;

import org.nutz.ioc.loader.annotation.IocBean;
import com.ly.comm.BaseSrv;
import com.ly.sys.pojo.Employeemenu;



@IocBean(name="employeemenuSrv",fields = { "dao" })
public class EmployeemenuSrv  extends BaseSrv<Employeemenu> {
	

}

