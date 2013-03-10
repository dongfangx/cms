/**
 * 通用基础数据类
 * WEB加载时，加载所有的基础数据到内存中
 */
package com.ly.comm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.nutz.dao.Cnd;

import com.ly.base.pojo.Code;
import com.ly.base.srv.CodeSrv;

public final class CBData {
	
	static Logger log = Logger.getLogger(CBData.class.getName());
	

	private Map<Integer,String> zts = null;
	
	//商品类型--1
	private List<Code> list_splx = null;
	
	//香型--2
	private List<Code> list_xx = null;

	//价格区间--3
	private List<Code> list_jgqj = null;
	
	//销售类型-6
	private List<Code> list_xslx = null;
	
	//产地-10
	private List<Code> list_cd = null;
	//销售类型-9
	private List<Code> list_ds = null;

	/*
	public List<Wt> getZywts() {
		return zywts;
	}

	public void setZywts(List<Wt> zywts) {
		this.zywts = zywts;
	}
	*/



	private static CBData cbData = new CBData();
	
	private CBData(){}
	
	public static CBData getInstance(){
		return cbData;
	}
	
	public List<Code> getList_cd() {
		return list_cd;
	}

	public void setList_cd(List<Code> listCd) {
		list_cd = listCd;
	}

	public void init(){
		CodeSrv codeSrv = (CodeSrv)AppContext.getBean(CodeSrv.class);
		//WtlxSrv wtlxSrv = (WtlxSrv)AppContext.getBean(WtlxSrv.class);
		//fsblb=getSplb("000000");
		//sp();
		//setZts();
		
		//商品类型
		list_splx = codeSrv.queryObjs(Cnd.where("state", "=", 1).and("codetypeid", "=", 1));
		
		//香型
		list_xx = codeSrv.queryObjs(Cnd.where("state", "=", 1).and("codetypeid", "=", 2));
		
		//品牌
		//list_pp = getSplb("000000");
		
		//价格区间
		list_jgqj = codeSrv.queryObjs(Cnd.where("state", "=", 1).and("codetypeid", "=", 4));
		//度数
		list_ds = codeSrv.queryObjs(Cnd.where("state", "=", 1).and("codetypeid", "=", 9));
		//产地
		list_cd = codeSrv.queryObjs(Cnd.where("state", "=", 1).and("codetypeid", "=", 10));
		
		//销售类型
		list_xslx = codeSrv.queryObjs(Cnd.where("state", "=", 1).and("codetypeid", "=", 6));
		
}
	public List<Code> getList_splx() {
		return list_splx;
	}

	public void setList_splx(List<Code> listSplx) {
		list_splx = listSplx;
	}

	public List<Code> getList_xx() {
		return list_xx;
	}


	public void setList_xx(List<Code> listXx) {
		list_xx = listXx;
	}


	public List<Code> getList_jgqj() {
		return list_jgqj;
	}

	public void setList_jgqj(List<Code> listJgqj) {
		list_jgqj = listJgqj;
	}

	public List<Code> getList_xslx() {
		return list_xslx;
	}

	public void setList_xslx(List<Code> listXslx) {
		list_xslx = listXslx;
	}

	public Map getZts() {
		return zts;
	}

	public void setZts() {
		Map<Integer,String> m = new HashMap<Integer,String>();
		m.put(1, "可用");
		m.put(2, "停用");
		m.put(3, "删除");
		this.zts = m;
	}

	public List<Code> getList_ds() {
		return list_ds;
	}

	public void setList_ds(List<Code> list_ds) {
		this.list_ds = list_ds;
	}
	
	
}
