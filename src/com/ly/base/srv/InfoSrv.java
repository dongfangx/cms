package com.ly.base.srv;

import org.nutz.ioc.loader.annotation.IocBean;
import com.ly.comm.BaseSrv;
import com.ly.base.pojo.Info;



@IocBean(name="infoSrv",fields = { "dao" })
public class InfoSrv  extends BaseSrv<Info> {
	

}

