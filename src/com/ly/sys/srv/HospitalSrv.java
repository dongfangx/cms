package com.ly.sys.srv;

import org.nutz.ioc.loader.annotation.IocBean;
import com.ly.comm.BaseSrv;
import com.ly.sys.pojo.Hospital;



@IocBean(name="hospitalSrv",fields = { "dao" })
public class HospitalSrv  extends BaseSrv<Hospital> {
	

}

