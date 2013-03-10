package com.ly.base.mvc;

import javax.servlet.http.HttpServletRequest;

import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.ly.base.pojo.Codetype;
import com.ly.base.srv.CodetypeSrv;
import com.ly.comm.Page;


@IocBean
@InjectName("codetypeMdl")
@At("/base/codetype")
@Fail("json")
public class CodetypeMdl {
	
	private static final Log log = Logs.getLog(CodetypeMdl.class);

	@Inject
	private CodetypeSrv codetypeSrv;

	@At
	@Ok("jsp:/page/base/codetype_list.jsp")
	public void list(@Param("..") Page p, HttpServletRequest request) {
		int rows = codetypeSrv.cnt();
		p.setRecordCount(rows);
		p.setUrl(request.getRequestURI());
		request.setAttribute("codetypes", codetypeSrv.queryObjs(null, p));
		request.setAttribute("ps", p.getPageStr());
	}

	@At
	@Ok("jsp:/page/base/codetype.jsp")
	public void add(HttpServletRequest request) {
		request.setAttribute("codetype", null);
		request.setAttribute("ac", 1);
	}

	@At
	@Ok("jsp:/page/base/codetype.jsp")
	public void edit(@Param("codetypeid")Long codetypeid,@Param("ac")int ac,HttpServletRequest request) {
		if(codetypeid ==null || codetypeid.equals(""))
		{
			request.setAttribute("codetype", null);
		}
		else
		{
			Codetype codetype  = codetypeSrv.queryObj(codetypeid);
			request.setAttribute("codetype", codetype);
		}
		request.setAttribute("ac", ac);
	}
	
	@At
	@Ok("redirect:/base/codetype/list.do")
	public void save(@Param("..")Codetype codetype,@Param("ac")int ac){
		log.info("ac   "+ac+"  id "+codetype.getCodetypeid());
		if(ac == 2){
			this.codetypeSrv.insert(codetype);
		}else{
			this.codetypeSrv.update(codetype);
		}
	}
	
	@At
	@Ok("redirect:/base/codetype/list.do")
	public void del(@Param("codetypeid")Long codetypeid){
		Codetype codetype = new Codetype();
		codetype.setCodetypeid(codetypeid);
		codetype.setState(3L);
		this.codetypeSrv.update(codetype);
	}
}

