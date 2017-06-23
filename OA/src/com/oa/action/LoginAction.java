package com.oa.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Employee;
import com.oa.bean.Notice;
import com.oa.bean.Student;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.EncryptUtil;
import com.oa.service.EmployeeService;
import com.oa.service.NoticeServiceImpl;
import com.oa.service.StudentService;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements ServletRequestAware{

	private static final long serialVersionUID = -8853616415660510756L;
	private HttpServletRequest req;
	private HttpSession session;
	private Student student;
	private StudentService studentService;
	private Employee employee;
	private EmployeeService employeeService;
	private String empId;
	private ControllerRequest resu;
	private NoticeServiceImpl noticeService;
	private List<Notice> notices;
	
	
	public List<Notice> getNotices() {
		return notices;
	}

	public void setNotices(List<Notice> notices) {
		this.notices = notices;
	}

	public void setNoticeService(NoticeServiceImpl noticeService) {
		this.noticeService = noticeService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public ControllerRequest getResu() {
		return resu;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	

	public String showStudent(){
    	return "showStudent";
    }
    
    public String showEmployee(){
    	return "showEmployee";
    }

	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req= req;
	}
	
	public String emplogin(){
		session = req.getSession();
		String pwd = employee.getPwd();
		employee.setPwd(EncryptUtil.encrypt(pwd));
		employee = employeeService.login(employee);
		if(employee != null){
			notices = noticeService.queryNewNotice();
			session.setAttribute("employee", employee);
			session.setAttribute("notices", notices);
			return "emplogin-ok";
		}
			return "emplogin-no";
	}
	
	
	public String exit() {
		session = req.getSession();
		if (session.getAttribute("emp") != null) {
			session.removeAttribute("emp");;
		}
		return "exit-emp";
	}
    
	
	public String student(){
		session = req.getSession();
		String pwd = student.getPwd();
		student.setPwd(EncryptUtil.encrypt(pwd));
		student = studentService.login(student);
		if(student != null){
			notices = noticeService.queryNewNotice();
			session.setAttribute("student", student);
			session.setAttribute("notices", notices);
			return "student-ok";
		}
		return "student-no";
	}

}




















