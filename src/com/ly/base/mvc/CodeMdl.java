package com.ly.base.mvc;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.nutz.dao.Cnd;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import com.ly.base.pojo.Code;
import com.ly.base.srv.CodeSrv;
import com.ly.base.srv.CodetypeSrv;
import com.ly.comm.BaseMdl;
import com.ly.comm.ObjTree;
import com.ly.comm.PKID;


@IocBean
@InjectName("codeMdl")
@At("/base/code")
@Fail("json")
public class CodeMdl extends BaseMdl{
	
	//private static final Log log = Logs.getLog(CodeMdl.class);

	@Inject
	private CodeSrv codeSrv;
	@Inject
	private CodetypeSrv codetypeSrv;
	

	@At
	@Ok("jsp:/page/base/code_list.jsp")
	public void list(HttpServletRequest request) {
		String codetypetree = ObjTree.getCodetypeTree(codetypeSrv.queryObjs(Cnd.where("state", "=", 1)));
		request.setAttribute("codetype_tree", codetypetree);
	}

	@At
	@Ok("jsp:/page/base/code_list2.jsp")
	public void list2(@Param("id")Long id,HttpServletRequest request) {
		List<Code> codes = codeSrv.queryObjs(Cnd.where("codetypeid", "=", id));
		request.setAttribute("codes", codes);
		request.setAttribute("id", id);
	}

	@At
	@Ok("jsp:/page/base/code.jsp")
	public void add(@Param("id")Long id,HttpServletRequest request) {
		request.setAttribute("code", null);
		request.setAttribute("id", id);
	}

	@At
	@Ok("jsp:/page/base/code.jsp")
	public void edit(@Param("codeid")String codeid,HttpServletRequest request) {
		Code code  = codeSrv.queryObj(codeid);
		request.setAttribute("code", code);
		request.setAttribute("id", code.getCodetypeid());
	}
	
	@At
	@Ok("jsp:/page/ifr.jsp")
	public void save(@Param("..")Code code,@Param("id")Long id,HttpServletRequest request){
		if(code.getCodeid().equals("")){
			code.setCodetypeid(id);
			code.setCodeid(PKID.getId());
			this.codeSrv.insert(code);
		}else{
			this.codeSrv.update(code);
		}
	}
	
	@At
	@Ok("redirect:/base/code/list.do")
	public void del(@Param("codeid")String codeid){
		Code code = new Code();
		code.setState(1L);
		this.codeSrv.update(code);
	}
}
