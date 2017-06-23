package com.oa.action.info;

import java.util.List;

import com.oa.action.BaseAction;
import com.oa.bean.Employee;
import com.oa.bean.info.PayInfo;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.info.PayInfoService;

//郭玉清
public class PayInfoAction extends BaseAction {

	private static final long serialVersionUID = -8532791406733036993L;

	private PayInfoService piService;
	private ControllerRequest result;

	private List<PayInfo> rows;
	private PayInfo pi;
	private long total;
	private Employee emp;

	public PayInfo getPi() {
		return pi;
	}

	public void setPi(PayInfo pi) {
		this.pi = pi;
	}

	public ControllerRequest getResult() {
		return result;
	}

	public List<PayInfo> getRows() {
		return rows;
	}

	public long getTotal() {
		return total;
	}

	public void setPiService(PayInfoService piService) {
		this.piService = piService;
	}

	public String query_page() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.info.PayInfoAction.query_page")) {
			Pager4EasyUI<PayInfo> pager = new Pager4EasyUI<PayInfo>();
			pager.setPageNo(WebUtil.getPageNo(req));
			pager.setPageSize(WebUtil.getPageSize(req));
			pager = piService.queryPayInfoPage(1, pager);
			pager.setTotal(piService.count("Pay"));
			rows = pager.getRows();
			total = pager.getTotal();
			return "query_page";
		}
		return ERROR;
	}

	public String showPayInfo() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		String className = this.getClass().getName();
		String actionName = className + "." + Thread.currentThread().getStackTrace()[1].getMethodName();
		System.out.println("_____________" + actionName);
		if (autService.queryAuthority(emp.getRole().getRoleId(), actionName)) {
			return "showPayInfo";
		}
		return ERROR;
	}

}
