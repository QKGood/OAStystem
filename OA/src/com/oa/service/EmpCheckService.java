package com.oa.service;

import java.util.Date;

import com.oa.bean.Check;
import com.oa.bean.info.EmpCheckInfo;
import com.oa.bean.info.EmpCheckingStatistics;
import com.oa.common.bean.Pager4EasyUI;

/**
 * 员工值班Service
 * @author 程燕
 *
 */
public interface EmpCheckService extends BaseService<Check>{
	/**
	 * 月查
	 * @param pager
	 * @param month
	 * @param addType
	 * @param address
	 * @param empid
	 * @param empName
	 * @param sort
	 * @param order
	 * @return
	 */
	public Pager4EasyUI<EmpCheckInfo> pagerByMonth(Pager4EasyUI<EmpCheckInfo> pager,int month,String addType ,String address, String empid,String empName,String sort,String order);
	
	/**
	 * 条件查
	 * @param pager
	 * @param addType
	 * @param address
	 * @param empid
	 * @param empName
	 * @param beginDate
	 * @param endDate
	 * @param sort
	 * @param order
	 * @return
	 */
	public Pager4EasyUI<EmpCheckInfo> simpleQueryCheck(Pager4EasyUI<EmpCheckInfo> pager, String addType, String address, String empid,String empName, String beginDate ,String endDate,String sort,String order);

	
	public int countByMonth( int month, String addType, String address,String empid,String empName);
	public int simpleCount( String addType, String address, String empid,String empName, String beginDate ,String endDate); 
}
