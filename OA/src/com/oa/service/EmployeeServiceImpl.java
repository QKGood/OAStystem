package com.oa.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.json.annotations.JSON;

import com.oa.bean.Department;
import com.oa.bean.Employee;
import com.oa.bean.Role;
import com.oa.bean.info.EmpBaseInfo;
import com.oa.common.bean.EncryptUtil;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.TempDate;
import com.oa.common.web.WebUtil;
import com.oa.dao.EmployeeDAO;
import com.oa.service.info.DepEmpServiceInfo;

public class EmployeeServiceImpl implements EmployeeService{
	private EmployeeDAO employeeDAO;
	private DepEmpServiceInfo depEmpServiceInfo;
	private DepartmentService departmentService;

	@Override
	public Employee save(Employee t) {
		t.setPwd(EncryptUtil.encrypt(t.getPwd()));
		return employeeDAO.save(t);
	}

	@Override
	public void delete(Employee t) {
		employeeDAO.delete(t);
	}

	@Override
	public void update(Employee t) {
		
		/**
		 * 修改员工信息步骤:
		 * 	1,部门与身份的确认(以员工id查询该员工原来所在的部门,
		 * 	2,现在的部门与角色(对比部门
		 * 		2.1:如果部门不一样,查看是否是原来部门的经理
		 * 			2.1.2 是:把原来部门的经理设为空
		 *   		2.1.3否:修改员工信息
		 *      2.2:如果部门一样,查看角色是否是经理
		 *      	2.2.1 是:原来是经理,现在不是经理
		 *      		2.2.1.2 是:修改部门表,并修改员工信息
		 *      		2.2.1.3否:修改员工信息
		 *        
		 */
		String oldDepId = departmentService.queryDepidByEmp(t.getEmpId());	//旧部门的管理员是这个人
		String oldDepNorId = departmentService.queryDepidByEmpNor(t.getEmpId());
		String oldDepName = departmentService.queryDepNameByDepId(oldDepNorId);	//旧部门名
		String oldBossRoleName = departmentService.managerRoleName(oldDepName);	//旧部门管理角色名
		String oldBossRoleId = depEmpServiceInfo.queryRole(oldBossRoleName).getRoleId();//旧部门管理员角色id
		List<String> oldNorRoleName=  departmentService.normRoleName(oldDepName);	//旧部门普通角色名
		List<String> oldNorRoleId = new ArrayList<String>();						//旧部门管理角色名
		for(int i = 0,len = oldNorRoleName.size();i<len; i++){
			Role role =depEmpServiceInfo.queryRole(oldNorRoleName.get(i));
			oldNorRoleId.add(role.getRoleId());
		}
		
		Role newRole = depEmpServiceInfo.queryRole(t.getRole().getName());		
		
		String newDepId =  departmentService.queryDepIdByDepName(t.getDepartment().getName());	//新部门id
		String newDepName = departmentService.queryDepNameByDepId(newDepId);//新部门名
		String newBossRoleName = departmentService.managerRoleName(newDepName);//新部门管理员角色名
		String newBossRoleId = depEmpServiceInfo.queryRole(newBossRoleName).getRoleId();//新部门管理员角色id
		List<String> newNorRoleName=  departmentService.normRoleName(newDepName);//新部门普通角色名
		for(int i = 0,len = newNorRoleName.size();i<len; i++){
			newNorRoleName.add(depEmpServiceInfo.queryRole(newNorRoleName.get(i)).getRoleId());
		}
		
		if(oldDepId!=null){//该员工原来是经理
			if(oldDepId.equals(newDepId)) {//如果是,该部门是员工旧部门;员工没有换部门
				if(t.getRole().getName().equals(newBossRoleName)){//如果员工新的职位是经理,也就是说,部门与职位没有变化
					employeeDAO.updBaseEmp(t);
				}else {//部门还是原来的,但是职位不同,所以旧部门的经理位置为空
					departmentService.giveDeptEmp(oldDepId,null);
					otherUpdate(t.getEmpId(),newDepId, newRole.getRoleId(), t.getContactName(), t.getContactPhone(), t.getBankName(), t.getAccountName(), t.getAccountNo(), t.getAlipay(),t.getStatus());
				}
				
			}else {//换了新部门
				if(t.getRole().getName().equals(newBossRoleName)) {	//判断是否是经理,是经理则查看原来部门是否有经理
					String newdepOldBoss = queryEmpByRole(newBossRoleName,newDepId);//查出新部门旧管理员的id
					depEmpServiceInfo.queryRole(newBossRoleId).getRoleId();
					
					if(newdepOldBoss != null && !newdepOldBoss.equals("")){//新进的部门有经理
						departmentService.giveDeptEmp(oldDepId,null);//把旧部门的经理位置空出来
						departmentService.giveDeptEmp(newDepId,null);//把新部门的经理位置空出来
						giveRole2Emp(newNorRoleName.get(0),newdepOldBoss);//把原来的经理设为普通
						departmentService.giveDeptEmp(newDepId,t.getEmpId());
						otherUpdate(t.getEmpId(),newDepId, newRole.getRoleId(), t.getContactName(), t.getContactPhone(),t.getBankName(), t.getAccountName(), t.getAccountNo(), t.getAlipay(),t.getStatus());//更新自己的信息
					}
				}else {
					departmentService.giveDeptEmp(oldDepId,null);
					otherUpdate(t.getEmpId(),newDepId, newRole.getRoleId(), t.getContactName(), t.getContactPhone(),t.getBankName(), t.getAccountName(), t.getAccountNo(), t.getAlipay(),t.getStatus());
				}
			}
		}else{//该员工原来不是经理
			if(newRole.getRoleId().equals(newBossRoleId)){//员工现在是经理
				String newDepOldEmpId = queryEmpByRole(newBossRoleName,newDepId);//查看部门是否有经理
				if(newDepOldEmpId!=null){	//原来该部门是有经理的
					giveRole2Emp(newNorRoleName.get(0),newDepOldEmpId);//把原来的经理设为普通
					departmentService.giveDeptEmp(newDepId,t.getEmpId());//设置部门新经理
					otherUpdate(t.getEmpId(),newDepId, newRole.getRoleId(), t.getContactName(), t.getContactPhone(), t.getBankName(), t.getAccountName(), t.getAccountNo(), t.getAlipay(),t.getStatus());
				}else {//原来该部门是没有经理的
					departmentService.giveDeptEmp(newDepId,t.getEmpId());//设置部门新经理
					otherUpdate(t.getEmpId(),newDepId, newRole.getRoleId(), t.getContactName(), t.getContactPhone(),t.getBankName(), t.getAccountName(), t.getAccountNo(), t.getAlipay(),t.getStatus());
				}
			}else{//原来不是经理,现在也不是经理
				otherUpdate(t.getEmpId(),newDepId, newRole.getRoleId(), t.getContactName(), t.getContactPhone(),t.getBankName(), t.getAccountName(), t.getAccountNo(), t.getAlipay(),t.getStatus());
			}
		}
	}

	@Override
	public Employee queryById(Class<?> clazz, Serializable id) {
		return employeeDAO.queryById(clazz, id);
	}

	@Override
	public List<Employee> queryAll(Serializable beanName) {
		return employeeDAO.queryAll(beanName);
	}

	@Override
	public Pager4EasyUI<Employee> queryPager(String beanName, Pager4EasyUI<Employee> pager) {
		return employeeDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return employeeDAO.count(beanName);
	}
	
	@Override
	public Employee login(Employee emp) {
		return employeeDAO.login(emp);
	}


	@Override
	public Object[] allRoles() {
		return  employeeDAO.allRoles().toArray();
	}
	
	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		employeeDAO.updateStatus(beanName, beanId, status, id);
	}
	
	@Override
	public Object[] allEmps() {
		return employeeDAO.allEmps().toArray();
	}
	
	@Override
	public void giveRole2Emp(String rolename,String empid) {
		employeeDAO.giveRole2Emp(depEmpServiceInfo.queryRole(rolename).getRoleId(), empid);
	}
	

	@Override
	public String queryEmpByRole(String rolename, String depid) {//查看部门的经理,返回经理的id
		return employeeDAO.queryEmpByRole(depEmpServiceInfo.queryRole(rolename).getRoleId(), depid);
	}
	
	

	
	@Override
	public void selfUpdate(Employee employee) {
		employeeDAO.updBaseEmp(employee);
	}

	@Override
	public void otherUpdate(String empid,String depid, String roleid, String contactname, String contactphone, String bankname,
			String accountname, String accountno, String alipay,int status) {
		Employee e = new Employee(); Department d = new Department();Role role = new Role();
		d.setDepId(depid); role.setRoleId(roleid);
		e.setDepartment(d);e.setRole(role);e.setContactName(contactname);e.setContactPhone(contactphone);
		e.setEmpId(empid);
		e.setBankName(bankname);
		e.setAccountName(accountname);
		e.setAccountNo(accountno);
		e.setAlipay(alipay);
		e.setStatus(status);
		employeeDAO.updBaseEmp(e);
	}

	@Override
	public void otherStatusUpdate(String empid, int status) {
		Employee e = new Employee();
		e.setEmpId(empid);
		if(status==1) {
			e.setStatus(0); 
		}else {
			e.setStatus(1);
		}
		employeeDAO.updBaseEmp(e);
	}
	
	@Override
	public Pager4EasyUI<EmpBaseInfo> queryByDepWhe(Pager4EasyUI<EmpBaseInfo> pager, String depId, String empName,
			String beginDate, String endDate, String status,String sort, String order) {
		Date begin = null;	 Date end = null;		int statu = 1; String name= "%";

		if(beginDate!=null&&!beginDate.equals("")){	begin = WebUtil.str2Date(beginDate, "yyyy-MM-dd");}
		if(endDate!=null&&!endDate.equals("")){	end = WebUtil.str2Date(endDate, "yyyy-MM-dd");}
		if(empName!=null&&!empName.equals("")){name = WebUtil.vague(empName);}
		return employeeDAO.queryNorm(pager, depId, name, begin, end, status,sort,order);
	}

	@Override
	public Pager4EasyUI<EmpBaseInfo> queryByAllWhe(Pager4EasyUI<EmpBaseInfo> pager, String empName, String beginDate,
			String endDate, String status,String sort, String order) {
		Date begin = null;	 Date end = null;		int statu = 1; String name= "%";

		if(beginDate!=null&&!beginDate.equals("")){	begin = WebUtil.str2Date(beginDate, "yyyy-MM-dd");}
		if(endDate!=null&&!endDate.equals("")){	end = WebUtil.str2Date(endDate, "yyyy-MM-dd");}
		if(empName!=null&&!empName.equals("")){name = WebUtil.vague(empName);}
		return employeeDAO.queryNorm(pager, null , name, begin, end, status,sort,order);
	}
	
	/**
	 * 计数用
	 */
	public int countByDepWhe(String depId, String empName,String beginDate,String endDate, String status){
		Date begin = null;	 Date end = null;		int statu = 1; String name= "%";

		if(beginDate!=null&&!beginDate.equals("")){	begin = WebUtil.str2Date(beginDate, "yyyy-MM-dd");}
		if(endDate!=null&&!endDate.equals("")){	end = WebUtil.str2Date(endDate, "yyyy-MM-dd");}
		if(empName!=null&&!empName.equals("")){name = WebUtil.vague(empName);}
		return employeeDAO.countNorm( depId, name, begin, end, status);
	}
	public int countByAllWhe(String empName,String beginDate,String endDate, String status){
		Date begin = null;	 Date end = null;		int statu = 1; String name= "%";

		if(beginDate!=null&&!beginDate.equals("")){	begin = WebUtil.str2Date(beginDate, "yyyy-MM-dd");}
		if(endDate!=null&&!endDate.equals("")){	end = WebUtil.str2Date(endDate, "yyyy-MM-dd");}
		if(empName!=null&&!empName.equals("")){name = WebUtil.vague(empName);}
		return employeeDAO.countNorm( null , name, begin, end, status);
	}

	
	
	
	
	/**
	 * 其他人要用
	 */
	@Override
	public Pager4EasyUI<EmpBaseInfo> queryEmpByDept(Pager4EasyUI<EmpBaseInfo> pager, String deptId) {
		return employeeDAO.queryEmpByDept(pager, deptId);
	}
	/**
	 * 对应于queryEmpByDept
	 */
	@Override
	public int countEmpsByDept(String deptid) {
		return employeeDAO.countEmpsByDept(deptid);
	}
	
	
	/**
	 * 以下为get/set
	 * @return
	 */
	@JSON(serialize=false)
	public EmployeeDAO getEmployeeDAO() {
		return employeeDAO;
	}

	public void setEmployeeDAO(EmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}

	
	@JSON(serialize=false)
	public DepEmpServiceInfo getDepEmpServiceInfo() {
		return depEmpServiceInfo;
	}

	public void setDepEmpServiceInfo(DepEmpServiceInfo depEmpServiceInfo) {
		this.depEmpServiceInfo = depEmpServiceInfo;
	}

	@JSON(serialize=false)
	public DepartmentService getDepartmentService() {
		return departmentService;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}

	@Override
	public String queryRoleIdByRoleName(String rolename) {
		return employeeDAO.queryRoleIdByRoleName(rolename);
	}

	@Override
	public int checkRegister(String phone) {
		return employeeDAO.checkRegister(phone);
	}

	@Override
	public void updPwd(String empId, String pwd) {
		employeeDAO.updPwd(empId, pwd);
	}

}
