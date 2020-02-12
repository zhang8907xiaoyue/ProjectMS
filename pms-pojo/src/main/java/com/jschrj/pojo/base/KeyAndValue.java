package com.jschrj.pojo.base;

import java.io.Serializable;

public class KeyAndValue implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -827155688381999597L;
	private String name;
	private int value;
	private int ext1;
	private int ext2;
	private int ext3;
	private int ext4;
	private int ext5;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}

	public int getExt1() {
		return ext1;
	}

	public void setExt1(int ext1) {
		this.ext1 = ext1;
	}

	public int getExt2() {
		return ext2;
	}

	public void setExt2(int ext2) {
		this.ext2 = ext2;
	}

	public int getExt4() {
		return ext4;
	}

	public void setExt4(int ext4) {
		this.ext4 = ext4;
	}

	public int getExt5() {
		return ext5;
	}

	public void setExt5(int ext5) {
		this.ext5 = ext5;
	}

	public int getExt3() {
		return ext3;
	}

	public void setExt3(int ext3) {
		this.ext3 = ext3;
	}
}
