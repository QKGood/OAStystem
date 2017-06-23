package com.oa.action;

import java.util.ArrayList;
import java.util.List;

import com.oa.bean.Employee;
import com.oa.bean.Income;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.LineBasic;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.IncomeService;
import com.oa.service.IncomeTypeService;

public class IncomeAction extends BaseAction {
	private static final long serialVersionUID = -1913764056809647024L;

	private IncomeService incomeService;
	private List<Income> rows;
	private long total;
	private IncomeTypeService incomeTypeService;
	private Income income;
	private Employee emp;
	private String name;
	private String value;
	private ControllerRequest result;	
	
	private List<LineBasic> lineBasic;
	 
	public List<LineBasic> getLineBasic() {
		return lineBasic;
	}
	
	public ControllerRequest getResult() {
		return result;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Income getIncome() {
		return income;
	}

	public void setIncome(Income income) {
		this.income = income;
	}

	public void setIncomeService(IncomeService incomeService) {
		this.incomeService = incomeService;
	}

	public void setIncomeTypeService(IncomeTypeService incomeTypeService) {
		this.incomeTypeService = incomeTypeService;
	}

	public List<Income> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public String showIncomeHome() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		String methodname =  this.getClass().getName() + "." + Thread.currentThread().getStackTrace()[1].getMethodName();
		if (autService.queryAuthority(emp.getRole().getRoleId(), methodname)) {
			return "incomeHome";
		}
		return ERROR;
	}

	public String incomePager() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		String methodname =  this.getClass().getName() + "." + Thread.currentThread().getStackTrace()[1].getMethodName();
		if (autService.queryAuthority(emp.getRole().getRoleId(), methodname)) {
			Pager4EasyUI<Income> pager = new Pager4EasyUI<Income>();
			pager.setPageNo(WebUtil.getPageNo(req));
			pager.setPageSize(WebUtil.getPageSize(req));
			pager = incomeService.queryPager("Income", pager);
			pager.setTotal(incomeService.count("Income"));
			total = pager.getTotal();
			rows = pager.getRows();
			return "pager";
		}
		return ERROR;
	}

	public String lineBasic(){
		lineBasic = new ArrayList<LineBasic>();
		Pager4EasyUI<Income> pager = new Pager4EasyUI<Income>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		pager = incomeService.queryPager("Income", pager);
		for(Income in:pager.getRows()){
			LineBasic line = new LineBasic();
			line.setName(in.getIncomeType().getName());
			line.setData(new double[]{in.getIncome()});
			lineBasic.add(line);
		}
		return "lineBasic";
	}

}
