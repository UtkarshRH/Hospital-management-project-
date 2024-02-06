package com.entity;

public class Specalist {
	private int id;
	private String SpecalistName;
	
	
	
	public Specalist() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Specalist(int id, String specalistName) {
		super();
		this.id = id;
		SpecalistName = specalistName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSpecalistName() {
		return SpecalistName;
	}
	public void setSpecalistName(String specalistName) {
		SpecalistName = specalistName;
	}

}
