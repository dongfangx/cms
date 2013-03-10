package com.ly.base.pojo;


import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

@Table("codetype")
public class Codetype{

	@Id(auto=false)
	@Column
	private Long  codetypeid;
	
	@Column
	private String  codetypename;
	
	@Column
	private String  url;
	
	@Column
	private Long  state;
	
	@Column
	private String  memo;
	
		public Long getCodetypeid() {
	return codetypeid;
	}

	public void setCodetypeid(Long  codetypeid) {
	this.codetypeid = codetypeid;
	}

	public String getCodetypename() {
	return codetypename;
	}

	public void setCodetypename(String  codetypename) {
	this.codetypename = codetypename;
	}

	public String getUrl() {
	return url;
	}

	public void setUrl(String  url) {
	this.url = url;
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

}

