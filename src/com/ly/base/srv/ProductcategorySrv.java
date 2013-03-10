package com.ly.base.srv;

import org.nutz.ioc.loader.annotation.IocBean;
import com.ly.comm.BaseSrv;
import com.ly.base.pojo.Productcategory;



@IocBean(name="productcategorySrv",fields = { "dao" })
public class ProductcategorySrv  extends BaseSrv<Productcategory> {
	

}

