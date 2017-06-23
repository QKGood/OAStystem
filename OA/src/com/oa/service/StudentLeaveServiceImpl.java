package com.oa.service;

import java.io.Serializable;
import java.util.List;

import com.oa.bean.StudentLeave;
import com.oa.common.bean.Pager4EasyUI;
import com.oa.dao.StudentLeaveDAO;

public class StudentLeaveServiceImpl implements StudentLeaveService{

	private StudentLeaveDAO stuLeaveDAO;
	
	
	public void setStuLeaveDAO(StudentLeaveDAO stuLeaveDAO) {
		this.stuLeaveDAO = stuLeaveDAO;
	}

	@Override
	public StudentLeave save(StudentLeave t) {
		return stuLeaveDAO.save(t);
	}

	@Override
	public void delete(StudentLeave t) {
		
	}

	@Override
	public void update(StudentLeave t) {
		stuLeaveDAO.save(t);
	}

	@Override
	public StudentLeave queryById(Class<?> clazz, Serializable id) {
		return stuLeaveDAO.queryById(clazz, id);
	}

	@Override
	public List<StudentLeave> queryAll(Serializable beanName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<StudentLeave> queryPager(String beanName, Pager4EasyUI<StudentLeave> pager) {
		return stuLeaveDAO.queryPager(beanName, pager);
	}

	@Override
	public long count(Serializable beanName) {
		return stuLeaveDAO.count(beanName);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Pager4EasyUI<StudentLeave> queryPagerByGradeId(Pager4EasyUI<StudentLeave> pager, Serializable gradeId) {
		return stuLeaveDAO.queryPagerByGradeId(pager, gradeId);
	}

	@Override
	public Pager4EasyUI<StudentLeave> queryPagerByLeaveId(Pager4EasyUI<StudentLeave> pager, Serializable stuId,
			Serializable pass) {
		return stuLeaveDAO.queryPagerByLeaveId(pager, stuId, pass);
	}

}
