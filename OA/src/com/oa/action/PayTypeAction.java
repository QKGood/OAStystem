package com.oa.action;

import java.util.ArrayList;
import java.util.List;

import com.oa.bean.Employee;
import com.oa.bean.PayType;
import com.oa.common.bean.ComboBox4EasyUI;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.PayTypeService;

/*郭玉清*/
public class PayTypeAction extends BaseAction {

	private static final long serialVersionUID = 4754939624797214068L;

	private PayTypeService payTypeService;
	private ControllerRequest resu;

	private List<PayType> rows;
	private PayType payType;
	private long total;
	private Employee emp;

	private String id;

	private List<ComboBox4EasyUI> request;

	public List<ComboBox4EasyUI> getRequest() {
		return request;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPayTypeService(PayTypeService payTypeService) {
		this.payTypeService = payTypeService;
	}

	public ControllerRequest getResu() {
		return resu;
	}

	public List<PayType> getRows() {
		return rows;
	}

	public PayType getPayType() {
		return payType;
	}

	public void setPayType(PayType payType) {
		this.payType = payType;
	}

	public long getTotal() {
		return total;
	}

	/* 显示页面 */
	public String showPayType() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.PayTypeAction.showPayType")) {
			return "showPayType";
		}
		return ERROR;
	}

	// 分页查询所有
	public String pager() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.PayTypeAction.pager")) {
			Pager4EasyUI<PayType> pager = new Pager4EasyUI<PayType>();
			pager.setPageSize(WebUtil.getPageSize(req));
			pager.setPageNo(WebUtil.getPageNo(req));
			pager.setTotal(payTypeService.count("PayType"));
			pager = payTypeService.queryPager("PayType", pager);
			total = pager.getTotal();
			rows = pager.getRows();
			return "pager";
		}
		return ERROR;
	}

	// 下拉支出状态框
	public String type() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.PayTypeAction.type")) {
			List<PayType> list = payTypeService.queryAll("PayType");
			request = new ArrayList<ComboBox4EasyUI>();
			for (PayType type : list) {
				ComboBox4EasyUI combox = new ComboBox4EasyUI();
				combox.setId(type.getPayTypeId());
				combox.setText(type.getName());
				combox.setSelected(true);
				request.add(combox);
			}
			return "type";
		}
		return ERROR;
	}

	public String addPayType() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.PayTypeAction.addPayType")) {
			payType.setStatus(1);
			payTypeService.save(payType);
			resu = ControllerRequest.getSuccessRequest("添加成功！");
			return "add";
		}
		return ERROR;
	}

	public String updatePayType() {
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.PayTypeAction.updatePayType")) {
			payTypeService.update(payType);
			resu = ControllerRequest.getSuccessRequest("更新成功！");
			return "update";
		}
		return ERROR;
	}

	public String payTypeDisable() { // 禁用支出
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.PayTypeAction.payTypeDisable")) {
			payTypeService.updateStatus("PayType", "payTypeId", 0, id);
			return "disable";
		}
		return ERROR;
	}

	public String payTypeActivate() { // 启用
		emp = (Employee) WebUtil.getSessionValue(req, "employee");
		if (autService.queryAuthority(emp.getRole().getRoleId(), "com.oa.action.PayTypeAction.payTypeActivate")) {
			payTypeService.updateStatus("PayType", "payTypeId", 1, id);
			return "activate";
		}
		return ERROR;
	}

}
