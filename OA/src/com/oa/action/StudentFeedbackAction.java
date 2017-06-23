package com.oa.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Employee;
import com.oa.bean.Grade;
import com.oa.bean.Student;
import com.oa.bean.StudentFeedback;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.GradeService;
import com.oa.service.StudentFeedbackService;
import com.opensymphony.xwork2.ActionSupport;

public class StudentFeedbackAction extends ActionSupport implements ServletRequestAware{

	
	private static final long serialVersionUID = -6656382086181030348L;
	private StudentFeedbackService stuFeedbackService;
	private HttpServletRequest req;
	
	private List<StudentFeedback> rows; 	// 返回rows结果集到easyUI页面
	private long total;				// 返回total总记录数到easyUI页面
	private ControllerRequest resu;  // 返回提示信息到easyUI页面
	private StudentFeedback stuFeedback;		// 反馈
	private GradeService gradeService;
	
	private String id; 
	
	private String gradeId;
	
	

	
	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	
	public String getGradeId() {
		return gradeId;
	}

	public void setId(String id) {
		this.id = id;
	}

	public StudentFeedback getStuFeedback() {
		return stuFeedback;
	}

	public void setStuFeedback(StudentFeedback stuFeedback) {
		this.stuFeedback = stuFeedback;
	}

	public List<StudentFeedback> getRows() {
		return rows;
	}

	public void setStuFeedbackService(StudentFeedbackService stuFeedbackService) {
		this.stuFeedbackService = stuFeedbackService;
	}

	public long getTotal() {
		return total;
	}
	
	public ControllerRequest getResu() {
		return resu;
	}
	
	public String queryByGradeId(){
		Student stu = (Student) WebUtil.getSessionValue(req,"student");
		if(stu != null){
			Grade grade = gradeService.queryById(Grade.class, stu.getGradeId());
			Pager4EasyUI<StudentFeedback> pager = new Pager4EasyUI<StudentFeedback>();
			pager.setPageNo(WebUtil.getPageNo(req));
			pager.setPageSize(WebUtil.getPageSize(req));
			pager.setTotal(stuFeedbackService.count("StudentFeedback"));
			pager = stuFeedbackService.queryPagerByGradeId(pager, grade.getGradeId());
			rows = pager.getRows();
			total = pager.getTotal();
			return "queryBygradeid";
		}else{
			return ERROR;
		}
	}
	
	public String stuSave(){   // 添加学生反馈
		Student stu = (Student) WebUtil.getSessionValue(req,"student");
		stuFeedback.setStatus(1);
		stuFeedback.setStuId(stu.getStuId());
		stuFeedbackService.save(stuFeedback);
		resu = ControllerRequest.getSuccessRequest("添加成功");
		return "save";
	}

	public String feedbackDisable(){  // 禁用学生反馈
		stuFeedbackService.updateStatus("StudentFeedback", "feedbackId", 0, id);
		return "disable";
	}
	
	public String feedbackActivate(){ // 启用学生反馈
		stuFeedbackService.updateStatus("StudentFeedback", "feedbackId", 1, id);
		return "activae";
	}
	
	public String stuFeedbackPager(){  // 分页显示学生反馈信息
		Pager4EasyUI<StudentFeedback> pager = new Pager4EasyUI<StudentFeedback>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setTotal(stuFeedbackService.count("StudentFeedback"));
		pager = stuFeedbackService.queryPagerByGradeId(pager, gradeId);
		total = pager.getTotal();
		rows = pager.getRows();
		return "pager";
	}
	
	public String stufeedbackUpdate(){
		System.out.println(stuFeedback);
		Student stu = (Student) WebUtil.getSessionValue(req,"student");
		stuFeedback.setStuId(stu.getStuId());
		stuFeedbackService.update(stuFeedback);
		resu = ControllerRequest.getSuccessRequest("修改成功");
		return "update";
	}
	
	public String showStuFeedback(){  // 显示学生反馈信息页面
		return "showStuFeedback";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		 this.req = req;
	}

}
