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

import com.ly.base.pojo.News;
import com.ly.base.srv.NewsSrv;
import com.ly.comm.BaseMdl;
import com.ly.comm.CBData;
import com.ly.comm.PKID;
import com.ly.comm.Page;
import com.ly.sys.pojo.Employee;


@IocBean
@InjectName("newsMdl")
@At("/base/news")
@Fail("json")
public class NewsMdl extends BaseMdl{
	
	private static final Log log = Logs.getLog(NewsMdl.class);

	@Inject
	private NewsSrv newsSrv;

	@At
	@Ok("jsp:/page/base/news_list.jsp")
	public void list(@Param("..") Page p, HttpServletRequest request) {
		int rows = newsSrv.cnt();
		p.setRecordCount(rows);
		p.setUrl(request.getRequestURI());
		request.setAttribute("newss", newsSrv.queryObjs(null, p));
		request.setAttribute("ps", p.getPageStr());
	}


	@At
	@Ok("jsp:/page/base/news.jsp")
	public void edit(@Param("newsid")String newsid,HttpServletRequest request) {
		CBData cb = CBData.getInstance();
		if(newsid == null || newsid.equals("")){
			request.setAttribute("news", null);
		}else{
			News news  = newsSrv.queryObj(newsid);
			request.setAttribute("news", news);
		}
	}
	
	@At
	@Ok("redirect:/base/news/list.do")
	public void save(@Param("..")News news ,HttpServletRequest request){
		if(news.getNewsid()==null || news.getNewsid().equals("")){
			Employee e = super.getEmployee(request);
			news.setNewsid(PKID.getId());
			news.setAdddate(new Date());
			news.setState(1);
			this.newsSrv.insert(news);
		}else{
			this.newsSrv.update(news);
		}
	}
	
	@At
	@Ok("redirect:/base/news/list.do")
	public void del(@Param("newsid")String newsid){
		News news = new News();
		news.setNewsid(newsid);
		news.setState(3);
		this.newsSrv.update(news);
	}
}

