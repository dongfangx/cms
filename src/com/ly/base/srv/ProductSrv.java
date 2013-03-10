package com.ly.base.srv;

import org.nutz.ioc.loader.annotation.IocBean;
import com.ly.comm.BaseSrv;
import com.ly.base.pojo.Product;



@IocBean(name="productSrv",fields = { "dao" })
public class ProductSrv  extends BaseSrv<Product> {
	

}

