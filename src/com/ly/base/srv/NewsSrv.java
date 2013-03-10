package com.ly.base.srv;

import org.nutz.ioc.loader.annotation.IocBean;
import com.ly.comm.BaseSrv;
import com.ly.base.pojo.News;



@IocBean(name="newsSrv",fields = { "dao" })
public class NewsSrv  extends BaseSrv<News> {
	

}

