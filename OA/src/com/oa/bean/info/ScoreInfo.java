package com.oa.bean.info;

import java.util.Date;


public class ScoreInfo {
	private String stuId; // 学生编号
	private String courseId; // 课程编号
	private String score; // 分数
	private Date testDay; // 考试时间
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public Date getTestDay() {
		return testDay;
	}
	public void setTestDay(Date testDay) {
		this.testDay = testDay;
	}
	
	
	
}
