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

import com.ly.base.pojo.Dataclass;
import com.ly.base.srv.DataclassSrv;
import com.ly.comm.BaseMdl;
import com.ly.comm.CBData;
import com.ly.comm.PKID;
import com.ly.comm.Page;
import com.ly.sys.pojo.Employee;


@IocBean
@InjectName("dataclassMdl")
@At("/base/dataclass")
@Fail("json")
public class DataclassMdl extends BaseMdl{
	
	private static final Log log = Logs.getLog(DataclassMdl.class);

	@Inject
	private DataclassSrv dataclassSrv;

	@At
	@Ok("jsp:/page/base/dataclass_list.jsp")
	public void list(@Param("..") Page p, HttpServletRequest request) {
		int rows = dataclassSrv.cnt();
		p.setRecordCount(rows);
		p.setUrl(request.getRequestURI());
		request.setAttribute("dataclasss", dataclassSrv.queryObjs(null, p));
		request.setAttribute("ps", p.getPageStr());
	}


	@At
	@Ok("jsp:/page/base/dataclass.jsp")
	public void edit(@Param("dataclassid")String dataclassid,HttpServletRequest request) {
		CBData cb = CBData.getInstance();
		if(dataclassid == null || dataclassid.equals("")){
			request.setAttribute("dataclass", null);
		}else{
			Dataclass dataclass  = dataclassSrv.queryObj(dataclassid);
			request.setAttribute("dataclass", dataclass);
		}
	}
	
	@At
	@Ok("redirect:/base/dataclass/list.do")
	public void save(@Param("..")Dataclass dataclass ,HttpServletRequest request){
		if(dataclass.getDataclassid()==null || dataclass.getDataclassid().equals("")){
			Employee e = super.getEmployee(request);
			dataclass.setDataclassid(PKID.getId());
			dataclass.setState(1);
			this.dataclassSrv.insert(dataclass);
		}else{
			this.dataclassSrv.update(dataclass);
		}
	}
	
	@At
	@Ok("redirect:/base/dataclass/list.do")
	public void del(@Param("dataclassid")String dataclassid){
		Dataclass dataclass = new Dataclass();
		dataclass.setDataclassid(dataclassid);
		dataclass.setState(3);
		this.dataclassSrv.update(dataclass);
	}
}

