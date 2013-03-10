package com.ly.web;

import javax.servlet.http.HttpServletRequest;

import org.nutz.dao.Cnd;
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
import com.ly.base.pojo.Product;
import com.ly.base.pojo.Solutions;
import com.ly.base.srv.DataclassSrv;
import com.ly.base.srv.DatainfoSrv;
import com.ly.base.srv.InfoSrv;
import com.ly.base.srv.NavmenuSrv;
import com.ly.base.srv.NewsSrv;
import com.ly.base.srv.ProductSrv;
import com.ly.base.srv.ProductcategorySrv;
import com.ly.base.srv.SolutionsSrv;
import com.ly.comm.BaseMdl;
import com.ly.comm.Page;

@IocBean
@InjectName("index")
@At("/web/index")
@Fail("json")
public class Index  extends BaseMdl{
	
	private static final Log log = Logs.getLog(Index.class);

	@Inject
	private NavmenuSrv navmenuSrv;
	
	@Inject
	private NewsSrv newsSrv;
	
	@Inject
	private InfoSrv infoSrv;
	
	@Inject
	private ProductcategorySrv productcategorySrv;
	
	@Inject
	private ProductSrv productSrv;
	
	@Inject
	private DatainfoSrv datainfoSrv;
	
	@Inject
	private DataclassSrv dataclassSrv;
	
	@Inject
	private SolutionsSrv solutionsSrv;
	
	
	//------------------------------ Index  -------------------------------------------
	@At
	@Ok("jsp:/web/index.jsp")
	public void index(HttpServletRequest request) {
		
		//navmenu
		request.setAttribute("nmid", "201108152215489452");
		request.setAttribute("navmenus", navmenuSrv.queryObjs(Cnd.where("state","=",1).asc("sort")));
		//news
		Page p = new Page();
		p.setPageSize(8);
		request.setAttribute("newies", newsSrv.queryObjs(Cnd.where("state","=",1).desc("adddate"), p));
		
		//products
		p.setPageSize(6);
		request.setAttribute("products", productSrv.queryObjs(Cnd.where("state","=",1).desc("adddate"), p));
	}

	//------------------------------ About  -------------------------------------------
	@At
	@Ok("jsp:/web/about.jsp")
	public void about(@Param("infoid")String infoid,HttpServletRequest request) {
		//navmenu
		request.setAttribute("nmid", "201108152216440023");
		request.setAttribute("navmenus", navmenuSrv.queryObjs(Cnd.where("state","=",1).asc("sort")));
		
		//infos
		if (infoid == null || infoid.equals("")) {
			infoid = "201108252114172831";
		}
		request.setAttribute("infos", infoSrv.queryObjs(Cnd.where("state","=",1).asc("ordernum")));
		request.setAttribute("info", infoSrv.queryObj(Cnd.where("infoid","=",infoid)));
	}
	
	//------------------------------News -------------------------------------------
	@At
	@Ok("jsp:/web/news_list.jsp")
	public void newsList(@Param("..") Page p, HttpServletRequest request) {
		//navmenu
		request.setAttribute("nmid", "201108281631231821");
		request.setAttribute("navmenus", navmenuSrv.queryObjs(Cnd.where("state","=",1).asc("sort")));
		
		p.setUrl(request.getRequestURI());
		p.setPageSize(20);
		int rows = productSrv.cnt();
		p.setRecordCount(rows);
		request.setAttribute("newses", newsSrv.queryObjs(Cnd.where("state","=",1).desc("adddate"), p));
		request.setAttribute("ps", p.getPageStr());
		
		// products
		p.setPageSize(6);
		request.setAttribute("products", productSrv.queryObjs(Cnd.where("state", "=", 1).desc("adddate"), p));
	}
	
	@At
	@Ok("jsp:/web/news.jsp")
	public void news(@Param("newsid")String newsid,HttpServletRequest request) {
		//navmenu
		request.setAttribute("nmid", "201108281631231821");
		request.setAttribute("navmenus", navmenuSrv.queryObjs(Cnd.where("state","=",1).asc("sort")));
		
		request.setAttribute("news", newsSrv.queryObj(newsid));
	}	

	
	//------------------------------product -------------------------------------------
	@At
	@Ok("jsp:/web/product_list.jsp")
	public void productList(@Param("pcid")String pcid,@Param("..") Page p, HttpServletRequest request) {
		//navmenu
		request.setAttribute("nmid", "201108152217466565");
		request.setAttribute("navmenus", navmenuSrv.queryObjs(Cnd.where("state","=",1).asc("sort")));
		
		//category
		request.setAttribute("pcs", productcategorySrv.queryObjs(Cnd.where("state","=",1)));
		//products
		p.setUrl(request.getRequestURI());
		p.setPageSize(8);
		if (pcid == null || pcid.equals("")) {
			int rows = productSrv.cnt();
			p.setRecordCount(rows);
			request.setAttribute("products", productSrv.queryObjs(Cnd.where("state","=",1).desc("adddate"), p));
			request.setAttribute("ps", p.getPageStr());
		}else{
			int rows = productSrv.queryObjs(Cnd.where("productcategoryid","=",pcid)).size();
			p.setRecordCount(rows);
			request.setAttribute("products", productSrv.queryObjs(Cnd.where("state","=",1).and("productcategoryid","=",pcid).desc("adddate"), p));
			request.setAttribute("ps", p.getPageStr());
		}
	}
	
	@At
	@Ok("jsp:/web/product.jsp")
	public void product(@Param("productid")String pid, HttpServletRequest request) {
		//navmenu
		request.setAttribute("nmid", "201108152217466565");
		request.setAttribute("navmenus", navmenuSrv.queryObjs(Cnd.where("state","=",1).asc("sort")));
		
		request.setAttribute("pcs", productcategorySrv.queryObjs(Cnd.where("state","=",1)));
		Product product  = productSrv.queryObj(pid);
		request.setAttribute("product", product);
	}
	

	
	//------------------------------Solutions -------------------------------------------
	@At
	@Ok("jsp:/web/solutions_list.jsp")
	public void solutionsList(@Param("..") Page p, HttpServletRequest request) {
		//navmenu
		request.setAttribute("nmid", "201108152218020386");
		request.setAttribute("navmenus", navmenuSrv.queryObjs(Cnd.where("state","=",1).asc("sort")));
		
		p.setUrl(request.getRequestURI());
		p.setPageSize(8);
		int rows = productSrv.cnt();
		p.setRecordCount(rows);
		request.setAttribute("solutionses", solutionsSrv.queryObjs(Cnd.where("state","=",1).desc("adddate"), p));
		request.setAttribute("ps", p.getPageStr());
		
		// products
		p.setPageSize(6);
		request.setAttribute("products", productSrv.queryObjs(Cnd.where("state", "=", 1).desc("adddate"), p));
	}
	
	@At
	@Ok("jsp:/web/solutions.jsp")
	public void solutions(@Param("solutionsid")String sid,HttpServletRequest request) {
		//navmenu
		request.setAttribute("nmid", "201108152218273247");
		request.setAttribute("navmenus", navmenuSrv.queryObjs(Cnd.where("state","=",1).asc("sort")));
		
		Solutions solutions  = solutionsSrv.queryObj(sid);
		request.setAttribute("solutions", solutions);
	}	
	
	//------------------------------Datainfo -------------------------------------------
	@At
	@Ok("jsp:/web/datainfo_list.jsp")
	public void datainfo(@Param("dcid")String dcid,@Param("..") Page p, HttpServletRequest request) {
		//navmenu
		request.setAttribute("nmid", "201108152218273247");
		request.setAttribute("navmenus", navmenuSrv.queryObjs(Cnd.where("state","=",1).asc("sort")));
		
			p.setUrl(request.getRequestURI());
			p.setPageSize(20);
			
			if (dcid == null || dcid.equals("")) {
				int rows = datainfoSrv.cnt();
				p.setRecordCount(rows);
				request.setAttribute("datainfos", datainfoSrv.queryObjs(Cnd.where("state","=",1).desc("adddate"), p));
				request.setAttribute("ps", p.getPageStr());
			}else{
				int rows = datainfoSrv.cnt(Cnd.where("dataclassid","=",dcid));
				p.setRecordCount(rows);
				request.setAttribute("datainfos", datainfoSrv.queryObjs(Cnd.where("dataclassid","=",dcid).and("state","=",1).desc("adddate"), p));
				request.setAttribute("ps", p.getPageStr());
			}
			request.setAttribute("dataclasses", dataclassSrv.queryObjs(Cnd.where("state","=",1)));
	}
	
	//------------------------------linkme -------------------------------------------
	@At
	@Ok("jsp:/web/linkme.jsp")
	public void linkme(HttpServletRequest request) {
		//navmenu
		request.setAttribute("nmid", "201108152218432298");
		request.setAttribute("navmenus", navmenuSrv.queryObjs(Cnd.where("state","=",1).asc("sort")));
		
		Info info = infoSrv.queryObj(Cnd.where("infono", "=", "100"));
		request.setAttribute("linkme", info.getContent());
		// products
		Page p = new Page();
		p.setPageSize(6);
		request.setAttribute("products", productSrv.queryObjs(
				Cnd.where("state", "=", 1).desc("adddate"), p));
	}
	
}
