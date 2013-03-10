package com.ly.sys.mvc;

import java.util.List;

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

import com.ly.comm.ObjTree;
import com.ly.comm.PKID;
import com.ly.sys.pojo.Employeemenu;
import com.ly.sys.pojo.Menu;
import com.ly.sys.srv.EmployeemenuSrv;
import com.ly.sys.srv.MenuSrv;


@IocBean
@InjectName("employeemenuMdl")
@At("/sys/employeemenu")
@Fail("json")
public class EmployeemenuMdl {
	
	private static final Log log = Logs.getLog(EmployeemenuMdl.class);

	@Inject
	private EmployeemenuSrv employeemenuSrv;
	@Inject
	private MenuSrv menuSrv;



	@At
	@Ok("jsp:/page/sys/employeemenu.jsp")
	public void edit(@Param("employeeid")String employeeid,HttpServletRequest request) {
		List<Menu> menus = menuSrv.queryMenuByEID(Cnd.where("employeeid","=",employeeid));
		String menu_tree = ObjTree.getMenuChkTree(menus);
		request.setAttribute("menu_tree", menu_tree);
		request.setAttribute("employeeid", employeeid);
	}
	
	@At
	@Ok("redirect:/sys/employeemenu/edit.do?employeeid=${p.employeeid}")
	public void save(@Param("ids")String ids,@Param("employeeid")String employeeid,HttpServletRequest request){
		employeemenuSrv.dels(Cnd.where("employeeid","=",employeeid));
		String[] temp = ids.split(",");
		Employeemenu hm = new Employeemenu();
		hm.setEmployeeid(employeeid);
		for (String s : temp) {
			hm.setMenuid(s);
			hm.setEmployeemenuid(PKID.getId());
			employeemenuSrv.insert(hm);
		}
		request.setAttribute("employeeid", employeeid);
	}
	
}

