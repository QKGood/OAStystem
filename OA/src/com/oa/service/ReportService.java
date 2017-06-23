package com.oa.service;

import java.util.Date;

import com.oa.bean.EmpFeedback;
import com.oa.bean.Report;
import com.oa.bean.info.ReportInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface ReportService  extends BaseService<Report>{
	/*public Pager4EasyUI<ReportInfo> baseQuery(Pager4EasyUI<ReportInfo> pager,String depid, String empid, Date beginDate, Date endDate, int status) ;*/
	public Pager4EasyUI<ReportInfo> queryById(Pager4EasyUI<ReportInfo> pager, String empid, String beginDateStr, String endDateStr, String status,String sort,String order);
	
	public Pager4EasyUI<ReportInfo> queryByDept(Pager4EasyUI<ReportInfo> pager,String depid, String empid,String empName, String beginDateStr, String endDateStr ,String status,String sort,String order);
	
	public Pager4EasyUI<ReportInfo> queryByBoss(Pager4EasyUI<ReportInfo> pager, String empName,String beginDateStr, String endDateStr, String status,String sort,String order);
	
	
	public int countById(String empid, String beginDateStr, String endDateStr, String status);
	
	public int countByDept(String depid, String empid,String empName, String beginDateStr, String endDateStr ,String status);
	
	public int countByBoss(String empName,String beginDateStr, String endDateStr, String status);
	
	/**
	 * 更新日志,限制当天
	 * @param reportid
	 * @param des
	 */
	public void updReport(String reportid, String des);
}
