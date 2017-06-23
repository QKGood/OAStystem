package com.oa.service;

import com.oa.bean.Empleave;
import com.oa.bean.info.EmpleaveInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface EmpleaveService extends BaseService<Empleave>{
	public Pager4EasyUI<EmpleaveInfo> queryById(Pager4EasyUI<EmpleaveInfo> pager,String empid,String pass,String hasPass,String startBegin,String startEnd,String endBegin,String endEnd,String beginLeave,String endLeave,String sort,String order);
	
	public Pager4EasyUI<EmpleaveInfo> queryByDept(Pager4EasyUI<EmpleaveInfo> pager,String depid, String empid ,String empName,String firstLevel,String pass,String hasPass,String startBegin,String startEnd,String endBegin,String endEnd,String beginLeave,String endLeave,String sort,String order);

	public Pager4EasyUI<EmpleaveInfo> queryByBoss(Pager4EasyUI<EmpleaveInfo> pager,String empName,String secondLevel,String pass,String hasPass,String startBegin,String startEnd,String endBegin,String endEnd,String beginLeave,String endLeave,String sort,String order);
	
	
	public int countById(String empid,String pass,String hasPass,String startBegin,String startEnd,String endBegin,String endEnd,String beginLeave,String endLeave);
	
	public int countByDept(String depid, String empid ,String empName,String firstLevel,String pass,String hasPass,String startBegin,String startEnd,String endBegin,String endEnd,String beginLeave,String endLeave);
	
	public int countByBoss(String empName,String secondLevel,String pass,String hasPass,String startBegin,String startEnd,String endBegin,String endEnd,String beginLeave,String endLeave);

	public int countNewStatus(String empId) ;
	
	/**
	 * 第一级与第二级审核
	 * @param leaveid
	 * @param pass
	 */
	public void baseUpdFirstLeave(String leaveid,String pass);
	
	public void baseUpdSecondLeave(String leaveid, String pass);
	/**
	 * 用户查看自己的状态时会更改消息状态
	 * @param empId
	 */
	public void updLeaveStatus(String empId);
	
}
