package com.oa.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.oa.bean.Department;
import com.oa.bean.Employee;
import com.oa.bean.info.EmpBaseInfo;
import com.oa.common.bean.Pager4EasyUI;

public interface EmployeeService extends BaseService<Employee>{
	public Employee login(Employee emp);
	
	/**
	 * 所有角色
	 * @return
	 */
	public Object[] allRoles();
	
	/**
	 * 所有员工
	 * @return
	 */
	public Object[] allEmps() ;
	
	/**
	 * 把角色设置给某个员工
	 * @param rolename
	 * @param empid
	 */
	public void giveRole2Emp(String rolename, String empid);
	/**
	 * 查询某个部门的某角色(用于查管理者)
	 * @param rolename
	 * @param depid
	 * @return 经理id
	 */
	public String queryEmpByRole(String rolename,String depid);
	public String queryRoleIdByRoleName(String rolename);
	/**
	 * 计数部门员工
	 * @param deptid
	 * @return
	 */
	public int countEmpsByDept(String deptid);
	
	/**
	 * update
	 * @param empid
	 * @param pwd
	 * @param email
	 * @param phone
	 * @param qq
	 * @param wechat
	 * @param address
	 */
	public void selfUpdate(Employee employee);
	public void otherUpdate(String empid,String depid, String roleid, String contactname,String contactphone,String bankname,String accountname,String accountno,String alipay,int status);
	
	
	public void updPwd(String empId, String pwd); 
	public void otherStatusUpdate(String empid,int status);
	
	
	public Pager4EasyUI<EmpBaseInfo> queryByDepWhe(Pager4EasyUI<EmpBaseInfo> pager,String depId, String empName,String beginDate,String endDate, String status,String sort, String order);
	public Pager4EasyUI<EmpBaseInfo> queryByAllWhe(Pager4EasyUI<EmpBaseInfo> pager,String empName,String beginDate,String endDate, String status,String sort, String order);
	/**
	 * countByDepWhe 对应于 queryByDepWhe
	 * countByAllWhe 对应于 queryByAllWhe
	 * @return
	 */
	public int countByDepWhe(String depId, String empName,String beginDate,String endDate, String status);
	public int countByAllWhe(String empName,String beginDate,String endDate, String status);

	/**
	 * 其他人要用,不要删
	 * @param pager
	 * @param deptId
	 * @return
	 */
	public Pager4EasyUI<EmpBaseInfo> queryEmpByDept(Pager4EasyUI<EmpBaseInfo> pager,String deptId);
	
	/**
	 * 
	 * @param phone 添加员工时需要检查手机号是否重复
	 * @return 拥有该手机号的员工
	 */
	public int checkRegister(String phone);
	
}
