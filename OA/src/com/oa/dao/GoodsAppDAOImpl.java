package com.oa.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.oa.bean.GoodsApp;
import com.oa.common.bean.Pager4EasyUI;

/**
 * @author XMF
 */
public class GoodsAppDAOImpl extends AbstractBaseDAO<GoodsApp> implements GoodsAppDAO {

	@Override
	public void updateGoodsApp(GoodsApp goodsApp) {
		Session session = sessionFactory.getCurrentSession();
		String sql = "update t_goodsapp set empid=?, goodsname=?, quantity=?, des=?, "
				+ "status=?,appday=?,price=? where goodsappid=?";
		Query query = session.createSQLQuery(sql);
		query.setParameter(0, goodsApp.getEmp().getEmpId());
		query.setParameter(1, goodsApp.getGoodsName());
		query.setParameter(2, goodsApp.getQuantity());
		query.setParameter(3, goodsApp.getDes());
		query.setParameter(4, goodsApp.getStatus());
		query.setParameter(5, goodsApp.getAppDay());
		query.setParameter(7, goodsApp.getGoodsAppId());
		query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Pager4EasyUI<GoodsApp> queryByEmpId(Pager4EasyUI<GoodsApp> pager, String empId) {
		Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from GoodsApp ga where  ga.empId =:empId");
        query.setParameter("empId", empId);
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        List<GoodsApp> list = (List<GoodsApp>) query.list();
        pager.setRows(list);
        return pager;
	}

	@Override
	public void updateAppStatus(String beanName, String beanId, int appStatus, String id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "update " + beanName + " set appStatus = :appStatus where " + beanId + "= :id";
		Query query = session.createQuery(hql);
		query.setParameter("appStatus", appStatus);
		query.setParameter("id", id);
		query.executeUpdate();
	}
	
}
