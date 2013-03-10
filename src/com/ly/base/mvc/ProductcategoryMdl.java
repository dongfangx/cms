package com.ly.base.mvc;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

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

import com.ly.comm.BaseMdl;
import com.ly.comm.ObjTree;
import com.ly.comm.PKID;
import com.ly.comm.Page;
import com.ly.comm.CBData;

import com.ly.sys.pojo.Employee;
import com.ly.base.pojo.Productcategory;
import com.ly.base.srv.ProductcategorySrv;


@IocBean
@InjectName("productcategoryMdl")
@At("/base/productcategory")
@Fail("json")
public class ProductcategoryMdl extends BaseMdl{
	
	private static final Log log = Logs.getLog(ProductcategoryMdl.class);

	@Inject
	private ProductcategorySrv productcategorySrv;

	@At
	@Ok("jsp:/page/base/productcategory_list.jsp")
	public void list(@Param("..") Page p, HttpServletRequest request) {
		int rows = productcategorySrv.cnt();
		p.setRecordCount(rows);
		p.setUrl(request.getRequestURI());
		request.setAttribute("productcategorys", productcategorySrv.queryObjs(null, p));
		request.setAttribute("ps", p.getPageStr());
	}


	@At
	@Ok("jsp:/page/base/productcategory.jsp")
	public void edit(@Param("productcategoryid")String productcategoryid,HttpServletRequest request) {
		CBData cb = CBData.getInstance();
		if(productcategoryid == null || productcategoryid.equals("")){
			request.setAttribute("productcategory", null);
		}else{
			Productcategory productcategory  = productcategorySrv.queryObj(productcategoryid);
			request.setAttribute("productcategory", productcategory);
		}
	}
	
	@At
	@Ok("redirect:/base/productcategory/list.do")
	public void save(@Param("..")Productcategory productcategory ,HttpServletRequest request){
		if(productcategory.getProductcategoryid()==null || productcategory.getProductcategoryid().equals("")){
			Employee e = super.getEmployee(request);
			productcategory.setProductcategoryid(PKID.getId());
			productcategory.setAdddate(new Date());
			productcategory.setState(1);
			this.productcategorySrv.insert(productcategory);
		}else{
			this.productcategorySrv.update(productcategory);
		}
	}
	
	@At
	@Ok("redirect:/base/productcategory/list.do")
	public void del(@Param("productcategoryid")String productcategoryid){
		Productcategory productcategory = new Productcategory();
		productcategory.setProductcategoryid(productcategoryid);
		productcategory.setState(3);
		this.productcategorySrv.update(productcategory);
	}
}

