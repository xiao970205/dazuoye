package com.sh.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;



@Entity
@Table(name="ORDER0")
public class Order0 {
	
	
	private int id;
	private int userid;
	private String submittime;
	private String ordernow;
	private String address;
	private Set orderssSet=new HashSet<orderss>();
	
	@Id
	@GeneratedValue(generator="my_gen")
    @GenericGenerator(name = "my_gen", strategy = "increment")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getSubmittime() {
		return submittime;
	}
	public void setSubmittime(String submittime) {
		this.submittime = submittime;
	}
	public String getOrdernow() {
		return ordernow;
	}
	public void setOrdernow(String ordernow) {
		this.ordernow = ordernow;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
    @OneToMany(mappedBy="order0", targetEntity=orderss.class, 
            cascade=CascadeType.ALL)
    public Set getOrderssSet() {
        return orderssSet;
    }

    public void setOrderssSet(Set orderSet) {
        this.orderssSet = orderSet;
    }
}
