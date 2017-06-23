package com.oa.dao;

import com.oa.bean.GoodsApp;
import com.oa.common.bean.Pager4EasyUI;

public interface GoodsAppDAO extends BaseDAO<GoodsApp>{
	
	public void updateGoodsApp(GoodsApp goodsApp);
	
	/**
	 * 
	 * 根据empid查询自己的申购东西
	 * 
	 */
	public Pager4EasyUI<GoodsApp> queryByEmpId(Pager4EasyUI<GoodsApp> pager,String empId);
	
	// 更新审核状态
	public void updateAppStatus(String beanName, String beanId, int appStatus, String id);
	
}
