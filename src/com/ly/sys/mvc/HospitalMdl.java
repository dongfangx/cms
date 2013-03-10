package com.ly.sys.mvc;

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

import com.ly.comm.PKID;
import com.ly.comm.Page;
import com.ly.sys.pojo.Hospital;
import com.ly.sys.srv.HospitalSrv;

@IocBean
@InjectName("hospitalMdl")
@At("/sys/hospital")
@Fail("json")
public class HospitalMdl {
	
	private static final Log log = Logs.getLog(HospitalMdl.class);

	@Inject
	private HospitalSrv hospitalSrv;

	@At
	@Ok("jsp:/page/sys/hospital_list.jsp")
	public void list(@Param("..") Page p, HttpServletRequest request) {
		int rows = hospitalSrv.cnt();
		p.setRecordCount(rows);
		p.setUrl(request.getRequestURI());
		request.setAttribute("hospitals", hospitalSrv.queryObjs(null, p));
		request.setAttribute("ps", p.getPageStr());
	}

	@At
	@Ok("jsp:/page/sys/hospital.jsp")
	public void add(HttpServletRequest request) {
		request.setAttribute("hospital", null);
	}

	@At
	@Ok("jsp:/page/sys/hospital.jsp")
	public void edit(@Param("hospitalid")String hospitalid,HttpServletRequest request,@Param("ac")int ac) {
		System.out.println(ac+"  ac...");
		if(hospitalid==null || hospitalid.equals(""))
		{
			request.setAttribute("hospital", null);
		}
		else
		{
			Hospital hospital  = hospitalSrv.queryObj(hospitalid);
			request.setAttribute("hospital", hospital);
		}
		request.setAttribute("ac", ac);
	}
	
	@At
	@Ok("redirect:/sys/hospital/list.do")
	public void save(@Param("..")Hospital hospital){
		if(hospital.getHospitalid()==null || hospital.getHospitalid().equals("")){
			hospital.setHospitalid(PKID.getId());
			hospital.setState(1L);
			this.hospitalSrv.insert(hospital);
		}else{
			this.hospitalSrv.update(hospital);
		}
	}
	
	@At
	@Ok("redirect:/sys/hospital/list.do")
	public void del(@Param("hospitalid")String hospitalid){
		Hospital hospital = new Hospital();
		hospital.setHospitalid(hospitalid);
		hospital.setState(3L);
		this.hospitalSrv.update(hospital);
	}
	public String getHospitalNo(String hospitalid)
	{
		Hospital hs=hospitalSrv.queryObj(hospitalid);
		String Hospitalno=hs.getHospitalno();
		return Hospitalno;
	}	
}
