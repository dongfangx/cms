package com.ly.base.pojo;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

@Table("code")
public class Code{
	
	@Name
	@Column
	private String  codeid;
	
	@Column
	private Long  codetypeid;
	
	@Column
	private Long  codeno;

	@Column
	private String  codename;
	
	@Column
	private String  val1;
	
	@Column
	private String  val2;
	
	@Column
	private Long  num1;
	
	@Column
	private Long  num2;
	
	@Column
	private Long  num21;
	
	@Column
	private Long  num22;
	
	@Column
	private Long  num43;
	
	@Column
	private Long  num44;
	
	@Column
	private Long  state;
	
	@Column
	private String  memo;
	

	
		public String getCodename() {
	return codename;
	}

	public void setCodename(String  codename) {
	this.codename = codename;
	}

	public String getVal1() {
	return val1;
	}

	public void setVal1(String  val1) {
	this.val1 = val1;
	}

	public String getVal2() {
	return val2;
	}

	public void setVal2(String  val2) {
	this.val2 = val2;
	}

	public Long getNum1() {
	return num1;
	}

	public void setNum1(Long  num1) {
	this.num1 = num1;
	}

	public Long getNum2() {
	return num2;
	}

	public void setNum2(Long  num2) {
	this.num2 = num2;
	}

	public Long getNum21() {
	return num21;
	}

	public void setNum21(Long  num21) {
	this.num21 = num21;
	}

	public Long getNum22() {
	return num22;
	}

	public void setNum22(Long  num22) {
	this.num22 = num22;
	}

	public Long getNum43() {
	return num43;
	}

	public void setNum43(Long  num43) {
	this.num43 = num43;
	}

	public Long getNum44() {
	return num44;
	}

	public void setNum44(Long  num44) {
	this.num44 = num44;
	}

	public Long getState() {
	return state;
	}

	public void setState(Long  state) {
	this.state = state;
	}

	public String getMemo() {
	return memo;
	}

	public void setMemo(String  memo) {
	this.memo = memo;
	}

	public String getCodeid() {
	return codeid;
	}

	public void setCodeid(String  codeid) {
	this.codeid = codeid;
	}

	public Long getCodetypeid() {
	return codetypeid;
	}

	public void setCodetypeid(Long  codetypeid) {
	this.codetypeid = codetypeid;
	}

	public Long getCodeno() {
	return codeno;
	}

	public void setCodeno(Long  codeno) {
	this.codeno = codeno;
	}

}

