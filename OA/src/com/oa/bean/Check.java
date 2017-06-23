package com.oa.bean;

import java.sql.Time;
import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

public class Check {
	
	// 郭昶 巡查表
	
	private String checkId; //巡查编号
	private Date checkTime;//巡查时间
	
	private String weekday;//周几
	private String des;//描述
	
	private Employee employee;
	private Grade grade;
	private Room room;
	
	
	public String getCheckId() {
		return checkId;
	}
	public void setCheckId(String checkId) {
		this.checkId = checkId;
	}
	public String getWeekday() {
		return weekday;
	}
	public void setWeekday(String weekday) {
		this.weekday = weekday;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public Date getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(Date checkTime) {
		this.checkTime = checkTime;
	}

	
	@Override
	public String toString() {
		return "Check [checkId=" + checkId + ", checkTime=" + checkTime + ", weekday=" + weekday + ", des=" + des + "]";
	}
	/**
	 * 
	 * @return
	 */
	@JSON(serialize=false)
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	@JSON(serialize=false)
	public Grade getGrade() {
		return grade;
	}
	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	@JSON(serialize=false)
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
}
