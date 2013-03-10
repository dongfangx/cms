package com.ly.sys.pojo;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Name;
import org.nutz.dao.entity.annotation.Table;

@Table("hospitalmenu")
public class Hospitalmenu {

	@Name
	@Column
	private String hospitalmenuid;

	@Column
	private String menuid;

	@Column
	private String hospitalid;

	public String getHospitalmenuid() {
		return hospitalmenuid;
	}

	public void setHospitalmenuid(String hospitalmenuid) {
		this.hospitalmenuid = hospitalmenuid;
	}

	public String getMenuid() {
		return menuid;
	}

	public void setMenuid(String menuid) {
		this.menuid = menuid;
	}

	public String getHospitalid() {
		return hospitalid;
	}

	public void setHospitalid(String hospitalid) {
		this.hospitalid = hospitalid;
	}

}
