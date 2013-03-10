package com.ly.base.srv;

import org.nutz.ioc.loader.annotation.IocBean;
import com.ly.comm.BaseSrv;
import com.ly.base.pojo.Code;



@IocBean(name="codeSrv",fields = { "dao" })
public class CodeSrv  extends BaseSrv<Code> {
	

}

