package com.ly.base.mvc;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

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

import com.ly.base.pojo.Solutions;
import com.ly.base.srv.SolutionsSrv;
import com.ly.comm.BaseMdl;
import com.ly.comm.CBData;
import com.ly.comm.PKID;
import com.ly.comm.Page;
import com.ly.sys.pojo.Employee;


@IocBean
@InjectName("solutionsMdl")
@At("/base/solutions")
@Fail("json")
public class SolutionsMdl extends BaseMdl{
	
	private static final Log log = Logs.getLog(SolutionsMdl.class);

	@Inject
	private SolutionsSrv solutionsSrv;

	@At
	@Ok("jsp:/page/base/solutions_list.jsp")
	public void list(@Param("..") Page p, HttpServletRequest request) {
		int rows = solutionsSrv.cnt();
		p.setRecordCount(rows);
		p.setUrl(request.getRequestURI());
		request.setAttribute("solutionss", solutionsSrv.queryObjs(null, p));
		request.setAttribute("ps", p.getPageStr());
	}


	@At
	@Ok("jsp:/page/base/solutions.jsp")
	public void edit(@Param("solutionsid")String solutionsid,HttpServletRequest request) {
		CBData cb = CBData.getInstance();
		if(solutionsid == null || solutionsid.equals("")){
			request.setAttribute("solutions", null);
		}else{
			Solutions solutions  = solutionsSrv.queryObj(solutionsid);
			request.setAttribute("solutions", solutions);
		}
	}
	
	@At
	@Ok("redirect:/base/solutions/list.do")
	@AdaptBy(type = UploadAdaptor.class, args = { "ioc:uploadFile" })
	public void save(@Param("..")Solutions solutions,
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
			solutions.setImg(null);
		} else {
			solutions.setImg(imgurl);
		}
		
		if(solutions.getSolutionsid()==null || solutions.getSolutionsid().equals("")){
			Employee e = super.getEmployee(request);
			solutions.setSolutionsid(PKID.getId());
			solutions.setAdddate(new Date());
			solutions.setState(1);
			this.solutionsSrv.insert(solutions);
		}else{
			this.solutionsSrv.update(solutions);
		}
	}
	
	@At
	@Ok("redirect:/base/solutions/list.do")
	public void del(@Param("solutionsid")String solutionsid){
		Solutions solutions = new Solutions();
		solutions.setSolutionsid(solutionsid);
		solutions.setState(3);
		this.solutionsSrv.update(solutions);
	}
}

