package com.ly.base.mvc;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.ly.base.pojo.Navmenu;
import com.ly.base.srv.NavmenuSrv;
import com.ly.comm.CommMdl;
import com.ly.comm.PKID;
import com.ly.comm.Page;
import com.ly.comm.ParseObj;


@IocBean
@InjectName("navmenuMdl")
@At("/base/navmenu")
@Fail("json")
public class NavmenuMdl extends CommMdl{
	
	private static final Log log = Logs.getLog(NavmenuMdl.class);

	@Inject
	private Dao dao;
	
	@Inject
	private NavmenuSrv navmenuSrv;

	@At
	@Ok("jsp:/page/base/navmenu_list.jsp")
	public void list(@Param("..") Page p,HttpServletRequest request,@Param("..")Navmenu navmenu) {
		navmenu.setState(1);
		Cnd c = new ParseObj(navmenu).getCnd();
		List<Navmenu> navmenu_list = dao.query(Navmenu.class, c, p);
		p.setRecordCount(dao.count(Navmenu.class, c));
		request.setAttribute("navmenu", navmenu);
		request.setAttribute("navmenu_list", navmenu_list);
		request.setAttribute("page", p);
	}

	@At
	@Ok("jsp:/page/base/navmenu.jsp")
	public void edit(@Param("navmenuid")String navmenuid,HttpServletRequest request) {
		if(navmenuid == null || navmenuid.equals("")){
			request.setAttribute("navmenu", null);
		}else{
			request.setAttribute("navmenu", dao.fetch(Navmenu.class, navmenuid));
		}
	}

	
	@At
	@Ok("json")
	public Map<String, String> save(@Param("..")Navmenu m){
		Object rtnObject;
		if(m.getNavmenuid().equals("")){
			m.setNavmenuid(PKID.getId());
			rtnObject =  this.dao.insert(m);
		}else{
			rtnObject =  this.dao.update(m);
		}
		return super.tabMap((rtnObject != null)?"200":"300", "navmenu","closeCurrent");

	}
	
	
	
	@At
	@Ok("json")
	public Map<String, String> del(@Param("navmenuid")String mid){
		Object rtnObj;
		Navmenu m  = dao.fetch(Navmenu.class, mid);
		m.setState(3);
		rtnObj =  dao.update(m);
		return super.tabMap((rtnObj != null)?"200":"300", "navmenu","");
	}}

