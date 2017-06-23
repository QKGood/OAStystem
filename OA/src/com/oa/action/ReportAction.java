package com.oa.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.oa.bean.Employee;
import com.oa.bean.Report;
import com.oa.bean.info.ReportInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.dao.ReportDAO;
import com.oa.service.ReportService;
import com.opensymphony.xwork2.ActionSupport;

public class ReportAction extends BaseAction implements ServletRequestAware{
	private ReportService reportService;
	private Report report;
	private Pager4EasyUI<ReportInfo> pager ;
	private HttpServletRequest request;
	
	private final String className =this.getClass().getName();; 
	private ControllerRequest reqMsg;


	private int total;
	private List<ReportInfo> rows;
	
	public String save(){
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if(autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			report.setReportday(new Date());
			report.setStatus(1);
			report.setEmployee(employee);
			reportService.save(report);
			reqMsg = ControllerRequest.getSuccessRequest("日志添加成功");
		}else{
			reqMsg = ControllerRequest.getFailRequest("权限不足,请联系管理员");
		}
		return "save";
	}
	
	public String update(){
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if(autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			String reportid = request.getParameter("reportid");
			String des= request.getParameter("des");
			reportService.updReport(reportid, des);
		}else{
			reqMsg = ControllerRequest.getFailRequest("权限不足,请联系管理员");
		}
		return "update";
	}
	
	
	public String pager(){
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if(autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			String depid = request.getParameter("depid");
			String beginday = request.getParameter("beginDate");
			String endday = request.getParameter("endDate");
			String sort = request.getParameter("sort");
			String order = request.getParameter("order");
			String status = request.getParameter("status");
			String empName = request.getParameter("empName");
			String self = request.getParameter("self");
			
			pager = new Pager4EasyUI<ReportInfo>();
			pager.setPageNo(WebUtil.getPageNo(request));
			pager.setPageSize(WebUtil.getPageSize(request));
			/**
			 * 自己查
			 * 上司查
			 * 总经理查
			 */
			if(self==null||self.equals("")){
				if(employee.getRole().getName().equals("总经理")){//是总经理
					reportService.queryByBoss(pager,empName, beginday, endday, status, sort,order);
					pager.setTotal(reportService.countByBoss(empName,beginday, endday, status));
				}else{//是部门主任 
					reportService.queryByDept(pager, depid, null,empName, beginday, endday, status, sort,order);
					pager.setTotal(reportService.countByDept(depid, null,empName, beginday, endday, status));
				}
			}else{
				reportService.queryById(pager, employee.getEmpId(), beginday, endday, status, sort,order);
				pager.setTotal(reportService.countById(employee.getEmpId(), beginday, endday, status));

			}
			rows = pager.getRows();
			total = (int) pager.getTotal();
		}else{
			pagerById(request,employee);
		}
		return "pager";
	}
	
	private void pagerById(HttpServletRequest request,Employee employee){
		pager = new Pager4EasyUI<ReportInfo>();
		String beginday = request.getParameter("beginDate");
		String endday = request.getParameter("endDate");
		String sort = request.getParameter("sort");
		String order = request.getParameter("order");
		String status = request.getParameter("status");
		reportService.queryById(pager, employee.getEmpId(), beginday, endday, status, sort,order);
		pager.setTotal(reportService.countById(employee.getEmpId(), beginday, endday, status));
		rows = pager.getRows();
		total = (int) pager.getTotal();
	}

	
	
	public String showReport() {
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		Employee employee = (Employee) WebUtil.getSessionValue(request,"employee");
		if(autService.queryAuthority(employee.getRole().getRoleId(),actionName)){
			return "showReport";
		}
		return "error";
	}
	
	public String myReport(){
		return "myReport";
		
	}
	public String otherReport(){
		return "otherReport";
	}
	
	

	/**
	 * get/set
	 * @return
	 */
	public Report getReport() {
		return report;
	}

	public void setReport(Report report) {
		this.report = report;
	}

	public int getTotal() {
		return total;
	}

	public List<ReportInfo> getRows() {
		return rows;
	}

	public void setReportService(ReportService reportService) {
		this.reportService = reportService;
	}
	
	public ControllerRequest getReqMsg() {
		return reqMsg;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	

}
