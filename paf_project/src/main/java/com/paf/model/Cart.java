package com.paf.model;

public class Cart {

	private int lineID;
	private int cusID;
	private String addedDate;
	private String checkedDate;
	private String status;
	
	
	public int getLineID() {
		return lineID;
	}
	public void setLineID(int lineID) {
		this.lineID = lineID;
	}
	public int getCusID() {
		return cusID;
	}
	public void setCusID(int cusID) {
		this.cusID = cusID;
	}
	public String getAddedDate() {
		return addedDate;
	}
	public void setAddedDate(String addedDate) {
		this.addedDate = addedDate;
	}
	public String getCheckedDate() {
		return checkedDate;
	}
	public void setCheckedDate(String checkedDate) {
		this.checkedDate = checkedDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
