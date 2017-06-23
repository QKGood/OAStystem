package com.oa.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oa.bean.Employee;
import com.oa.bean.Grade;
import com.oa.bean.Income;
import com.oa.bean.IncomeType;
import com.oa.bean.Room;
import com.oa.bean.Student;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.EncryptUtil;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.EmployeeService;
import com.oa.service.GradeService;
import com.oa.service.IncomeService;
import com.oa.service.IncomeTypeService;
import com.oa.service.RoomService;
import com.oa.service.StudentService;

public class StudentAction extends BaseAction{

	
	private static final long serialVersionUID = 7799451744664884745L;

	private StudentService studentService;
	
	private List<Student> rows; 	// 返回rows结果集到easyUI页面
	private long total;				// 返回total总记录数到easyUI页面
	private ControllerRequest resu;  // 返回提示信息到easyUI页面
	private Student student;		// 意向学生
	
	private String id; 		// 从界面获取ID
	private String gradeId;  // 从界面获取班级ID
	private String roomId;  // 从界面获取宿舍id
	
	private String reserveMoney;  // 从界面获取转为预定学生输入的值
	private String officialMoney; // 从界面获取转为正式学生输入的值
	
	private String stuId;  // 从界面获取学生ID

	private String stuName; 
	
	private String stuIds; //多个学生id
	
	private IncomeService incomeService;
	
	private IncomeTypeService incomeTypeService;
	
	private GradeService gradeService;
	private RoomService roomService;
	private EmployeeService employeeService;
	private String stuStatus;
	
	private Employee emp;

	
	

	
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public void setRoomService(RoomService roomService) {
		this.roomService = roomService;
	}

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}

	public void setStuStatus(String stuStatus) {
		this.stuStatus = stuStatus;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public void setIncomeTypeService(IncomeTypeService incomeTypeService) {
		this.incomeTypeService = incomeTypeService;
	}

	public void setIncomeService(IncomeService incomeService) {
		this.incomeService = incomeService;
	}

	public void setStuIds(String stuIds) {
		this.stuIds = stuIds;
	}
	
	public void setOfficialMoney(String officialMoney) {
		this.officialMoney = officialMoney;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public List<Student> getRows() {
		return rows;
	}
	public long getTotal() {
		return total;
	}
	
	public ControllerRequest getResu() {
		return resu;
	}
	
	public void setReserveMoney(String reserveMoney) {
		this.reserveMoney = reserveMoney;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	public String showPurpose(){  // 转发到意向学生页面
		return "showPurpose";
	}
	
	public String showReserve(){ // 转发到预定学生页面
		return "showReserve"; 
	}
	
	public String showOfficial(){ // 转发到正式学生页面
		return "showOfficial"; 
	}
	
	
	public String stuPurposePager(){  // 分页显示意向学生
		Pager4EasyUI<Student> pager = new Pager4EasyUI<Student>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		String className = this.getClass().getName();
		String actionName = className + "." + Thread.currentThread().getStackTrace()[1].getMethodName();
		if(autService.queryAuthority(emp.getRole().getRoleId(), actionName)){
			pager.setTotal(studentService.countStatus("意向"));
			pager = studentService.studentStatusPager("意向", pager);
		}else{
			pager.setTotal(studentService.countEmpID(emp.getEmpId(), "意向"));
			pager = studentService.queryByEmpId(pager, "意向", emp.getEmpId());
		}
		total = pager.getTotal();
		rows = pager.getRows();
		return "pager";
	}
	
	
	public String stuPurposeSave(){ // 添加意向学生
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
			if(studentService.phone(student)){
				resu = ControllerRequest.getSuccessRequest("添加失败，手机号已经有了");
			}else{
				student.setStatus(1);
				student.setStuStatus("意向");
				student.setEmpId(emp.getEmpId());
				studentService.save(student);
				resu = ControllerRequest.getSuccessRequest("添加成功");
			}
			
		return "save";
	}

	public String stuPurposeUpdate(){ // 修改意向学生
			student.setStatus(1);
			student.setStuStatus("意向");
			studentService.update(student);
			resu = ControllerRequest.getSuccessRequest("更新成功");
		return "update";
	}
	
	public String stuPurposeDisable(){  // 禁用意向学生
		studentService.updateStatus("Student","stuId",0, id);
		return "disable";
	}
	
	public String stuPurposeActivate(){  // 启用意向学生
		studentService.updateStatus("Student","stuId",1, id);
		return "activate";
	}
	
	public String stuReservePager(){  // 分页显示预定学生
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		String className = this.getClass().getName();
		String actionName = className + "." + Thread.currentThread().getStackTrace()[1].getMethodName();
		Pager4EasyUI<Student> pager = new Pager4EasyUI<Student>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		if(autService.queryAuthority(emp.getRole().getRoleId(), actionName)){
			pager.setTotal(studentService.countStatus("预定"));
			pager = studentService.studentStatusPager("预定", pager);
		} else {
			pager.setTotal(studentService.countEmpID(emp.getEmpId(), "预定"));
			pager = studentService.queryByEmpId(pager, "预定", emp.getEmpId());
		}
		total = pager.getTotal();
		rows = pager.getRows();
		return "reservePager";
	}
	
	public String stuReserveSave(){ // 添加预定学生
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		double income = Double.valueOf(reserveMoney);
			if(6000 >= income && income >= 300){
				if(studentService.phone(student)){
					resu = ControllerRequest.getSuccessRequest("添加失败，手机号已经有了");
				}else{
					student.setStatus(1);
					student.setStuStatus("预定");
					student.setEmpId(emp.getEmpId());
					studentService.save(student);
					Income ic = new Income();
					ic.setIncome(income);
					ic.setDes("交了预定报名费为" + income);
					ic.setIncomeDay(new Date());
					
					IncomeType icType = incomeTypeService.queryByName("预定报名费");
					ic.setIncomeTypeId(icType.getIncomeTypeId());
					
					ic.setStuId(student.getStuId());
					String empId = employeeService.queryEmpByRole("财务部主任", null);
					ic.setEmpId(empId);
					incomeService.save(ic);
					resu = ControllerRequest.getSuccessRequest("添加成功");
				}
				
			}else{
				resu = ControllerRequest.getSuccessRequest("对不起，你输入的金额有误");
			}
			return "reserveSave";
	}

	public String stuReserveUpdate(){ // 修改预定学生
		student.setStatus(1);
		student.setStuStatus("预定");
		studentService.update(student);
		resu = ControllerRequest.getSuccessRequest("更新成功");
		return "reserveUpdate";
	}
	

	
	public String stuOfficialPager(){  // 分页显示正式学生
		Pager4EasyUI<Student> pager = new Pager4EasyUI<Student>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setTotal(studentService.countStatus("正式"));
		pager = studentService.studentStatusPager("正式", pager);
		total = pager.getTotal();
		rows = pager.getRows();
		return "officialPager";
	}
	
	public String stuOfficialSave(){ // 添加正式学生
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		double income = Double.valueOf(officialMoney);
			if(6000 >= income && income >= 3000){
				if(studentService.phone(student)){
					resu = ControllerRequest.getSuccessRequest("添加失败，手机号已经有了");
				}else{
					student.setStatus(1);   	
					student.setPwd(EncryptUtil.encrypt("123456")); // 添加时默认密码为
					student.setStuStatus("正式");
					student.setEmpId(emp.getEmpId());
					studentService.save(student);
					
					Income ic = new Income();
					ic.setIncome(income);
					ic.setDes("交了正式报名费为" + income);
					ic.setIncomeDay(new Date());
					
					IncomeType icType = incomeTypeService.queryByName("正式报名费");
					ic.setIncomeTypeId(icType.getIncomeTypeId());
					
					ic.setStuId(student.getStuId());
					String empId = employeeService.queryEmpByRole("财务部主任", "财务部");
					ic.setEmpId(empId);
					incomeService.save(ic);
					
					resu = ControllerRequest.getSuccessRequest("添加成功");
				}
			}else{
				resu = ControllerRequest.getSuccessRequest("对不起，你输入的金额有误");
			}
			return "officialSave";
	}

	public String stuByIdPager(){
		student = studentService.queryById(Student.class, stuId);
		req.setAttribute("stu", student);
		return "byId"; 
	}
	
	public String stuOfficialUpdate(){ // 修改正式学生
			int bear = 0;
			if(student.getEmpId().equals("null")){
				student.setEmpId(null);
			}
			
			if(student.getRoomId().equals("null")){
				student.setRoomId(null);
			}else{
				Room room = roomService.queryById(Room.class, student.getRoomId());
				int count = roomService.queryByRoomId(student.getRoomId());
				int surplus = room.getQuantity() - count;  // 还能添加多少学生
				if( 1 <= surplus){
					
				}else{
					bear = 1;
				
				}
			}
			
			if(student.getGradeId().equals("null")){
				student.setGradeId(null);
			}else{
				Grade grade = gradeService.queryById(Grade.class, student.getGradeId());
				int count = gradeService.queryByGradeId(student.getGradeId());
				int surplus = grade.getQuantity() - count;  // 还能添加多少学生
				if(1 <= surplus){
					
				}else{
					bear = 2;
					
				}
			}
			if(bear == 0){
				student.setStatus(1);
				student.setStuStatus("正式");
				studentService.update(student);
				resu = ControllerRequest.getSuccessRequest("更新成功");
			}else if(bear == 1){
				resu = ControllerRequest.getSuccessRequest("更新失败,宿舍满了");
			}else if(bear == 2){
				resu = ControllerRequest.getSuccessRequest("更新失败,班级满了");
			}
			return "officialUpdate";
	}
	
	public String stuUpdate(){ //更新学生个人信息
		Student stu = (Student) WebUtil.getSessionValue(req, "student");
		student.setStuId(stu.getStuId());
		student.setPwd("4QrcOUm6Wau+VuBX8g+IPg==");
		studentService.update(student);
		student = studentService.queryById(Student.class, stu.getStuId());
		System.out.println("全部信息："+student);
		req.getSession().setAttribute("student",student);
		resu = ControllerRequest.getSuccessRequest("更新成功");
		return "update";
	}
	
	public String updatePwd(){	//修改密码
		Student stu = (Student) WebUtil.getSessionValue(req,"student");
		student.setPwd(EncryptUtil.encrypt(stu.getPwd()));
		String ordpwd = EncryptUtil.encrypt(req.getParameter("ordPwd"));
		if(ordpwd.equals(stu.getPwd())){
			String newpwd =  EncryptUtil.encrypt(req.getParameter("newPwd"));
			studentService.updatePwd(stu.getStuId(), newpwd);
			resu = ControllerRequest.getSuccessRequest("更改成功，请重新登录");
		}else {
			resu = ControllerRequest.getFailRequest("旧密码错误");
		}
		return "updatepwd";
	}
	
	public String stuGradeById(){  // 分页显示在哪个班的学生
		Pager4EasyUI<Student> pager = new Pager4EasyUI<Student>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setTotal(studentService.countGradeID(gradeId));
		pager = studentService.stuGradeById(gradeId, pager);
		total = pager.getTotal();
		rows = pager.getRows();
		return "stuGradePager";
	}
	
	
	public String stuRoomById(){  // 分页显示在哪个宿舍的学生
		Pager4EasyUI<Student> pager = new Pager4EasyUI<Student>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setTotal(studentService.countRoomID(roomId));
		pager = studentService.stuRoomById(roomId, pager);
		total = pager.getTotal();
		rows = pager.getRows();
		return "stuRoomPager";
	}
	
	public String comitUpdatePay(){ // 转为预定
		double income = Double.valueOf(reserveMoney);
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		String className = this.getClass().getName();
		String actionName = className + "." + Thread.currentThread().getStackTrace()[1].getMethodName();
		if(autService.queryAuthority(emp.getRole().getRoleId(), actionName)) {
			if(6000 >= income && income >= 300){
				student = studentService.queryById(Student.class, stuId);
				
				Income ic = new Income();
				ic.setIncome(income);
				ic.setDes("交了预定报名费为" + income);
				ic.setIncomeDay(new Date());
				
				IncomeType icType = incomeTypeService.queryByName("预定报名费");
				ic.setIncomeTypeId(icType.getIncomeTypeId());
				
				ic.setStuId(student.getStuId());
				String empId = employeeService.queryEmpByRole("财务部主任", "财务部");
				ic.setEmpId(empId);
				incomeService.save(ic);
				
				student.setStuStatus("预定");
				studentService.update(student);
				
				resu = ControllerRequest.getSuccessRequest("转为预定学生成功");
			
			}else{
				resu = ControllerRequest.getSuccessRequest("对不起，你输入的金额有误");
			}
			return "comitUpdatePay";
		} else {
			return ERROR;
		}
		
	}
	
	public String comitOfficialPay(){ // 转为正式
		double income = Double.valueOf(officialMoney);
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		int i = 1;
		String className = this.getClass().getName();
		String actionName = className + "." + Thread.currentThread().getStackTrace()[1].getMethodName();
		if(autService.queryAuthority(emp.getRole().getRoleId(), actionName)) {
			if(6000 >= income && income >= 3000){
				student = studentService.queryById(Student.class, stuId);
				
				Income ic = new Income();
				ic.setIncome(income);
				ic.setDes("交了正式报名费为" + income);
				ic.setIncomeDay(new Date());
				
				IncomeType icType = incomeTypeService.queryByName("正式报名费");
				ic.setIncomeTypeId(icType.getIncomeTypeId());
				
				ic.setStuId(student.getStuId());
				String empId = employeeService.queryEmpByRole("财务部主任", "财务部");
				ic.setEmpId(empId);
				incomeService.save(ic);
				student.setStuStatus("正式");
				student.setPwd(EncryptUtil.encrypt("123456")); // 添加时默认密码为
				student.setStuNo("201600"+i);
				studentService.update(student);
				resu = ControllerRequest.getSuccessRequest("转为正式学生成功");
				i++;
			}else{
				resu = ControllerRequest.getSuccessRequest("对不起，你输入的金额有误");
			}
			return "comitOfficialPay";
		} else {
			return ERROR;
		}
		
	}
	
	
	
	public String stuGradeNullById(){  // 分页显示没有班级的学生
		Pager4EasyUI<Student> pager = new Pager4EasyUI<Student>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setTotal(studentService.stuGradeRoomById("gradeid"));
		pager = studentService.stuGradeRoomById("gradeid", pager);
		total = pager.getTotal();
		rows = pager.getRows();
		return "stuGradeNullPager";
	}
	
	public String addStuOnGrade(){  // 批量添加学生到班级
		Grade grade = gradeService.queryById(Grade.class, gradeId);
		int count = gradeService.queryByGradeId(gradeId);
		int surplus = grade.getQuantity() - count;  // 还能添加多少学生
		if(stuIds != null){
			String[] stuIdArray = stuIds.split(",");
			if(stuIdArray.length <= surplus){
				studentService.updateGradeIds(stuIdArray, "gradeid", gradeId);
				resu = ControllerRequest.getSuccessRequest("添加成功");
			}else{
				resu = ControllerRequest.getSuccessRequest("添加失败，超过最大人数");
			}
		}
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		String className = this.getClass().getName();
		String actionName = className + "." + Thread.currentThread().getStackTrace()[1].getMethodName();
		if(autService.queryAuthority(emp.getRole().getRoleId(), actionName)) {
			return "addStuIds";
		} else {
			return ERROR;
		}
	}
	
	public String stuRoomNullById(){  // 分页显示没有宿舍的学生
		Pager4EasyUI<Student> pager = new Pager4EasyUI<Student>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setTotal(studentService.stuGradeRoomById("roomid"));
		pager = studentService.stuGradeRoomById("roomid", pager);
		total = pager.getTotal();
		rows = pager.getRows();
		return "stuRoomNullPager";
	}
	
	public String addStuOnRoom(){  // 批量添加学生到宿舍
		Room room = roomService.queryById(Room.class, roomId);
		int count = roomService.queryByRoomId(roomId);
		int surplus = room.getQuantity() - count;  // 还能添加多少学生
		if(stuIds != null){
			String[] stuIdArray = stuIds.split(",");
			if(stuIdArray.length <= surplus){
				studentService.updateGradeIds(stuIdArray, "roomid", roomId);
				resu = ControllerRequest.getSuccessRequest("添加成功");
			}else{
				resu = ControllerRequest.getSuccessRequest ("添加失败，超过最大人数");
			}
		}
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		String className = this.getClass().getName();
		String actionName = className + "." + Thread.currentThread().getStackTrace()[1].getMethodName();
		if(autService.queryAuthority(emp.getRole().getRoleId(), actionName)) {
			return "addStuRoomIds";
		} else {
			return ERROR;
		}
	}
	
	public String pagerByStuName(){
		Pager4EasyUI<Student> pager = new Pager4EasyUI<Student>();
		pager.setPageSize(WebUtil.getPageSize(req));
		pager.setPageNo(WebUtil.getPageNo(req));
		if(stuStatus.equals("预定")){
			pager = studentService.queryBySearch(pager, stuName,"预定");
		}else if(stuStatus.equals("意向")){
			pager = studentService.queryBySearch(pager, stuName,"意向");
		}else if(stuStatus.equals("正式")){
			pager = studentService.queryBySearch(pager, stuName,"正式");
		}
		
		rows = pager.getRows();
		total = pager.getTotal();
		if (rows != null) {
			resu =  ControllerRequest.getSuccessRequest("查找成功");
		} else {
			resu =  ControllerRequest.getFailRequest("没有记录");
		}
		return "queryByName";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		 this.req = req;
	}
	//郭玉清 显示学生本人页面信息
	public String showStu() {
		return "showStu";
	}
}
