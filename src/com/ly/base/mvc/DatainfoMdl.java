package com.ly.base.mvc;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.nutz.dao.Cnd;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Files;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.AdaptBy;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.upload.UploadAdaptor;

import com.ly.base.pojo.Datainfo;
import com.ly.base.pojo.Solutions;
import com.ly.base.srv.DataclassSrv;
import com.ly.base.srv.DatainfoSrv;
import com.ly.comm.BaseMdl;
import com.ly.comm.CBData;
import com.ly.comm.PKID;
import com.ly.comm.Page;
import com.ly.sys.pojo.Employee;


@IocBean
@InjectName("datainfoMdl")
@At("/base/datainfo")
@Fail("json")
public class DatainfoMdl extends BaseMdl{
	
	private static final Log log = Logs.getLog(DatainfoMdl.class);

	@Inject
	private DatainfoSrv datainfoSrv;
	
	@Inject
	private DataclassSrv dataclassSrv;

	@At
	@Ok("jsp:/page/base/datainfo_list.jsp")
	public void list(@Param("..") Page p, HttpServletRequest request) {
		int rows = datainfoSrv.cnt(Cnd.where("state","=",1));
		p.setRecordCount(rows);
		p.setUrl(request.getRequestURI());
		request.setAttribute("datainfos", datainfoSrv.queryObjs(Cnd.where("state","=",1), p));
		request.setAttribute("ps", p.getPageStr());
	}


	@At
	@Ok("jsp:/page/base/datainfo.jsp")
	public void edit(@Param("datainfoid")String datainfoid,HttpServletRequest request) {
		CBData cb = CBData.getInstance();
		request.setAttribute("dataclasses", dataclassSrv.queryObjs(Cnd.where("state","=",1)));
		if(datainfoid == null || datainfoid.equals("")){
			request.setAttribute("datainfo", null);
		}else{
			Datainfo datainfo  = datainfoSrv.queryObj(datainfoid);
			request.setAttribute("datainfo", datainfo);
		}
	}
	
	@At
	@Ok("redirect:/base/datainfo/list.do")
	@AdaptBy(type = UploadAdaptor.class, args = { "ioc:uploadFile" })
	public void save(@Param("..")Datainfo datainfo,
			@Param("img") File img,
			HttpServletRequest request,
			ServletContext context)
	{
		
		String imgurl="";
		if (img != null) {
			//File f1 = minimg.getFile(); 
			
			String ext = Files.getSuffixName(img);
			imgurl = "/uploadimg/" + PKID.getId() + "." + ext;
			File photo = new File(context.getRealPath("/") + imgurl);
			log.debug(imgurl);
			try {
				Files.move(img, photo);
			} catch (IOException e) {
				imgurl = "";
			}
		}
		if (imgurl.equals("")) {
			datainfo.setDataurl(null);
		} else {
			datainfo.setDataurl(imgurl);
		}
		
		if(datainfo.getDatainfoid()==null || datainfo.getDatainfoid().equals("")){
			Employee e = super.getEmployee(request);
			datainfo.setDatainfoid(PKID.getId());
			datainfo.setAdddate(new Date());
			datainfo.setState(1);
			this.datainfoSrv.insert(datainfo);
		}else{
			this.datainfoSrv.update(datainfo);
		}
	}
	
	@At
	@Ok("redirect:/base/datainfo/list.do")
	public void del(@Param("datainfoid")String datainfoid){
		Datainfo datainfo = new Datainfo();
		datainfo.setDatainfoid(datainfoid);
		datainfo.setState(3);
		this.datainfoSrv.update(datainfo);
	}
}

