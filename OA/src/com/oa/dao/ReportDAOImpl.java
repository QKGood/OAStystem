package com.oa.dao;


import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.oa.bean.Report;
import com.oa.bean.info.ReportInfo;
import com.oa.common.bean.Pager4EasyUI;

public class ReportDAOImpl extends AbstractBaseDAO<Report> implements ReportDAO{

	@Override
	public Pager4EasyUI<ReportInfo> baseQuery(Pager4EasyUI<ReportInfo> pager,String depid, String empid,String empName, Date beginDate, Date endDate, String status,String sort,String order) {
		String sql = "select e.empid eid, e.name ename, d.depid did, d.name dname, er.reportid erid,er.reportday erday,er.des erdes,er.status erstatus";
		String wheEnd = " where er.reportday <= :endDate ";
		String from = " from t_report er left join t_emp e on er.empid = e.empid  left join t_dept d on e.depid = d.depid ";
		StringBuffer whe= new StringBuffer();
		String wheSort = "";
		if(depid!=null && !depid.equals("")){		whe.append(" and e.depid = :depid");			}
		if(empid!=null &&!empid.equals("")){		whe.append(" and e.empid = :empid");			}
		if(beginDate!=null){						whe.append(" and er.reportday >= :beginDate ");	}
		if(endDate==null){							endDate = new Date();							}
		if(empName!=null&&!empName.equals("")){		whe.append(" and e.name like :empName " );		}
		if(sort !=null && !sort.equals("")){
			wheSort = " group by " + sort + " "+ order ;
		}else {
			wheSort = " group by er.reportday desc ";  
		}
		sql = sql + from + wheEnd +whe.toString()+ wheSort;
		
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		if(depid!=null &&!depid.equals(""))		{	query.setParameter("depid", depid);				}
		if(empid!=null &&!empid.equals(""))		{	query.setParameter("empid", empid);}
		if(empName!=null&&!empName.equals(""))	{ 	query.setParameter("empName",empName);			}
		if(beginDate!=null)						{	query.setParameter("beginDate", beginDate);		}
		query.setParameter("endDate", endDate);
		List<Object[]> list = query.list();
		List<ReportInfo> reports = new ArrayList<>();
		for(int i = 0,len = list.size(); i<len; i++){
			Object[] obj =list.get(i);
			ReportInfo report = new ReportInfo();
			report.setEmpId((String) obj[0]);
			report.setEmpName((String) obj[1]);
			report.setDepId((String) obj[2]);
			report.setDepName((String) obj[3]);
			report.setReportId((String) obj[4]);
			report.setReportday((Date) obj[5]);
			if(obj[6]!=null){			report.setDes(obj[6].toString());}
			report.setStatus((Integer) obj[7]);
			reports.add(report);
		}
		pager.setRows(reports);
		
		return pager;
	}
/*	public void bbb() {//测试成功
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery("select * from t_report where reportid = :rep");
		query.setParameter("rep", "1");
		List list = query.list();
		System.out.println(list);
	}*/

	@Override
	public int baseCount(String depid, String empid,String empName, Date beginDate, Date endDate, String status) {
		String sql = "select count(er.reportid) ";
		String wheEnd = " where er.reportday <= :endDate ";
		String from = " from t_report er left join t_emp e on er.empid = e.empid  left join t_dept d on e.depid = d.depid ";
		StringBuffer whe= new StringBuffer();
		String wheSort = " group by er.reportday desc ";
		if(depid!=null && !depid.equals("")){		whe.append(" and e.depid = :depid ");			}
		if(empid!=null &&!empid.equals("")){		whe.append(" and e.empid = :empid ");			}
		if(beginDate!=null){						whe.append(" and er.reportday >= :beginDate ");	}
		if(endDate==null){							endDate = new Date();							}
		if(empName!=null&&!empName.equals("")){		whe.append(" and e.name like :empName " );		}
		sql = sql + from + wheEnd + whe.toString() + wheSort;
		
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		if(depid!=null && !depid.equals(""))		{		query.setParameter("depid", depid);			}	
		if(empid!=null &&!empid.equals(""))			{		query.setParameter("empid", empid);			}
		if(empName!=null&&!empName.equals(""))		{		query.setParameter("empName", empName);		}
		query.setParameter("endDate", endDate);
		if(beginDate!=null){		query.setParameter("beginDate", beginDate);}
		Object obj = query.uniqueResult();
		int resultCount = 0;
		if(obj!=null) {
			BigInteger bigInt= (BigInteger)obj ;
			resultCount=bigInt.intValue();
		}
		
		return resultCount;
	}

	@Override
	public void updReport(String reportid, String des) {
		String sql = "update t_report set des = :des where reportid =:reportid";
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("des", des);
		query.setParameter("reportid", reportid);
		query.executeUpdate();
	}
}
