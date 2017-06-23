package com.oa.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oa.bean.Employee;
import com.oa.bean.Goods;
import com.oa.bean.GoodsApp;
import com.oa.common.bean.ControllerRequest;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.common.web.WebUtil;
import com.oa.service.GoodsAppService;
import com.oa.service.GoodsService;

/**
 * 物品申购Action
 * @author XMF
 */

public class GoodsAppAction extends BaseAction{

	private static final long serialVersionUID = -9027916988467624486L;
	
	private HttpServletRequest req;
	private GoodsAppService goodsAppService;
	private GoodsApp goodsApp;
	private List<GoodsApp> rows;
	private long total;
	private ControllerRequest regoodsApp;
	private String gId;
	private String gName;
	private int quantity;
	private String des;
	private double price;
	
	private GoodsService goodsService;
	
	
	@Override
	public void setServletRequest(HttpServletRequest req) {
		this.req = req;
	}
	public void setGoodsAppService(GoodsAppService goodsAppService) {
		this.goodsAppService = goodsAppService;
	}
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}
	
	public void setDes(String des) {
		this.des = des;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public GoodsApp getGoodsApp() {
		return goodsApp;
	}
	public void setGoodsApp(GoodsApp goodsApp) {
		this.goodsApp = goodsApp;
	}
	public List<GoodsApp> getRows() {
		return rows;
	}
	public long getTotal() {
		return total;
	}
	public ControllerRequest getRegoodsApp() {
		return regoodsApp;
	}

	public void setgId(String gId) {
		this.gId = gId;
	}
	
	public String saveGoodsApp() {
		Employee e = (Employee)req.getSession().getAttribute("employee");
		goodsApp.setEmpId(e.getEmpId());
		goodsApp.setStatus(1);	//	可用或不可用
		goodsApp.setAppStatus(0);	// 默认为0 申购状态成功或失败
		goodsApp.setAppDay(new Date());
		goodsApp = goodsAppService.save(goodsApp);
		regoodsApp = ControllerRequest.getSuccessRequest("保存成功");
		return "save";
	}
	
	public String updateGoodsApp() {
		goodsAppService.update(goodsApp);
		regoodsApp = ControllerRequest.getSuccessRequest("更新成功");
		return "update";
	}
	
	// 分页显示全部数据
	public String queryAll() {
		Pager4EasyUI<GoodsApp> pager = new Pager4EasyUI<GoodsApp>();
		pager.setPageNo(WebUtil.getPageNo(req));
		pager.setPageSize(WebUtil.getPageSize(req));
		Employee e = (Employee)req.getSession().getAttribute("employee");
		String className = this.getClass().getName();
		String actionName = className +"."+Thread.currentThread().getStackTrace()[1].getMethodName();
		if(autService.queryAuthority(e.getRole().getRoleId(), actionName)){
			pager.setTotal(goodsAppService.count("GoodsApp"));
			pager = goodsAppService.queryPager("GoodsApp", pager);
		}else{
			pager.setTotal(goodsAppService.count("GoodsApp"));
			pager = goodsAppService.queryByEmpId(pager, e.getEmpId());
		}
		rows = pager.getRows();
		total = pager.getTotal();
		return "pager";
	}
	
	public String gtDisable(){  // 禁用
		System.out.println("goodsappid"+gId);
		goodsAppService.updateStatus("GoodsApp","goodsAppId",0, gId);
		return "disable";
	}
	
	public String gtActivate(){  // 启用
		goodsAppService.updateStatus("GoodsApp","goodsAppId",1, gId);
		return "activate";
	}
	
	public String gaDisable() { 	// 申购审核拒绝
		goodsAppService.updateAppStatus("GoodsApp", "goodsAppId", 2, gId);
		return "gaDisable";
	}
	
	public String gaActivate() {	// 申购审核同意	=============================================
		goodsAppService.updateAppStatus("GoodsApp", "goodsAppId", 1, gId);
		Goods g = goodsService.queryQuantity("Goods", gName);
//		if(g == null) {
//			Goods goods = new Goods();
//			goods.setName(gName);
//			goods.setDes(des);
//			goods.setBuyDay(new Date());
//			goods.setQuantity(quantity);
//			// 要确认以下是否可用
//			goods.setUnitPrice(price);
//			goods.setStatus(1);
//			goods.setGoodsId("402881e859838ae70159838c94df0000");
//			goodsService.save(goods);
//		} else {
			goodsService.updateQuantityByName("Goods",gName, quantity + g.getQuantity());
//		}
		return "gaActivate";
	}
	
	// 跳转到物品申购页面
	public String goodsAppPager() {
		return "goodsAppPager";
	}
	
}
