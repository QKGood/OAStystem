package com.oa.service;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.struts2.json.annotations.JSON;

import com.oa.bean.Check;
import com.oa.bean.info.EmpCheckInfo;
import com.oa.bean.info.EmpCheckingStatistics;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.TempDate;
import com.oa.common.web.WebUtil;
import com.oa.dao.EmpCheckDAO;

/**
 * 员工值班ServiceImpl
 * @author 程燕
 *
 */
public class EmpCheckServiceImpl implements EmpCheckService{
	private EmpCheckDAO empCheckDAO;
	@Override
	public Pager4EasyUI<EmpCheckInfo> pagerByMonth(Pager4EasyUI<EmpCheckInfo> pager, int month, String addType, String address,
			String empid,String empName, String sort,String order) {
		Date[] dates = TempDate.inMoth2Date(month);
		if(empName!=null&&!empName.equals("")){empName = WebUtil.vague(empName);}
		return empCheckDAO.queryByPager(pager, dates[0],dates[1], addType, address, empid,empName, sort,order);
	}



	@Override
	public Pager4EasyUI<EmpCheckInfo> simpleQueryCheck(Pager4EasyUI<EmpCheckInfo> pager, String addType, String address, String empid,String empName, String beginDate ,String endDate,String sort,String order) {
		Calendar calendar=Calendar.getInstance();
		int month=calendar.get(Calendar.MONTH)+1;
		String name = "%";
		Date[] dates =TempDate.inMoth2Date(month);
		if(beginDate!=null && !beginDate.equals("")){dates[0]=WebUtil.str2Date(beginDate, "yyyy-MM-dd"); }
		if(endDate!=null && !endDate.equals("")){dates[1]=WebUtil.str2Date(endDate, "yyyy-MM-dd"); dates[1].setHours(23); dates[1].setMinutes(59);dates[1].setSeconds(59);}
		if(empName!=null&&!empName.equals("")){name = WebUtil.vague(empName);}
		return empCheckDAO.queryByPager(pager, dates[0],dates[1], addType, address, empid,name, sort,order);
	}
	
	@Override
	public int countByMonth( int month, String addType, String address,
			String empid,String empName) {
		Date[] dates = TempDate.inMoth2Date(month);
		if(empName!=null&&!empName.equals("")){empName = WebUtil.vague(empName);}
		return empCheckDAO.countNorm(dates[0],dates[1], addType, address, empid,empName);
	}




	@Override
	public int simpleCount( String addType, String address, String empid,String empName, String beginDate ,String endDate) {
		Calendar calendar=Calendar.getInstance();
		int month=calendar.get(Calendar.MONTH)+1;
		String name = "%";
		TempDate.inMoth2Date(month);
		Date[] dates = new Date[2];
		if(beginDate!=null && !beginDate.equals("")){dates[0]=WebUtil.str2Date(beginDate, "yyyy-MM-dd"); }
		if(endDate!=null && !endDate.equals("")){dates[1]=WebUtil.str2Date(endDate, "yyyy-MM-dd"); dates[1].setHours(23); dates[1].setMinutes(59);dates[1].setSeconds(59);}
		if(empName!=null&&!empName.equals("")){name = WebUtil.vague(empName);}
		return empCheckDAO.countNorm(dates[0],dates[1], addType, address, empid,name);
	}
	
	
	@JSON(serialize=false)
	public EmpCheckDAO getEmpCheckDAO() {
		return empCheckDAO;
	}

	public void setEmpCheckDAO(EmpCheckDAO empCheckDAO) {
		this.empCheckDAO = empCheckDAO;
	}



	@Override
	public Check save(Check t) {
		return empCheckDAO.save(t);
	}



	@Override
	public void delete(Check t) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void update(Check t) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public Check queryById(Class<?> clazz, Serializable id) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<Check> queryAll(Serializable beanName) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public Pager4EasyUI<Check> queryPager(String beanName, Pager4EasyUI<Check> pager) {
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




	

}
