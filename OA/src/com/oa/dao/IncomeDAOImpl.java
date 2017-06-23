package com.oa.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.oa.bean.Income;
import com.oa.common.bean.Pager4EasyUI;

public class IncomeDAOImpl extends AbstractBaseDAO<Income> implements IncomeDAO {

	@Override
	public Pager4EasyUI<Income> queryBySearch(Pager4EasyUI<Income> pager, String name) {
		Session session = this.getSessionFactory().getCurrentSession();
		Criteria c = session.createCriteria(Income.class);
		Criteria empCriteria = c.createCriteria("employee");
		empCriteria.add(Restrictions.like("name", "%" + name + "%"));
		@SuppressWarnings("unchecked")
		List<Income> list = (List<Income>) c.list();
		pager.setRows(list);
		pager.setTotal(list.size());
		return pager;
	}


}
