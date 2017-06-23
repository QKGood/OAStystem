package com.oa.action;

import com.oa.bean.Student;
import com.oa.common.web.WebUtil;
import com.oa.service.StudentService;

public class StuClientAction extends BaseAction {
	private static final long serialVersionUID = -1164664005734371836L;

	// 以下是学生客户端的显示页面
	private Student student;
	
	
	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}


	// 显示学生成绩home页面
	public String showStuScoreHome() {
		return "showStuScoreHome";
	}

	// 显示学生用品管理home页面
	public String showGoodsHome() {
		return "showGoodsHome";
	}

	// 显示学生请假home页面
	public String showStuLeaveHome() {
		return "showStuLeaveHome";
	}

	// 显示学生反馈信息home页面
	public String showStuFeedbackHome() {
		return "showStuFeedbackHome";
	}

	// 显示学生考勤home页面
	public String showStuCheckingHome() {
		return "showStuCheckingHome";
	}

	// 显示学生本人页面home信息
	public String showStuHome() {
		return "showStuHome";
	}

	// 显示公告home页面
	public String showNoticeHome() {
		return "showNoticeHome";
	}
	
	
	
}
