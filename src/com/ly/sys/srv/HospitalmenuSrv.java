package com.ly.sys.srv;

import org.nutz.ioc.loader.annotation.IocBean;
import com.ly.comm.BaseSrv;
import com.ly.sys.pojo.Hospitalmenu;



@IocBean(name="hospitalmenuSrv",fields = { "dao" })
public class HospitalmenuSrv  extends BaseSrv<Hospitalmenu> {
	

}

