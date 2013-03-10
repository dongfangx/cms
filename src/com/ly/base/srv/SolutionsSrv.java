package com.ly.base.srv;

import org.nutz.ioc.loader.annotation.IocBean;
import com.ly.comm.BaseSrv;
import com.ly.base.pojo.Solutions;



@IocBean(name="solutionsSrv",fields = { "dao" })
public class SolutionsSrv  extends BaseSrv<Solutions> {
	

}

