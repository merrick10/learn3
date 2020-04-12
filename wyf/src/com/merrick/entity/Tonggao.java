package com.merrick.entity;
// Generated 2017-1-21 20:45:13 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

/**
 * Tonggao generated by hbm2java
 */
public class Tonggao extends BaseEntity  implements java.io.Serializable {

	private Long id;
	private String type2;
	private String title;
	private Date pubday;
	private String content;
	private String ispub;
	private Date optime;
	
	private Siteuser siteuser;
	
	public Siteuser getSiteuser() {
		return this.siteuser;
	}

	public void setSiteuser(Siteuser siteuser) {
		this.siteuser = siteuser;
	}

	public Date getOptime() {
		return optime;
	}

	public void setOptime(Date optime) {
		this.optime = optime;
	}



	public Tonggao() {
	}

	public Tonggao(Siteuser siteuser,String type2, String title, Date pubday, String content) {
		this.siteuser = siteuser;
		this.type2 = type2;
		this.title = title;
		this.pubday = pubday;
		this.content = content;
	}
	
	public Tonggao(Siteuser siteuser,String type2, String title, Date pubday, String content, Date optime) {
		this.siteuser = siteuser;
		this.type2 = type2;
		this.title = title;
		this.pubday = pubday;
		this.content = content;
		this.optime = optime;
		
	}

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getType2() {
		return this.type2;
	}

	public void setType2(String type2) {
		this.type2 = type2;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getPubday() {
		return this.pubday;
	}

	public void setPubday(Date pubday) {
		this.pubday = pubday;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getIspub() {
		return ispub;
	}

	public void setIspub(String ispub) {
		this.ispub = ispub;
	}

}