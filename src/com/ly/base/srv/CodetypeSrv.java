package com.ly.base.srv;

import org.nutz.ioc.loader.annotation.IocBean;
import com.ly.comm.BaseSrv;
import com.ly.base.pojo.Codetype;



@IocBean(name="codetypeSrv",fields = { "dao" })
public class CodetypeSrv  extends BaseSrv<Codetype> {
	

}

