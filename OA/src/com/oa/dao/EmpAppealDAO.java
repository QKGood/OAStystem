package com.oa.dao;

import java.util.Date;

import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.oa.bean.Duty;
import com.oa.bean.Empappeal;
import com.oa.bean.info.EmpappealInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface EmpAppealDAO  extends BaseDAO<Empappeal> {
	public Pager4EasyUI<EmpappealInfo> baseQuery(Pager4EasyUI<EmpappealInfo> pager,String depId,String empId,String empName, String firstlevel, String secondlevel, String pass,String hasPass, String status,Date beginDay,Date endDay,String sort, String order);
	/**
	 * 计数唯一的那个查询
	 * @param depId
	 * @param empId
	 * @param firstlevel
	 * @param secondlevel
	 * @param pass
	 * @param hasPass
	 * @param status
	 * @param beginDay
	 * @param endDay
	 * @return
	 */
	public int baseCount(String depId,String empId,String empName, String firstlevel, String secondlevel, String pass,String hasPass, String status,Date beginDay,Date endDay);

	public void updateLevel(String appealId,String firstlevel,String secondlevel,String pass);
	
	/**
	 * 统计出员工目前没有看过的通过审核的信息
	 * @param empId	员工id
	 * @return
	 */
	public int countNewStatus(String empId);
	
	/**
	 * 更新员工的申诉查看状态,如果员工查看了自己的,则status(leave中的)为0
	 * @param empId
	 */
	public void updLeaveStatus(String empId);
	
}
