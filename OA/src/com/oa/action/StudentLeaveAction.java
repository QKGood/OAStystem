package com.oa.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Student;
import com.oa.bean.StudentLeave;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.StudentLeaveService;
import com.opensymphony.xwork2.ActionSupport;

public class StudentLeaveAction extends ActionSupport implements ServletRequestAware{

	private static final long serialVersionUID = -237725301596363703L;

	private HttpServletRequest req;
	
	private List<StudentLeave> rows; 	// 返回rows结果集到easyUI页面
	private long total;				// 返回total总记录数到easyUI页面
	private ControllerRequest resu;  // 返回提示信息到easyUI页面
	
	
	private StudentLeaveService stuLeaveService;
	
	private String gradeId;
	
	private StudentLeave stuLeave;
	
	private String pass;
	private String roleName;
	private String id;
	
	
	public void setId(String id) {
		this.id = id;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public StudentLeave getStuLeave() {
		return stuLeave;
	}
	public void setStuLeave(StudentLeave stuLeave) {
		this.stuLeave = stuLeave;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public List<StudentLeave> getRows() {
		return rows;
	}
	public long getTotal() {
		return total;
	}
	
	public ControllerRequest getResu() {
		return resu;
	}
	
	
	public void setStuLeaveService(StudentLeaveService stuLeaveService) {
		this.stuLeaveService = stuLeaveService;
	}
	
	public String showStuLeave(){
		return "showStuLeave";
	}
	


	
	public String gradeByPager() {
		Pager4EasyUI<StudentLeave> pager = new Pager4EasyUI<StudentLeave>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setTotal(stuLeaveService.count("StudentLeave"));
		pager = stuLeaveService.queryPagerByGradeId(pager, gradeId);
		rows = pager.getRows();
		total = pager.getTotal();
		return "pager";
	}
	
	public String save(){ // 请假申请
		Student stu = (Student) WebUtil.getSessionValue(req,"student");
		stuLeave.setStuId(stu.getStuId());
		stuLeave.setLeaveDay(new Date());
		stuLeaveService.save(stuLeave);
		resu = ControllerRequest.getSuccessRequest("申请成功");
		return "save";
	}
	public String updateLeave(){
		stuLeave = stuLeaveService.queryById(StudentLeave.class, id);
		System.out.println(stuLeave);
		if(roleName.equals("任课老师")){
			stuLeave.setFirLevel(1);
		}else if(roleName.equals("班主任")){
			stuLeave.setSecondLevel(1);
		}
		if(stuLeave.getFirLevel() == 1 && stuLeave.getSecondLevel() == 1){
			stuLeave.setPass(1);
			
		}
		stuLeaveService.update(stuLeave);
		return "updateLeave";
	}
	
	public String queryByLeaveId(){
		Student stu = (Student) WebUtil.getSessionValue(req,"student");
		Pager4EasyUI<StudentLeave> pager = new Pager4EasyUI<StudentLeave>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setTotal(stuLeaveService.count("StudentLeave"));
		if(pass.equals("1")){
			pager = stuLeaveService.queryPagerByLeaveId(pager, stu.getStuId(), 1);
		}else if(pass.equals("0")){
			pager = stuLeaveService.queryPagerByLeaveId(pager, stu.getStuId(), 0);
		}
		rows = pager.getRows();
		total = pager.getTotal();
		return "queryById";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		 this.req = req;
	}

}
