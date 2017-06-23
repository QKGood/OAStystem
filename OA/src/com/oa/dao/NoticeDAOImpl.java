package com.oa.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.oa.bean.Notice;
import com.oa.common.bean.Pager4EasyUI;

public class NoticeDAOImpl extends AbstractBaseDAO<Notice> implements NoticeDAO {

	@Override
	public Pager4EasyUI<Notice> queryBySearch(Pager4EasyUI<Notice> pager, String noticeName) {
		Session session = this.getSessionFactory().getCurrentSession();
        Criteria c = session.createCriteria(Notice.class).add(Restrictions.like("name", "%"+noticeName+"%"));
        @SuppressWarnings("unchecked")
		List<Notice> list = (List<Notice>)c.list();
		pager.setRows(list);
		pager.setTotal(list.size());
		if(pager.getTotal() == 0){
			Session s = this.getSessionFactory().getCurrentSession();
	        Criteria cr = s.createCriteria(Notice.class).add(Restrictions.like("des", "%"+noticeName+"%"));
	        @SuppressWarnings("unchecked")
			List<Notice> lists = (List<Notice>)cr.list();
			pager.setRows(lists);
			pager.setTotal(lists.size());
		}
		return pager;
	}
	
	//根据时间查询标题
	@Override
	public List<Notice> queryNewNotice() {		
	Session session = sessionFactory.getCurrentSession();
	Query query = session.createQuery("from Notice order by noticeDay desc");
	query.setFirstResult(0);
	query.setMaxResults(3);
	List<Notice> notices = query.list();
	return notices;
	}


}




















