package com.oa.dao;


import com.oa.bean.Income;
import com.oa.common.bean.Pager4EasyUI;

public interface IncomeDAO extends BaseDAO<Income>{
	public Pager4EasyUI<Income> queryBySearch(Pager4EasyUI<Income> pager, String name);
}
