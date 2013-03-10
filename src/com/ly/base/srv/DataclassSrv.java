package com.ly.base.srv;

import org.nutz.ioc.loader.annotation.IocBean;
import com.ly.comm.BaseSrv;
import com.ly.base.pojo.Dataclass;



@IocBean(name="dataclassSrv",fields = { "dao" })
public class DataclassSrv  extends BaseSrv<Dataclass> {
	

}

