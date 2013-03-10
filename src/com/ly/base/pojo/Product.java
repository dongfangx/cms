package com.ly.base.pojo;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

@Table("product")
public class Product {

	@Name
	@Column
	private String productid;

	@Column
	private String productno;

	@Column
	private Integer state;

	@Column
	private Integer ordernum;

	@Column
	private Date adddate;

	@Column
	private String employeeid;

	@Column
	private String introducation;

	@Column
	private String title;

	@Column
	private String content;

	@Column
	private String minimg;

	@Column
	private String maximg;

	@Column
	private String productcategoryid;

	@Column
	private String productcategoryname;

	public String getProductid() {
		return productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public String getProductno() {
		return productno;
	}

	public void setProductno(String productno) {
		this.productno = productno;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(Integer ordernum) {
		this.ordernum = ordernum;
	}

	public Date getAdddate() {
		return adddate;
	}

	public void setAdddate(Date adddate) {
		this.adddate = adddate;
	}

	public String getEmployeeid() {
		return employeeid;
	}

	public void setEmployeeid(String employeeid) {
		this.employeeid = employeeid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}




	public String getIntroducation() {
		return introducation;
	}

	public void setIntroducation(String introducation) {
		this.introducation = introducation;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMinimg() {
		return minimg;
	}

	public void setMinimg(String minimg) {
		this.minimg = minimg;
	}

	public String getMaximg() {
		return maximg;
	}

	public void setMaximg(String maximg) {
		this.maximg = maximg;
	}

	public String getProductcategoryid() {
		return productcategoryid;
	}

	public void setProductcategoryid(String productcategoryid) {
		this.productcategoryid = productcategoryid;
	}

	public String getProductcategoryname() {
		return productcategoryname;
	}

	public void setProductcategoryname(String productcategoryname) {
		this.productcategoryname = productcategoryname;
	}

}
