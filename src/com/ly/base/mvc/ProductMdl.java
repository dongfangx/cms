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
import org.nutz.mvc.upload.TempFile;
import org.nutz.mvc.upload.UploadAdaptor;

import com.ly.base.pojo.Product;
import com.ly.base.srv.ProductSrv;
import com.ly.base.srv.ProductcategorySrv;
import com.ly.comm.BaseMdl;
import com.ly.comm.CBData;
import com.ly.comm.PKID;
import com.ly.comm.Page;
import com.ly.sys.pojo.Employee;


@IocBean
@InjectName("productMdl")
@At("/base/product")
@Fail("json")
public class ProductMdl extends BaseMdl{
	
	private static final Log log = Logs.getLog(ProductMdl.class);

	@Inject
	private ProductSrv productSrv;
	@Inject
	private ProductcategorySrv productcategorySrv;

	@At
	@Ok("jsp:/page/base/product_list.jsp")
	public void list(@Param("..") Page p, HttpServletRequest request) {
		int rows = productSrv.cnt();
		p.setRecordCount(rows);
		p.setUrl(request.getRequestURI());
		request.setAttribute("products", productSrv.queryObjs(null, p));
		request.setAttribute("ps", p.getPageStr());
	}


	@At
	@Ok("jsp:/page/base/product.jsp")
	public void edit(@Param("productid")String productid,HttpServletRequest request) {
		//CBData cb = CBData.getInstance();
		request.setAttribute("pcs", productcategorySrv.queryObjs(Cnd.where("state","=",1).asc("ordernum")));
		if(productid == null || productid.equals("")){
			request.setAttribute("product", null);
		}else{
			Product product  = productSrv.queryObj(productid);
			request.setAttribute("product", product);
		}
	}
	
	@At
	@Ok("redirect:/base/product/list.do")
	@AdaptBy(type = UploadAdaptor.class, args = { "ioc:uploadFile" })
	public void save(@Param("..")Product product ,
			@Param("minimg") File minimg,
			@Param("maximg") File maximg,
			HttpServletRequest request,
			ServletContext context)
	{
		String minurl="",maxurl="";
		if (minimg != null) {
			//File f1 = minimg.getFile(); 
			
			String ext = Files.getSuffixName(minimg);
			minurl = "/uploadimg/" + PKID.getId() + "." + ext;
			File photo = new File(context.getRealPath("/") + minurl);
			log.debug(minurl);
			try {
				Files.move(minimg, photo);
			} catch (IOException e) {
				minurl = "";
			}
		}
		
		if (maximg != null) {
			//File f1 = maximg.getFile(); 
			
			String ext = Files.getSuffixName(maximg);
			maxurl = "/uploadimg/" + PKID.getId() + "." + ext;
			log.debug(maxurl);
			File photo = new File(context.getRealPath("/") + maxurl);
			try {
				Files.move(maximg, photo);
			} catch (IOException e) {
				maxurl = "";
			}
		}
		
		if (minurl.equals("")) {
			product.setMinimg(null);
		} else {
			product.setMinimg(minurl);
		}
		
		if (maxurl.equals("")) {
			product.setMaximg(null);
		} else {
			product.setMaximg(maxurl);
		}
		
		if(product.getProductid()==null || product.getProductid().equals(""))
		{
			product.setProductid(PKID.getId());
			product.setAdddate(new Date());
			product.setState(1);
			this.productSrv.insert(product);
		}else{
			this.productSrv.update(product);
		}
	}
	
	@At
	@Ok("redirect:/base/product/list.do")
	public void del(@Param("productid")String productid){
		Product product = new Product();
		product.setProductid(productid);
		product.setState(3);
		this.productSrv.update(product);
	}
}

