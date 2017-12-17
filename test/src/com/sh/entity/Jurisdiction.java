package com.sh.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import org.hibernate.annotations.GenericGenerator;

@Entity
public class Jurisdiction {

	private Integer id;
	private String power;
	private Set<Admin> admin=new HashSet<Admin>();
	
	@Id
    @GeneratedValue(generator="my_gen")
    @GenericGenerator(name = "my_gen", strategy = "increment")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power;
	}
	
	@ManyToMany(mappedBy="jur")
	public Set<Admin> getAdmin() {
		return admin;
	}
	public void setAdmin(Set<Admin> admin) {
		this.admin = admin;
	}
}
