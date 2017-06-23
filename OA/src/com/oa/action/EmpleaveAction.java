package com.oa.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Empleave;
import com.oa.bean.Employee;
import com.oa.bean.info.EmpleaveInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.DepartmentService;
import com.oa.service.EmpleaveService;
import com.oa.service.EmpleaveServiceImpl;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 员工请假
 * @author Administrator
 *
 */
public class EmpleaveAction extends BaseAction implements ServletRequestAware{
	private HttpServletRequest request;
	private Empleave empleave;
	private Pager4EasyUI<EmpleaveInfo> pager ;
	private EmpleaveService empleaveService;
	private DepartmentService departmentService;
	private String self;	//用于验证用户点击的是否是页面上方的showEmpleave
	private int countNewStatus;

	private final String className =this.getClass().getName();; 
	private ControllerRequest reqMsg;
	
	private int total;


	private List<EmpleaveInfo> rows;
	
	public String save(){
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if(autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			String startDateStr =  request.getParameter("startDate");
			String endDateStr = request.getParameter("endDate");
			System.out.println("startDateStr : " +startDateStr );
			Date startDate = WebUtil.str2Date(startDateStr, "yyyy-MM-dd HH:mm:ss");
			Date endDate = WebUtil.str2Date(endDateStr, "yyyy-MM-dd HH:mm:ss");
			empleave.setLeaveDay(new Date());
			empleave.setStartTime(startDate);
			empleave.setEndTime(endDate);
			empleave.setEmployee(employee);
			String depName = departmentService.queryDepNameByDepId(employee.getDepartment().getDepId());
			String managerRoleName = departmentService.managerRoleName(depName);
			if(managerRoleName.equals(employee.getRole().getName())){
				empleave.setFirstLevel(1);
			}
			empleaveService.save(empleave);
			reqMsg=ControllerRequest.getSuccessRequest("添加请假单成功,请耐心等待回复");
		}else{
			reqMsg=ControllerRequest.getFailRequest("权限不足,请联系管理员");
		}
		return "save";
	}
	
	public String update(){
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if(autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			String leaveid = request.getParameter("leaveid");
			String pass = request.getParameter("pass");
			Integer count = Integer.parseInt(request.getParameter("count"));
			if(count>=3){
				if(!employee.getRole().getName().equals("总经理")){//不是总经理,查所有
					empleaveService.baseUpdFirstLeave(leaveid, pass);
				}else{
					empleaveService.baseUpdSecondLeave(leaveid,pass);
				}
			}else{
				empleaveService.baseUpdSecondLeave(leaveid,pass);
			}
			
			/*int status = 0;
			 * if(pass.equals("1")){ //部门审核需要判断是否大于 3天
				status = 1;
			}else if(pass.equals("2")){
				int diff = Integer.valueOf(request.getParameter("diff"));
				if(diff<3){
					status =1 ;	
				}else {
					pass= "0";
				}
			}*/
		}else{
			reqMsg.getFailRequest("权限不足,请联系管理员");
		}
		return "update";
	}
	
	public String pager(){
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if(autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			pager = new Pager4EasyUI<EmpleaveInfo>();
			pager.setPageNo(WebUtil.getPageNo(request));
			pager.setPageSize(WebUtil.getPageSize(request));
			String firstlevel = request.getParameter("firstlevel");
			String secondlevel = request.getParameter("secondlevel");//有部门则有部门则first与second
			String pass = request.getParameter("pass");//有已审核,与未审核
			String status = request.getParameter("status");
			String hasPass= request.getParameter("hasPass");//判断是否过滤审核
			String depid = request.getParameter("depid");//条件中的部门id
			String empName = request.getParameter("empName");
			String startBegin = "";
			String startEnd = "";
			String endBegin = "";
			String endEnd = "";
			String beginLeave = request.getParameter("beginDate");
			String endLeave = request.getParameter("endDate");//
			String order = request.getParameter("order");
			String sort = request.getParameter("sort");
			/**
			 * 自己查自己
			 * 上司查下属
			 * 超级查所有
			 * pager是限制上司查下属,超级查所有
			 */
			if(self==null||self.equals("")){
				if(employee.getRole().getName().equals("总经理")){//是总经理,查所有
					if(hasPass!=null&&!hasPass.equals("")){
						if(hasPass.equals("0")){//不过滤是否审核
							secondlevel  = "0";//未审核
						}else if(hasPass.equals("1")){//已审核
							secondlevel="1";
						}
					}else{
						hasPass = null; pass = null;
					}
					empleaveService.queryByBoss(pager, empName,secondlevel,pass, hasPass,startBegin,startEnd,endBegin,endEnd,beginLeave,endLeave,sort,order);
					pager.setTotal(empleaveService.countByBoss( empName,secondlevel,  pass, hasPass, startBegin,startEnd,endBegin,endEnd,beginLeave,endLeave));
				}else{//是上司查下属
					if(hasPass==null||hasPass.equals("")){//未审核
					}else if(hasPass.equals("0")){
						firstlevel = "0";
					}else if(hasPass.equals("1")){//已审核
						firstlevel  = "1";//
						hasPass=null;pass=null;
					}
					empleaveService.queryByDept(pager, employee.getDepartment().getDepId(), null, empName, firstlevel, pass,hasPass, startBegin,startEnd,endBegin,endEnd,beginLeave,endLeave,sort,order);
					pager.setTotal(empleaveService.countByDept(employee.getDepartment().getDepId(),  null,empName, firstlevel,  pass, hasPass, startBegin,startEnd,endBegin,endEnd,beginLeave,endLeave));
				}
			}else{
				pagerById(request,employee);
			}
			rows = pager.getRows();
			total = (int) pager.getTotal();
		}else{
			pagerById(request,employee);
			reqMsg=ControllerRequest.getFailRequest("权限不足,请联系管理员");
		}
/*		total = (int) pager.getTotal();
*/		return "pager";
	}
	
	public void pagerById(HttpServletRequest request,Employee employee){
		String pass = request.getParameter("pass");//有已审核,与未审核
		String status = request.getParameter("status");
		String hasPass= request.getParameter("hasPass");//判断是否过滤审核
		String startBegin = ""; //假期开始 开始
		String startEnd = ""; //假期开始 结束
		String endBegin = ""; //假期结束 开始
		String endEnd = ""; //假期结束 结束
		String beginLeave = request.getParameter("beginDate");//开始请假 开始
		String endLeave = request.getParameter("endDate");//开始请假 结束
		String order = request.getParameter("order");
		String sort = request.getParameter("sort");
		if(hasPass!=null&&!hasPass.equals("")){
			if(hasPass.equals("0")){//不过滤是否审核
			}else if(hasPass.equals("1")){//已审核
			}
		}else{
			hasPass = null; pass = null;
		}
		
		pager = new Pager4EasyUI<>();
		empleaveService.queryById(pager, employee.getEmpId(), pass,hasPass, startBegin,startEnd,endBegin,endEnd,beginLeave,endLeave,sort,order);
		pager.setTotal(
				empleaveService.countById(
						employee.getEmpId(), pass, hasPass,startBegin,startEnd,endBegin,endEnd,beginLeave,endLeave));
		empleaveService.updLeaveStatus(employee.getEmpId());
		rows = pager.getRows();
		total =(int) pager.getTotal();
	}
	
	public String showEmpleave(){
			return "showEmpleave";
	}
	
	public String doEmpleave(){
		return "doEmpleave";
	}
	public String seeEmpleave(){
		return "seeEmpleave";
	}
	/**
	 * 得到个人的申诉更新状态
	 * @return
	 */
	public String newStatus(){
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		countNewStatus=empleaveService.countNewStatus(employee.getEmpId());
		return "newStatus";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	
	
	/**
	 * get/set
	 */
	public Empleave getEmpleave() {
		return empleave;
	}

	public void setEmpleave(Empleave empleave) {
		this.empleave = empleave;
	}

	public int getTotal() {
		return total;
	}

	public List<EmpleaveInfo> getRows() {
		return rows;
	}

	public void setEmpleaveService(EmpleaveService empleaveService) {
		this.empleaveService = empleaveService;
	}
	
	public ControllerRequest getReqMsg() {
		return reqMsg;
	}
	

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	public String getSelf() {
		return self;
	}

	public void setSelf(String self) {
		this.self = self;
	}

	public int getCountNewStatus() {
		return countNewStatus;
	}

	public void setCountNewStatus(int countNewStatus) {
		this.countNewStatus = countNewStatus;
	}

}
