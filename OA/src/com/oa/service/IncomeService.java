package com.oa.service;

import java.util.List;

import com.oa.bean.Income;
import com.oa.common.bean.Pager4EasyUI;

public interface IncomeService extends BaseService<Income>{
	public Pager4EasyUI<Income> queryBySearch(Pager4EasyUI<Income> pager, String name);
}
