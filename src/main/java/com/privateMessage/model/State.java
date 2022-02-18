package com.privateMessage.model;

import java.util.Set;

public class State {
	private String type;
	// the mem changing the state
	private String mem;
	// total mems
	private Set<String> mems;

	public State(String type, String mem, Set<String> mems) {
		super();
		this.type = type;
		this.mem = mem;
		this.mems = mems;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMem() {
		return mem;
	}

	public void setMem(String mem) {
		this.mem = mem;
	}

	public Set<String> getMems() {
		return mems;
	}

	public void setMems(Set<String> mems) {
		this.mems = mems;
	}



}
