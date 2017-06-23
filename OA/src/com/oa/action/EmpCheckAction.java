package com.oa.action;

import java.sql.Time;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Check;
import com.oa.bean.Employee;
import com.oa.bean.Grade;
import com.oa.bean.Room;
import com.oa.bean.info.EmpCheckInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.TempDate;
import com.oa.common.web.WebUtil;
import com.oa.service.EmpCheckService;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 员工值班Action
 * @author 程燕
 *
 */
public class EmpCheckAction extends BaseAction implements ServletRequestAware{
	
	private EmpCheckService empCheckService;
	private Pager4EasyUI<EmpCheckInfo> pager = new Pager4EasyUI<EmpCheckInfo>();
	private Check check;
	


	private HttpServletRequest request;
	private ControllerRequest reqMsg;
	
	private int total;
	private List<EmpCheckInfo> rows;
	
	private final String className = this.getClass().getName();
	
	private final String WHE_ADDTYPE= "addType";
	private final String WHE_EMPID = "empId";
	private final String WHE_ADDID = "addId";
	private final String WHE_SORT = "sort";
	
	/**
	 * 没有权限的提示信息
	 */
	private String authorityMsg;

	public String pager(){
		authorityMsg= null;
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if(autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			String addType = "grade";
			String empid = request.getParameter("empId");
			String empName = request.getParameter("empName");
			String beginDate = request.getParameter("beginDate");
			String endDate = request.getParameter("endDate");
			String sort = request.getParameter("sort");
			String order = request.getParameter("order");
			String addId = request.getParameter("addId");
			
			Calendar calendar=Calendar.getInstance();
			int month=calendar.get(Calendar.MONTH)+1;
			
			pager.setPageNo(WebUtil.getPageNo(request));
			pager.setPageSize(WebUtil.getPageSize(request));
			if(request.getParameter(WHE_ADDTYPE)!=null && !request.getParameter(WHE_ADDTYPE).equals("")){//判断地址类型是否指定,指定则是 地址条件
				addType = request.getParameter(WHE_ADDTYPE);
			};
			if(request.getParameter(WHE_EMPID)!=null && !request.getParameter(WHE_EMPID).equals("")) {
				empid = request.getParameter(WHE_EMPID);
			}
			if((beginDate ==null || beginDate.equals(""))&&(endDate==null||endDate.equals("")) ){
					empCheckService.pagerByMonth(pager, month, addType, addId, empid, empName, sort, order);
					pager.setTotal(empCheckService.countByMonth(month, addType, addId, empid, empName));
			}else {
					empCheckService.simpleQueryCheck(pager, addType, addId, empid, empName, beginDate, endDate, sort, order);
					pager.setTotal(empCheckService.simpleCount( addType, addId, empid, empName, beginDate, endDate));
			}
			rows = pager.getRows();
			total = (int) pager.getTotal();
		}else{
			pagerById(employee);
		}
		return "pager";
	}
	
	public void pagerById(Employee employee){
		authorityMsg= null;
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		if(autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			String addType = "grade";
			String beginDate = request.getParameter("beginDate");
			String endDate = request.getParameter("endDate");
			String sort = request.getParameter("sort");
			String order = request.getParameter("order");
			String addId = request.getParameter("addId");
			
			Calendar calendar=Calendar.getInstance();
			int month=calendar.get(Calendar.MONTH)+1;
			
			pager.setPageNo(WebUtil.getPageNo(request));
			pager.setPageSize(WebUtil.getPageSize(request));
			if(request.getParameter(WHE_ADDTYPE)!=null && !request.getParameter(WHE_ADDTYPE).equals("")){//判断地址类型是否指定,指定则是 地址条件
				addType = request.getParameter(WHE_ADDTYPE);
			};
			if((beginDate ==null || beginDate.equals(""))&&(endDate==null||endDate.equals("")) ){
				empCheckService.pagerByMonth(pager, month, addType, addId, employee.getEmpId(), null, sort, order);
				pager.setTotal(empCheckService.countByMonth(month, addType, addId, employee.getEmpId(), null));
			}else {
				empCheckService.simpleQueryCheck(pager, addType, addId, employee.getEmpId(), null, beginDate, endDate, sort, order);
				pager.setTotal(empCheckService.simpleCount( addType, addId, employee.getEmpId(), null, beginDate, endDate));
			}
			rows = pager.getRows();
			total = (int) pager.getTotal();
		}else{
			reqMsg = ControllerRequest.getFailRequest("权限不足,请联系管理员");
		}
	}
	
	public String showCheck() {
		authorityMsg= null;
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if(autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			return "showCheck";
		}
		return "error";
	}
	
	

	public String save(){
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if(autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			String[] checkAddType= request.getParameterValues("checkType");//巡查地点类型
			String checkAddId = request.getParameter("checkAddId");//巡查地址id
			String checkTimeStr = request.getParameter("checkTime")+":00";
			Date curDate = new Date();
			String curDateStr = TempDate.date2Str(curDate);
			Date checkTime = WebUtil.str2Date(curDateStr+" " + checkTimeStr,"yyyy-MM-dd HH:mm:ss");
			String weekDay = TempDate.date2Week(curDate);
			String checkAdd = checkAddType[0];
			if(checkAdd.equals("grade")){//教室巡查
				Grade grade = new Grade();
				grade.setGradeId(checkAddId);
				check.setGrade(grade);
			}else if(checkAdd.equals("room")){//宿舍巡查
				Room room = new Room();
				room.setRoomId(checkAddId);
				check.setRoom(room);
			}
			check.setWeekday(weekDay);
			check.setCheckTime(new Time(checkTime.getTime()));
			check.setEmployee(employee);
			empCheckService.save(check);
			reqMsg = ControllerRequest.getSuccessRequest("添加巡查记录成功");
		}else{
			return "error";
		}
		return "save";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	
	/**
	 * get/set
	 */
	public void setEmpCheckService(EmpCheckService empCheckService) {
		this.empCheckService = empCheckService;
	}
	
	public int getTotal() {
		return total;
	}

	public List<EmpCheckInfo> getRows() {
		return rows;
	}
	
	public Check getCheck() {
		return check;
	}

	public void setCheck(Check check) {
		this.check = check;
	}
	
	public ControllerRequest getReqMsg() {
		return reqMsg;
	}
}
