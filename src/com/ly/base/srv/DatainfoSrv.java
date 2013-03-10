package com.ly.base.srv;

import java.util.List;

import org.nutz.dao.Cnd;
import org.nutz.ioc.loader.annotation.IocBean;

import com.ly.base.pojo.Datainfo;
import com.ly.comm.BaseSrv;



@IocBean(name="datainfoSrv",fields = { "dao" })
public class DatainfoSrv  extends BaseSrv<Datainfo> {
	
	public List<Datainfo> queryMenuByEID(Cnd c) {
		String sqls ="select m.menuid,m.menuno,m.menuname,m.url,m.pmenuid,m.pmenuname,m.memo,m.menutype,m.state,hm.employeeid as OID" +
				" from menu m left join (select * from employeemenu $condition) hm on m.menuid=hm.menuid order by menuno";
		return queryObjs(sqls, c);
	}

}

