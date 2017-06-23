package com.oa.service;

import com.oa.bean.GoodsApp;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.BaseDAO;

public interface GoodsAppService extends BaseDAO<GoodsApp>{
	
	public void updateGoodsApp(GoodsApp gooodsApp);
	/**
	 * 
	 * 根据empid查询自己的申购东西
	 * 
	 */
	public Pager4EasyUI<GoodsApp> queryByEmpId(Pager4EasyUI<GoodsApp> pager,String empId);
	
	public void updateAppStatus(String beanName, String beanId, int appStatus, String id);
	
}
