package com.oa.action;

import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.json.annotations.JSON;

import com.oa.bean.Department;
import com.oa.bean.Empappeal;
import com.oa.bean.Employee;
import com.oa.bean.info.EmpappealInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.DepartmentService;
import com.oa.service.EmpAppealService;
import com.opensymphony.xwork2.ActionSupport;

public class EmpAppealAction extends BaseAction implements ServletRequestAware{
	private HttpServletRequest request;
	private Pager4EasyUI<EmpappealInfo> pager = new Pager4EasyUI<EmpappealInfo>();;
	private Empappeal empappeal;
	private EmpAppealService empAppealService;
	private DepartmentService departmentService;
	private int countNewStatus;	//申诉被更新的状态
	private String self;	//用于验证用户点击的是否是页面上方的showEmpleave
	

	private final String className =this.getClass().getName();; 
	private ControllerRequest reqMsg;

	

	private List<EmpappealInfo> rows;
	private int total;
	
	/**
	 * 方法
	 * pager 分面显示信息
	 * save 存储审诉信息
	 * update 审核请假是在这个方法
	 * @return
	 */
	public String pager(){//
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		Department dept = employee.getDepartment();
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){

			String depId =request.getParameter("depId"); //总经理页面会传进来这个
			String empName = request.getParameter("empName");//名字模糊
			String firstlevel = request.getParameter("firstlevel");
			String secondlevel = request.getParameter("secondlevel");//有部门则有部门则first与second
			String pass = request.getParameter("pass");//有已审核,与未审核
			String status = request.getParameter("status");	//状态(员工自己的)
			String beginDate= request.getParameter("beginDate");	//过滤提交请假日期的开始
			String endDate= request.getParameter("endDate");		//过滤提交请假日期的结束
			String hasPass= request.getParameter("hasPass");	//判断是否需要过滤审核通过的,上级默认
			String sort = request.getParameter("sort");
			String order = request.getParameter("order");
			
			pager.setPageNo(WebUtil.getPageNo(request));
			pager.setPageSize(WebUtil.getPageSize(request));
			/**
			 * 判断是否是总经理
			 */
			if(self==null||self.equals("")){
				if(employee.getRole().getName().equals("总经理")){//查所有的
					if(hasPass!=null&&!hasPass.equals("")){
						if(hasPass.equals("0")){//不过滤是否审核
							secondlevel  = "0";//未审核
						}else if(hasPass.equals("1")){//已审核
							secondlevel="1";
						}
					}else{
						hasPass = "0"; pass = null;
					}
					empAppealService.queryByBoss(pager,empName, secondlevel, pass, hasPass, beginDate,endDate,sort,order);
					pager.setTotal(empAppealService.countByBoss(empName, secondlevel, pass, hasPass, beginDate, endDate));
				}else{//是上司查下级的
					if(hasPass==null||hasPass.equals("")){//未审核
					}else if(hasPass.equals("0")){
						firstlevel = "0";
					}else if(hasPass.equals("1")){//已审核
						firstlevel  = "1";//
						hasPass=null;pass=null;
					}
					empAppealService.queryByDept(pager, employee.getDepartment().getDepId(), null,empName, firstlevel,pass,hasPass, beginDate,endDate,sort,order);
					pager.setTotal(empAppealService.countByDept( employee.getDepartment().getDepId(), null,empName, firstlevel,pass,hasPass, beginDate,endDate));
				}
				rows = pager.getRows();
				total = (int) pager.getTotal();
			}else{
				pagerById(request,employee);
			}
			reqMsg=ControllerRequest.getSuccessRequest("申诉添加成功,请等待审核");
		}else{//个人查询
			pagerById(request,employee);
		}
		return "pager";
	}
	
	public void pagerById(HttpServletRequest request,Employee employee ){//员工自己的申诉分页
		String pass = request.getParameter("pass");//有已审核,与未审核
		String status = request.getParameter("status");	//状态(员工自己的)
		String beginDate= request.getParameter("beginDate");	//过滤提交请假日期的开始
		String endDate= request.getParameter("endDate");		//过滤提交请假日期的结束
		String hasPass= request.getParameter("hasPass");	//判断是否需要过滤审核通过的,上级默认
		String sort = request.getParameter("sort");
		String order = request.getParameter("order");
	
		pager.setPageNo(WebUtil.getPageNo(request));
		pager.setPageSize(WebUtil.getPageSize(request));
		empAppealService.queryById(pager, employee.getEmpId(), pass, hasPass, beginDate,endDate,sort,order);
		pager.setTotal(empAppealService.countById(employee.getEmpId(), pass, hasPass, beginDate,endDate));
		empAppealService.updLeaveStatus(employee.getEmpId());
		rows = pager.getRows();
		total = (int) pager.getTotal();
	}
	
	public String save(){
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			String depName = departmentService.queryDepNameByDepId(employee.getDepartment().getDepId());
			String managerRoleName = departmentService.managerRoleName(depName);
			if(managerRoleName.equals(employee.getRole().getName())){
				empappeal.setFirstLevel(1);
			}
			empappeal.setAppealDay(new Date());
			empappeal.setEmployee(employee);
			empAppealService.save(empappeal);
			
			reqMsg=ControllerRequest.getSuccessRequest("申诉添加成功,请等待审核");
		}else {
			reqMsg = ControllerRequest.getFailRequest("权限不足,请联系管理员");
		}
		
		return "save";
	}
	
	public String update() {//在这里审核
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if( autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			/**
			 * 总经理是第二级
			 * 所以只在判断是总经理,就可以确定是第二级了
			 */
			String pass = request.getParameter("pass");//有已审核,与未审核
			String status = request.getParameter("status");
			String appealId = request.getParameter("appealId");
			String level = request.getParameter("level");
			String firstlevel = "";
			String secondlevel = "";
			if(employee.getRole().getName().equals("总经理")){//修改第二级
				empAppealService.updateLevel(appealId, null,"1", pass);
			}else{//是部门经理修改第一级
				empAppealService.updateLevel(appealId, "1",null , pass);
			}
		}else{
			reqMsg.getFailRequest("权限不足,请联系管理员");
		}
		return "update";
	}
	
	public String showEmpAppeal() {
		return "showEmpAppeal";
	}
	
	public String doEmpappeal(){
		return "doEmpappeal";
	}
	
	public String seeEmpappeal(){
		return "seeEmpappeal";
	}
	
	public String newStatus(){
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		//gcountNewStatus=empAppealService.countNewStatus(employee.getEmpId());
		return "newStatus";
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	
	/**
	 *get/set 
	 */
	@JSON(serialize=false)
	public Empappeal getEmpappeal() {
		return empappeal;
	}

	public void setEmpappeal(Empappeal empappeal) {
		this.empappeal = empappeal;
	}

	public List<EmpappealInfo> getRows() {
		return rows;
	}

	public int getTotal() {
		return total;
	}

	public void setEmpAppealService(EmpAppealService empAppealService) {
		this.empAppealService = empAppealService;
	}
	
	public ControllerRequest getReqMsg() {
		return reqMsg;
	}
	
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public int getCountNewStatus() {
		return countNewStatus;
	}

	public void setCountNewStatus(int countNewStatus) {
		this.countNewStatus = countNewStatus;
	}

	public String getSelf() {
		return self;
	}

	public void setSelf(String self) {
		this.self = self;
	}

}
