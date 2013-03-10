package com.ly.base.mvc;

import java.util.Date;

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

import com.ly.base.pojo.Info;
import com.ly.base.srv.InfoSrv;
import com.ly.comm.BaseMdl;
import com.ly.comm.PKID;
import com.ly.comm.Page;


@IocBean
@InjectName("infoMdl")
@At("/base/info")
@Fail("json")
public class InfoMdl extends BaseMdl{
	
	private static final Log log = Logs.getLog(InfoMdl.class);

	@Inject
	private InfoSrv infoSrv;

	@At
	@Ok("jsp:/page/base/info_list.jsp")
	public void list(@Param("..") Page p, HttpServletRequest request) {
		int rows = infoSrv.cnt();
		p.setRecordCount(rows);
		p.setUrl(request.getRequestURI());
		request.setAttribute("infos", infoSrv.queryObjs(null, p));
		request.setAttribute("ps", p.getPageStr());
	}


	@At
	@Ok("jsp:/page/base/info.jsp")
	public void edit(@Param("infoid")String infoid,HttpServletRequest request) {
//		CBData cb = CBData.getInstance();
		if(infoid == null || infoid.equals("")){
			request.setAttribute("info", null);
		}else{
			Info info  = infoSrv.queryObj(infoid);
			request.setAttribute("info", info);
		}
	}
	
	@At
	@Ok("redirect:/base/info/list.do")
	public void save(@Param("..")Info info ,HttpServletRequest request){
		log.debug("info save");
		if(info.getInfoid()==null || info.getInfoid().equals("")){
			//Employee e = super.getEmployee(request);
			info.setInfoid(PKID.getId());
			info.setAdddate(new Date());
			info.setState(1);
			this.infoSrv.insert(info);
		}else{
			this.infoSrv.update(info);
		}
	}
	
	@At
	@Ok("redirect:/base/info/list.do")
	public void del(@Param("infoid")String infoid){
		Info info = new Info();
		info.setInfoid(infoid);
		info.setState(3);
		this.infoSrv.update(info);
	}
}

