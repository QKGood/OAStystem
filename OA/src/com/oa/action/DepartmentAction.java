package com.oa.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.json.annotations.JSON;

import com.oa.bean.Department;
import com.oa.bean.Employee;
import com.oa.bean.Role;
import com.oa.bean.info.DepEmp;
import com.oa.bean.info.EmpBaseInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.DepartmentService;
import com.oa.service.EmployeeService;
import com.oa.service.info.DepEmpServiceInfo;
import com.opensymphony.xwork2.ActionSupport;

public class DepartmentAction  extends BaseAction implements ServletRequestAware{
	private DepartmentService  departmentService;
	private DepEmpServiceInfo  depEmpServiceInfo;
	private EmployeeService employeeService;
	/**
	 * 没有权限的提示信息
	 */
	private ControllerRequest reqMsg;
	private final String className = this.getClass().getName();

	private Department department;
	private Pager4EasyUI<DepEmp> pager = new Pager4EasyUI<DepEmp>();
	private HttpServletRequest request ;
	private String name;

	private Map<String,String> selects;

	public Map<String, String> getSelects() {
		return selects;
	}

	public void setSelects(Map<String, String> selects) {
		this.selects = selects;
	}

	private int total;
	private List<DepEmp> rows;
	
	
	private Map<String ,String> maps;
	
	/**
	 * get/set
	 * @return
	 */
	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}
	public int getTotal() {
		return total;
	}
	public List<DepEmp> getRows() {
		return rows;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	
	/**
	 * 各种方法
	 */
	public String save(){//增
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			department.setStatus(1);
			department = departmentService.save(department);
			reqMsg=ControllerRequest.getSuccessRequest("添加部门成功"); 
		}else {
			reqMsg=ControllerRequest.getFailRequest( "你没有相应的权限"); 
		}
		return "save";
	}
	
	public String delete(){//删
		departmentService.delete(department);
		return "delete";
	}
	public String update(){//改
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			departmentService.updateDep(department);
		}else{
			reqMsg.getFailRequest( "你没有相应的权限");
		}
		return "update";
	}
	
	public String pager(){//查
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee emp = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(emp.getRole().getRoleId(),actionName)){
			pager = new Pager4EasyUI<DepEmp>();
			pager.setPageNo(WebUtil.getPageNo(request));
			pager.setPageSize(WebUtil.getPageSize(request));
			pager = depEmpServiceInfo.queryPager(pager);
			pager.setTotal(depEmpServiceInfo.countPager());
			
			total = (int) pager.getTotal();
			rows = pager.getRows();
			return "pager";
		}
		return "error";
	}
	
	public String updStatus () {
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			if(department.getStatus() == 1) {
				department.setStatus(0);
			}else {
				department.setStatus(1);
			}
			departmentService.updateStatus("Department","depId",department.getStatus(),department.getDepId());
		}else{
			reqMsg.getFailRequest( "你没有相应的权限");
		}
		return "updStatus";
	}
	
	
	
	public String queryEmployees() {
		selects = depEmpServiceInfo.empSelect(department);
		return "queryEmployees";
	}
	
	public String showDepartment(){
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			return "showDepartment";
		}else {
			return "error";
		}
	}
	/**
	 * 传入一个部门名,
	 * 判断该部门是否有经理并且没有普通
	 * 	有经理&没普通
	 * 		不设置它的角色
	 * 有经理&有普通
	 * 没有经理&没普通
	 * 没有经理&有普通
	 * @return
	 */
	public String checkDepEmp(){
		String depName= request.getParameter("depName");//得到部门名称
		String depId = departmentService.queryDepIdByDepName(depName);//以部门名称查询部门id
		String managerRole = departmentService.managerRoleName(depName);//该部门的管理者角色名称
		if(depId!=null){
			String depOldManager = employeeService.queryEmpByRole(managerRole,depId); //查询某部门的管理者id
			List<String> norm = departmentService.normRoleName(depName);
			if(norm.size()<=0&&depOldManager!=null&&!depOldManager.equals("")){
				reqMsg = ControllerRequest.getFailRequest("该部门已有经理,并且没有普通成员");
			}else{
				reqMsg = ControllerRequest.getSuccessRequest("可以修改");
			}
		}
		return "checkDepEmp";
	}
	
	public String resultDepName(){
		 Employee employe = (Employee) WebUtil.getSessionValue(request,"employee");
		name = departmentService.queryDepNameByDepId(employe.getDepartment().getDepId());
		return "resultDepName";
	}
	

	/**
	 * Other
	 */
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request= request;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@JSON(serialize=false)
	public DepEmpServiceInfo getDepEmpServiceInfo() {
		return depEmpServiceInfo;
	}

	public void setDepEmpServiceInfo(DepEmpServiceInfo depEmpServiceInfo) {
		this.depEmpServiceInfo = depEmpServiceInfo;
	}

	public Map<String ,String> getMaps() {
		return maps;
	}

	public void setMaps(Map<String ,String> maps) {
		this.maps = maps;
	}
	
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
	public ControllerRequest getReqMsg() {
		return reqMsg;
	}
}
