package com.merrick.entity;


import java.util.Date;
import java.util.HashSet;
import java.util.Set;


public class Siteuser extends BaseEntity  implements java.io.Serializable {

	private String id;

	private String name;
	

	private String cipher;
	
	private Integer gender;

	private String birth; //system date type not fit the pattern YYYY-mm-dd

	private String email;
	
	private String tel;
	
	private String intro;
	
	private int level;
	
	private Date lastlogin;
	
	private Date lastpost;
	
	private Set tonggaos = new HashSet(0);


	public Siteuser() {
	}

	public Siteuser(String id, String name, String cipher, int level) {
		this.id = id;
		this.name = name;
		this.cipher = cipher;
		this.level = level;
	}

	public Siteuser(String id, String name, String cipher, Integer gender, String birth, String email, String tel,
			String intro, int level, Date lastlogin, Date lastpost ,Set tonggaos
			) {
		this.id = id;
		this.name = name;
		this.cipher = cipher;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
		this.tel = tel;
		this.intro = intro;
		this.level = level;
		this.lastlogin = lastlogin;
		this.lastpost = lastpost;
		this.tonggaos = tonggaos;

	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCipher() {
		return this.cipher;
	}

	public void setCipher(String cipher) {
		this.cipher = cipher;
	}

	public Integer getGender() {
		return this.gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}


	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getIntro() {
		return this.intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public int getLevel() {
		return this.level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public Date getLastlogin() {
		return this.lastlogin;
	}

	public void setLastlogin(Date lastlogin) {
		this.lastlogin = lastlogin;
	}

	public Date getLastpost() {
		return this.lastpost;
	}

	public void setLastpost(Date lastpost) {
		this.lastpost = lastpost;
	}
	
	public Set getTonggaos() {
		return tonggaos;
	}

	public void setTonggaos(Set tonggaos) {
		this.tonggaos = tonggaos;
	}
}
