package com.ly.base.pojo;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

@Table("navmenu")
public class Navmenu{


	@Name
	@Column
	private String  navmenuid;
	
	@Column
	private String  navmenuno;
	
	@Column
	private String  navmenuname;
	
	@Column
	private String  menuurl;
	
	@Column
	private Integer  state;
	
	@Column
	private Integer  sort;
	
		public String getNavmenuid() {
	return navmenuid;
	}

	public void setNavmenuid(String  navmenuid) {
	this.navmenuid = navmenuid;
	}

	public String getNavmenuno() {
	return navmenuno;
	}

	public void setNavmenuno(String  navmenuno) {
	this.navmenuno = navmenuno;
	}

	public String getNavmenuname() {
	return navmenuname;
	}

	public void setNavmenuname(String  navmenuname) {
	this.navmenuname = navmenuname;
	}

	public String getMenuurl() {
	return menuurl;
	}

	public void setMenuurl(String  menuurl) {
	this.menuurl = menuurl;
	}

	public Integer getState() {
	return state;
	}

	public void setState(Integer  state) {
	this.state = state;
	}

	public Integer getSort() {
	return sort;
	}

	public void setSort(Integer  sort) {
	this.sort = sort;
	}

}

