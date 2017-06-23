package com.oa.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.oa.bean.Empleave;
import com.oa.bean.info.EmpappealInfo;
import com.oa.bean.info.EmpleaveInfo;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.dao.EmpleaveDAO;

public class EmpleaveServiceImpl implements EmpleaveService{
	private Date startBeginDate  = null;
	private Date startEndDate = null;
	private Date endBeginDate = null;
	private Date endEndDate = null;
	private Date LeaveBeginDate = null;
	private Date LeaveEndDate = null;
	
	private EmpleaveDAO empleaveDAO;
	public void setEmpleaveDAO(EmpleaveDAO empleaveDAO) {
		this.empleaveDAO = empleaveDAO;
	}

	/**
	 * Base
	 */
	@Override
	public Empleave save(Empleave t) {
		return empleaveDAO.save(t);
	}

	@Override
	public void delete(Empleave t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Empleave t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Empleave queryById(Class<?> clazz, Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Empleave> queryAll(Serializable beanName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<Empleave> queryPager(String beanName, Pager4EasyUI<Empleave> pager) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long count(Serializable beanName) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * 需求方法
	 */
	
	
/*	@Override
	public Pager4EasyUI<EmpleaveInfo> queryById(Pager4EasyUI<EmpleaveInfo> pager, String empid, String pass,
			String hasPass, String startBegin, String startEnd, String endBegin, String endEnd, String beginLeave,
			String endLeave) {
		if(startBegin!=null&&!startBegin.equals("")){		startBeginDate= WebUtil.str2Date(startBegin, "yyyy-MM-dd");	}else {startBeginDate= null;}
		if(startEnd!=null&&!startEnd.equals("")){		startEndDate= WebUtil.str2Date(startEnd, "yyyy-MM-dd");	}else{startEndDate=null;}
		if(endBegin!=null&&!endBegin.equals("")){		endBeginDate= WebUtil.str2Date(endBegin, "yyyy-MM-dd");	}else {endBeginDate= null;}
		if(endEnd!=null&&!endEnd.equals("")){		endEndDate= WebUtil.str2Date(endEnd, "yyyy-MM-dd");	}else {endEndDate=null;}
		if(beginLeave!=null&&!beginLeave.equals("")){		LeaveBeginDate= WebUtil.str2Date(beginLeave, "yyyy-MM-dd");	}else {LeaveBeginDate=null;}
		if(endLeave!=null&&!endLeave.equals("")){		LeaveEndDate= WebUtil.str2Date(endLeave, "yyyy-MM-dd");	}else {LeaveEndDate=null;}
		empleaveDAO.baseQuery(pager,null,empid,null,null,pass,hasPass,null,startBeginDate,startEndDate,endBeginDate,endEndDate,LeaveBeginDate,LeaveEndDate);
		return pager;
	}

	@Override
	public Pager4EasyUI<EmpleaveInfo> queryByBoss(Pager4EasyUI<EmpleaveInfo> pager, String secondLevel,
			String hasSecond, String pass, String hasPass, String startBegin, String startEnd, String endBegin,
			String endEnd, String beginLeave, String endLeave) {
		if(startBegin!=null&&!startBegin.equals("")){		startBeginDate= WebUtil.str2Date(startBegin, "yyyy-MM-dd");	}else {startBeginDate= null;}
		if(startEnd!=null&&!startEnd.equals("")){		startEndDate= WebUtil.str2Date(startEnd, "yyyy-MM-dd");	}else{startEndDate=null;}
		if(endBegin!=null&&!endBegin.equals("")){		endBeginDate= WebUtil.str2Date(endBegin, "yyyy-MM-dd");	}else {endBeginDate= null;}
		if(endEnd!=null&&!endEnd.equals("")){		endEndDate= WebUtil.str2Date(endEnd, "yyyy-MM-dd");	}else {endEndDate=null;}
		if(beginLeave!=null&&!beginLeave.equals("")){		LeaveBeginDate= WebUtil.str2Date(beginLeave, "yyyy-MM-dd");	}else {LeaveBeginDate=null;}
		if(endLeave!=null&&!endLeave.equals("")){		LeaveEndDate= WebUtil.str2Date(endLeave, "yyyy-MM-dd");	}else {LeaveEndDate=null;}
		empleaveDAO.baseQuery(pager,null,null,null,secondLevel,pass,hasPass,null,startBeginDate,startEndDate,endBeginDate,endEndDate,LeaveBeginDate,LeaveEndDate);
		return pager;
	}

	@Override
	public Pager4EasyUI<EmpleaveInfo> queryByDept(Pager4EasyUI<EmpleaveInfo> pager, String depid, String empid,
			String firstLevel, String hasFirst, String pass, String hasPass, String startBegin, String startEnd,
			String endBegin, String endEnd, String beginLeave, String endLeave) {
		if(startBegin!=null&&!startBegin.equals("")){		startBeginDate= WebUtil.str2Date(startBegin, "yyyy-MM-dd");	}else {startBeginDate= null;}
		if(startEnd!=null&&!startEnd.equals("")){		startEndDate= WebUtil.str2Date(startEnd, "yyyy-MM-dd");	}else{startEndDate=null;}
		if(endBegin!=null&&!endBegin.equals("")){		endBeginDate= WebUtil.str2Date(endBegin, "yyyy-MM-dd");	}else {endBeginDate= null;}
		if(endEnd!=null&&!endEnd.equals("")){		endEndDate= WebUtil.str2Date(endEnd, "yyyy-MM-dd");	}else {endEndDate=null;}
		if(beginLeave!=null&&!beginLeave.equals("")){		LeaveBeginDate= WebUtil.str2Date(beginLeave, "yyyy-MM-dd");	}else {LeaveBeginDate=null;}
		if(endLeave!=null&&!endLeave.equals("")){		LeaveEndDate= WebUtil.str2Date(endLeave, "yyyy-MM-dd");	}else {LeaveEndDate=null;}
		empleaveDAO.baseQuery(pager,depid,empid,firstLevel,null,pass,hasPass,null,startBeginDate,startEndDate,endBeginDate,endEndDate,LeaveBeginDate,LeaveEndDate);

		return pager;
	}*/

	
	
	@Override
	public Pager4EasyUI<EmpleaveInfo> queryById(Pager4EasyUI<EmpleaveInfo> pager, String empid, String pass,
			String hasPass, String startBegin, String startEnd, String endBegin, String endEnd, String beginLeave,
			String endLeave,String sort,String order) 	{
		if(startBegin!=null&&!startBegin.equals(""))	{		startBeginDate= WebUtil.str2Date(startBegin, "yyyy-MM-dd");	}else {startBeginDate= null;}
		if(startEnd!=null&&!startEnd.equals(""))		{		startEndDate= WebUtil.str2Date(startEnd, "yyyy-MM-dd");		startEndDate.setHours(23); 		startEndDate.setMinutes(59);	startEndDate.setSeconds(59);}else{startEndDate=null;}
		if(endBegin!=null&&!endBegin.equals(""))		{		endBeginDate= WebUtil.str2Date(endBegin, "yyyy-MM-dd");		}else {endBeginDate= null;}
		if(endEnd!=null&&!endEnd.equals(""))			{		endEndDate= WebUtil.str2Date(endEnd, "yyyy-MM-dd");			endEndDate.setHours(23); 		endEndDate.setMinutes(59);		endEndDate.setSeconds(59);}else {endEndDate=null;}
		if(beginLeave!=null&&!beginLeave.equals(""))	{		LeaveBeginDate= WebUtil.str2Date(beginLeave, "yyyy-MM-dd");	}else {LeaveBeginDate=null;}
		if(endLeave!=null&&!endLeave.equals(""))		{		LeaveEndDate= WebUtil.str2Date(endLeave, "yyyy-MM-dd");		LeaveEndDate.setHours(23); 		LeaveEndDate.setMinutes(59);	LeaveEndDate.setSeconds(59);}else {LeaveEndDate=null;}
		empleaveDAO.baseQuery(pager,null,empid,null,null,null,pass,hasPass,null,startBeginDate,startEndDate,endBeginDate,endEndDate,LeaveBeginDate,LeaveEndDate,sort,order);
		return pager;
	}

	@Override
	public Pager4EasyUI<EmpleaveInfo> queryByBoss(Pager4EasyUI<EmpleaveInfo> pager,String empName, String secondLevel,
			 String pass, String hasPass, String startBegin, String startEnd, String endBegin,
			String endEnd, String beginLeave, String endLeave,String sort,String order) {
		if(startBegin!=null&&!startBegin.equals(""))	{		startBeginDate= WebUtil.str2Date(startBegin, "yyyy-MM-dd");	}else {startBeginDate= null;}
		if(startEnd!=null&&!startEnd.equals(""))		{		startEndDate= WebUtil.str2Date(startEnd, "yyyy-MM-dd");		startEndDate.setHours(23); 		startEndDate.setMinutes(59);	startEndDate.setSeconds(59);}else{startEndDate=null;}
		if(endBegin!=null&&!endBegin.equals(""))		{		endBeginDate= WebUtil.str2Date(endBegin, "yyyy-MM-dd");		}else {endBeginDate= null;}
		if(endEnd!=null&&!endEnd.equals(""))			{		endEndDate= WebUtil.str2Date(endEnd, "yyyy-MM-dd");			endEndDate.setHours(23); 		endEndDate.setMinutes(59);		endEndDate.setSeconds(59);}else {endEndDate=null;}
		if(beginLeave!=null&&!beginLeave.equals(""))	{		LeaveBeginDate= WebUtil.str2Date(beginLeave, "yyyy-MM-dd");	}else {LeaveBeginDate=null;}
		if(endLeave!=null&&!endLeave.equals(""))		{		LeaveEndDate= WebUtil.str2Date(endLeave, "yyyy-MM-dd");		LeaveEndDate.setHours(23); 		LeaveEndDate.setMinutes(59);	LeaveEndDate.setSeconds(59);}else {LeaveEndDate=null;}
		if(empName!=null&&!empName.equals(""))			{		empName = WebUtil.vague(empName);}
		empleaveDAO.baseQuery(pager,null,null,empName,"1",secondLevel,pass,hasPass,null,startBeginDate,startEndDate,endBeginDate,endEndDate,LeaveBeginDate,LeaveEndDate,sort,order);
		return pager;
	}

	@Override
	public Pager4EasyUI<EmpleaveInfo> queryByDept(Pager4EasyUI<EmpleaveInfo> pager, String depid, String empid,
			String empName,String firstLevel, String pass, String hasPass, String startBegin, String startEnd,
			String endBegin, String endEnd, String beginLeave, String endLeave,String sort,String order) {
		if(startBegin!=null&&!startBegin.equals(""))	{		startBeginDate= WebUtil.str2Date(startBegin, "yyyy-MM-dd"); }else {startBeginDate= null;}
		if(startEnd!=null&&!startEnd.equals(""))		{		startEndDate= WebUtil.str2Date(startEnd, "yyyy-MM-dd");		startEndDate.setHours(23); 		startEndDate.setMinutes(59);	startEndDate.setSeconds(59);}else{startEndDate=null;}
		if(endBegin!=null&&!endBegin.equals(""))		{		endBeginDate= WebUtil.str2Date(endBegin, "yyyy-MM-dd");		}else {endBeginDate= null;}
		if(endEnd!=null&&!endEnd.equals(""))			{		endEndDate= WebUtil.str2Date(endEnd, "yyyy-MM-dd");			endEndDate.setHours(23); 		endEndDate.setMinutes(59);		endEndDate.setSeconds(59);}else {endEndDate=null;}
		if(beginLeave!=null&&!beginLeave.equals(""))	{		LeaveBeginDate= WebUtil.str2Date(beginLeave, "yyyy-MM-dd");	}else {LeaveBeginDate=null;}
		if(endLeave!=null&&!endLeave.equals(""))		{		LeaveEndDate= WebUtil.str2Date(endLeave, "yyyy-MM-dd");		LeaveEndDate.setHours(23); 		LeaveEndDate.setMinutes(59);	LeaveEndDate.setSeconds(59);}else {LeaveEndDate=null;}
		if(empName!=null&&!empName.equals(""))			{		empName = WebUtil.vague(empName);}
		empleaveDAO.baseQuery(pager,depid,empid,empName,firstLevel,null,pass,hasPass,null,startBeginDate,startEndDate,endBeginDate,endEndDate,LeaveBeginDate,LeaveEndDate,sort,order);

		return pager;
	}
	
	
	
	
	
	@Override
	public int countById(String empid, String pass, String hasPass, String startBegin, String startEnd, String endBegin,
			String endEnd, String beginLeave, String endLeave) {
		if(startBegin!=null&&!startBegin.equals(""))	{		startBeginDate= WebUtil.str2Date(startBegin, "yyyy-MM-dd"); }else {startBeginDate= null;}
		if(startEnd!=null&&!startEnd.equals(""))		{		startEndDate= WebUtil.str2Date(startEnd, "yyyy-MM-dd");		startEndDate.setHours(23); 		startEndDate.setMinutes(59);	startEndDate.setSeconds(59);}else{startEndDate=null;}
		if(endBegin!=null&&!endBegin.equals(""))		{		endBeginDate= WebUtil.str2Date(endBegin, "yyyy-MM-dd");		}else {endBeginDate= null;}
		if(endEnd!=null&&!endEnd.equals(""))			{		endEndDate= WebUtil.str2Date(endEnd, "yyyy-MM-dd");			endEndDate.setHours(23); 		endEndDate.setMinutes(59);		endEndDate.setSeconds(59);}else {endEndDate=null;}
		if(beginLeave!=null&&!beginLeave.equals(""))	{		LeaveBeginDate= WebUtil.str2Date(beginLeave, "yyyy-MM-dd");	}else {LeaveBeginDate=null;}
		if(endLeave!=null&&!endLeave.equals(""))		{		LeaveEndDate= WebUtil.str2Date(endLeave, "yyyy-MM-dd");		LeaveEndDate.setHours(23); 		LeaveEndDate.setMinutes(59);	LeaveEndDate.setSeconds(59);}else {LeaveEndDate=null;}
		return empleaveDAO.baseCount(null,empid,null,null,null,pass,hasPass,null,startBeginDate,startEndDate,endBeginDate,endEndDate,LeaveBeginDate,LeaveEndDate);
	}
	
	
	@Override
	public int countByDept(String depid, String empid, String empName,String firstLevel,  String pass, String hasPass,
			String startBegin, String startEnd, String endBegin, String endEnd, String beginLeave, String endLeave) {
		if(startBegin!=null&&!startBegin.equals(""))	{		startBeginDate= WebUtil.str2Date(startBegin, "yyyy-MM-dd"); 	}else {startBeginDate= null;}
		if(startEnd!=null&&!startEnd.equals(""))		{		startEndDate= WebUtil.str2Date(startEnd, "yyyy-MM-dd");		startEndDate.setHours(23); 		startEndDate.setMinutes(59);	startEndDate.setSeconds(59);}else{startEndDate=null;}
		if(endBegin!=null&&!endBegin.equals(""))		{		endBeginDate= WebUtil.str2Date(endBegin, "yyyy-MM-dd");		}else {endBeginDate= null;}
		if(endEnd!=null&&!endEnd.equals(""))			{		endEndDate= WebUtil.str2Date(endEnd, "yyyy-MM-dd");			endEndDate.setHours(23); 		endEndDate.setMinutes(59);		endEndDate.setSeconds(59);}else {endEndDate=null;}
		if(beginLeave!=null&&!beginLeave.equals(""))	{		LeaveBeginDate= WebUtil.str2Date(beginLeave, "yyyy-MM-dd");	}else {LeaveBeginDate=null;}
		if(endLeave!=null&&!endLeave.equals(""))		{		LeaveEndDate= WebUtil.str2Date(endLeave, "yyyy-MM-dd");		LeaveEndDate.setHours(23); 		LeaveEndDate.setMinutes(59);	LeaveEndDate.setSeconds(59);}else {LeaveEndDate=null;}		if(empName!=null&&!empName.equals(""))			{ 		empName = WebUtil.vague(empName);}
		return empleaveDAO.baseCount(depid,empid,empName,firstLevel,null,pass,hasPass,null,startBeginDate,startEndDate,endBeginDate,endEndDate,LeaveBeginDate,LeaveEndDate);
	}

	@Override
	public int countByBoss(String empName,String secondLevel,String pass, String hasPass, String startBegin,
			String startEnd, String endBegin, String endEnd, String beginLeave, String endLeave) {
		if(startBegin!=null&&!startBegin.equals(""))	{		startBeginDate= WebUtil.str2Date(startBegin, "yyyy-MM-dd"); 	}else {startBeginDate= null;}
		if(startEnd!=null&&!startEnd.equals(""))		{		startEndDate= WebUtil.str2Date(startEnd, "yyyy-MM-dd");		startEndDate.setHours(23); 		startEndDate.setMinutes(59);	startEndDate.setSeconds(59);}else{startEndDate=null;}
		if(endBegin!=null&&!endBegin.equals(""))		{		endBeginDate= WebUtil.str2Date(endBegin, "yyyy-MM-dd");		}else {endBeginDate= null;}
		if(endEnd!=null&&!endEnd.equals(""))			{		endEndDate= WebUtil.str2Date(endEnd, "yyyy-MM-dd");			endEndDate.setHours(23); 		endEndDate.setMinutes(59);		endEndDate.setSeconds(59);}else {endEndDate=null;}
		if(beginLeave!=null&&!beginLeave.equals(""))	{		LeaveBeginDate= WebUtil.str2Date(beginLeave, "yyyy-MM-dd");	}else {LeaveBeginDate=null;}
		if(endLeave!=null&&!endLeave.equals(""))		{		LeaveEndDate= WebUtil.str2Date(endLeave, "yyyy-MM-dd");		LeaveEndDate.setHours(23); 		LeaveEndDate.setMinutes(59);	LeaveEndDate.setSeconds(59);}else {LeaveEndDate=null;}		if(empName!=null&&!empName.equals(""))			{		empName = WebUtil.vague(empName);}
		return empleaveDAO.baseCount(null,null,empName,"1",secondLevel,pass,hasPass,null,startBeginDate,startEndDate,endBeginDate,endEndDate,LeaveBeginDate,LeaveEndDate);
	}

	@Override
	public void baseUpdFirstLeave(String leaveid, String pass) {
		int status = 0;
		if(pass.equals("1")){//不通过,驳回,状态需要改变
			status= 1;
		}else{
			pass= "0";
		}
		empleaveDAO.baseUpdFirstLeave(leaveid, Integer.valueOf(pass), status);
	}

	@Override
	public void baseUpdSecondLeave(String leaveid, String pass) {
		empleaveDAO.baseUpdSecondLeave(leaveid, Integer.valueOf(pass));
	}

	@Override
	public int countNewStatus(String empId) {
		return empleaveDAO.countNewStatus(empId);
	}

	@Override
	public void updLeaveStatus(String empId){
		empleaveDAO.updLeaveStatus(empId);
	}

	
	
	
	

}