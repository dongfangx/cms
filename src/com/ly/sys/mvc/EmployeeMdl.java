package com.ly.sys.mvc;

import java.util.List;
import java.util.Map;

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

import com.ly.comm.CommMdl;
import com.ly.comm.ObjTree;
import com.ly.comm.PKID;
import com.ly.comm.Page;
import com.ly.comm.ParseObj;
import com.ly.sys.pojo.Dept;
import com.ly.sys.pojo.Employee;
import com.ly.util.EnDeCode;


@IocBean
@InjectName("employeeMdl")
@At("/sys/employee")
@Fail("json")
public class EmployeeMdl extends CommMdl{
	
	private static final Log log = Logs.get();
	
	@Inject
	private Dao dao;
	
	private String getDeptTree(){
//		return ObjTree.getDeptTree(dao.query(Dept.class, Cnd.wrap("state=1 order by deptno")));
		return ObjTree.getDeptTree(dao.query(Dept.class, Cnd.wrap(" state=1 ")));
	}

	@At
	@Ok("jsp:/page/sys/employee_list.jsp")
	public void list(@Param("..") Page p,HttpServletRequest request,@Param("..")Employee employee) {

		log.debug("asdfasdf debug");
		log.info("asdf info");
		
		log.debug(p.getPageNum());
		log.debug(p.getNumPerPage());
		employee.setState(1L);
		Cnd c = new ParseObj(employee).getCnd();
		List<Employee> employee_list = dao.query(Employee.class, c, p);
		p.setRecordCount(dao.count(Employee.class, c));
		request.setAttribute("employee", employee);
		request.setAttribute("employee_list", employee_list);
		request.setAttribute("page", p);
	}

	@At
	@Ok("jsp:/page/sys/employee.jsp")
	public void edit(@Param("employeeid")String employeeid,HttpServletRequest request) {
		log.debug(employeeid);
//		request.setAttribute("dept_tree", getDeptTree());
		if(employeeid == null || employeeid.equals("")){
			request.setAttribute("employee", null);
		}else{
			Employee employee  = dao.fetch(Employee.class, employeeid);
			request.setAttribute("employee", employee);
		}
	}
	
	@At
	@Ok("json")
	public Map<String,String> save(@Param("..")Employee employee){
        Object rtnObj;
		if(employee.getEmployeeid()==null || employee.getEmployeeid().equals("")){
			employee.setEmployeeid(PKID.getId());
			EnDeCode en = new EnDeCode();
			employee.setPassword(en.getMD5Str("user123"));
			rtnObj = dao.insert(employee);
		}else{
			rtnObj = dao.update(employee);
		}
		return super.tabMap((rtnObj != null)?"200":"300", "employee","closeCurrent");
	}
	
	@At
	@Ok("json")
	public Map<String, String> del(@Param("employeeid")String employeeid){
		Object rtnObj;
		Employee employee  = dao.fetch(Employee.class, employeeid);
		employee.setState(3L);
		rtnObj =  dao.update(employee);
		return super.tabMap((rtnObj != null)?"200":"300", "employee","");
	}
	
}

