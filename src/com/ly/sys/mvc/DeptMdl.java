package com.ly.sys.mvc;

import javax.servlet.http.HttpServletRequest;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
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
import com.ly.sys.pojo.Dept;


@IocBean
@InjectName("deptMdl")
@At("/sys/dept")
@Fail("json")
public class DeptMdl {
	
	private static final Log log = Logs.get();

	@Inject
	private Dao dao;
	
	private String getDeptTree(){
//		return ObjTree.getDeptTree(deptSrv.queryObjs(Cnd.wrap("state=1 order by deptno")));
		return ObjTree.getDeptTree(dao.query(Dept.class, Cnd.wrap("state=1 order by deptno")));
	}

	@At
	@Ok("jsp:/page/sys/dept_list.jsp")
	public void list(HttpServletRequest request) {
//		log.info(getDeptTree());
		request.setAttribute("dept_tree", getDeptTree());
	}

	@At
	@Ok("jsp:/page/sys/dept.jsp")
	public void add(HttpServletRequest request) {
		request.setAttribute("dept_tree", getDeptTree());
		request.setAttribute("dept", null);
	}

	@At
	@Ok("jsp:/page/sys/dept.jsp")
	public void edit(@Param("deptid")String deptid,HttpServletRequest request) {
		log.info("edit");
		Dept d1 = dao.fetch(Dept.class,deptid );
		request.setAttribute("dept", d1);
		request.setAttribute("dept_tree", getDeptTree());
	}
	
	@At
	@Ok("jsp:/page/ifr.jsp")
	public void save(@Param("..")Dept dept){
		if(dept.getDeptid().equals("")){
			dept.setDeptid(PKID.getId());
			dao.insert(dept);
		}else{
			dao.update(dept);
		}
	}
	
	@At
	@Ok("redirect:/sys/dept/list.do")
	public void del(@Param("deptid")String deptid){
		Dept dept = new Dept();
		dept.setDeptid(deptid);
		dept.setState(3L);
		dao.update(dept);
	}
}

