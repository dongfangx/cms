package com.ly.sys.srv;

import org.nutz.ioc.loader.annotation.IocBean;
import com.ly.comm.BaseSrv;
import com.ly.sys.pojo.Employee;



@IocBean(name="employeeSrv",fields = { "dao" })
public class EmployeeSrv  extends BaseSrv<Employee> {
	

}

