package com.ly.sys.srv;

import org.nutz.ioc.loader.annotation.IocBean;
import com.ly.comm.BaseSrv;
import com.ly.sys.pojo.Dept;



@IocBean(name="deptSrv",fields = { "dao" })
public class DeptSrv  extends BaseSrv<Dept> {
}

