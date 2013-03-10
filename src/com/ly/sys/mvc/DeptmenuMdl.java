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
import com.ly.sys.pojo.Deptmenu;
import com.ly.sys.pojo.Hospitalmenu;
import com.ly.sys.pojo.Menu;
import com.ly.sys.srv.DeptSrv;
import com.ly.sys.srv.DeptmenuSrv;
import com.ly.sys.srv.MenuSrv;


@IocBean
@InjectName("deptmenuMdl")
@At("/sys/deptmenu")
@Fail("json")
public class DeptmenuMdl {
	
	private static final Log log = Logs.getLog(DeptmenuMdl.class);

	@Inject
	private DeptmenuSrv deptmenuSrv;
	
	@Inject
	private DeptSrv deptSrv;
	
	@Inject
	private MenuSrv menuSrv;
	
	private String getDeptTree(){
		return ObjTree.getDeptTree(deptSrv.queryObjs(Cnd.wrap("state=1 order by deptno")));
	}

	@At
	@Ok("jsp:/page/sys/deptmenu_list.jsp")
	public void list(HttpServletRequest request) {
		request.setAttribute("dept_tree", getDeptTree());
	}


	@At
	@Ok("jsp:/page/sys/deptmenu.jsp")
	public void edit(@Param("deptid")String deptid,HttpServletRequest request) {
		List<Menu> menus = menuSrv.queryMenuByDID(Cnd.where("deptid","=",deptid));
		String menu_tree = ObjTree.getMenuChkTree(menus);
		request.setAttribute("menu_tree",menu_tree);
		request.setAttribute("deptid",deptid);
		
	}
	
	@At
	@Ok("jsp:/page/sys/deptmenu.jsp")
	public void save(@Param("ids")String ids,@Param("deptid")String deptid){
		deptmenuSrv.dels(Cnd.where("deptid","=",deptid));
		String[] temp = ids.split(",");
		Deptmenu dm = new Deptmenu();
		
		dm.setDeptid(deptid);
		for (String s : temp) {
			dm.setMenuid(s);
			dm.setDeptmenuid(PKID.getId());
			deptmenuSrv.insert(dm);
		}
	}
}

