package com.sh.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class Admin {

	private int Id;
	private String UserName;
	private String Password;
	private String realName;
	private Set<Jurisdiction> jur=new HashSet<Jurisdiction>();

    @Id
    @GeneratedValue(generator="my_gen")
    @GenericGenerator(name = "my_gen", strategy = "increment")
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	
	@ManyToMany
	@JoinTable(name="adminjurisdiction",
			joinColumns=@JoinColumn(name="adminid"),
			inverseJoinColumns=@JoinColumn(name="jurisdictionid"))
	public Set<Jurisdiction> getJur() {
		return jur;
	}
	public void setJur(Set<Jurisdiction> jurisdiction) {
		this.jur = jurisdiction;
	}
}
