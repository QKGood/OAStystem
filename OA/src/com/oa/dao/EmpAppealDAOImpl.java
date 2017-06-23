package com.oa.dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.oa.bean.Duty;
import com.oa.bean.Empappeal;
import com.oa.bean.info.EmpappealInfo;
import com.oa.common.bean.Pager4EasyUI;

public class EmpAppealDAOImpl  extends AbstractBaseDAO<Empappeal> implements EmpAppealDAO{

	@Override
	public Pager4EasyUI<EmpappealInfo> baseQuery(Pager4EasyUI<EmpappealInfo> pager, String depId, String empId,String empName,
			String firstlevel, String secondlevel, String pass,String hasPass, String status,Date beginDay,Date endDay,String sort, String order) {
		String sel = "select e.empid za, e.name zb, d.depid zc,d.name zd,ea.appealid ze,ea.appealDay zf,ea.des zg,ea.status zh,ea.firstlevel zi,ea.secondlevel zj,ea.pass zk";
		String fro = " from t_empappeal ea left join t_emp e on ea.empid = e.empid ";
		String whe = " where ea.appealday <= :endDay ";
		String addFro = " left join t_dept d on d.depid = e.depid  ";
		String orderby = " ";
		/**
		 * 12:57 隐藏
		 */
		/*if(sort==null || sort.equals("")){
			orderby+=" appealDay " ;
			if(order==null || order.equals("")){
				orderby += " desc ";
			}
		}else {
			orderby += " "+ sort;
			if(order==null || order.equals("")){
				orderby += " "+order+" ";
			}
		}*/
		/**
		 * 12:57添加
		 */
		if(sort!=null&&!sort.equals("")){
			orderby+= " order by "+ sort + " " + order;
			
		}else {
			orderby+=" order by pass asc, appealDay desc ";
		}
		
		
		
		if(depId!=null && !depId.equals("")){			whe += " and d.depid=:depid " ;		}
		if(empId != null && !empId.equals("")){			whe += " and ea.empid= :empid ";		}
		if(empName != null&& !empName.equals("")){		whe += " and e.name like :empName ";	}
		
		if(secondlevel!=null && secondlevel.equals("1")){//第二级已审核,一定是审核过的,如果想找没有审核的就在else里找
			whe += " and ea.secondlevel= 1 ";
		}else if(secondlevel!=null && secondlevel.equals("0")){//第二级未审核
			if(firstlevel!=null && firstlevel.equals("1")){//判断第一级是否已经审过了
				//已经审过了
				whe += " and ea.firstlevel = 1 ";
				whe +=" and ea.secondlevel = 0 ";
			}else if(firstlevel!=null&&firstlevel.equals("0")){//第一级也未审过
				whe += " and ea.firstlevel = 0 ";
				whe +=" and ea.secondlevel = 0 ";
			}
				//第一级未审核
		}else {
			if(firstlevel!=null && firstlevel.equals("1")){//判断第一级是否已经审过了
				//已经审过了
				whe += " and ea.firstlevel = 1 ";
			}else if(firstlevel!=null&&firstlevel.equals("0")){//第一级也未审过
				whe += " and ea.firstlevel = 0 ";
			}
			
		}
		
		
		if(hasPass!=null&&!hasPass.equals("0")&&!hasPass.equals("")){//是否需要过滤pass,为0则不需要过滤,也就是是否审核到真正结果都无所谓,用于单人用户
			if(pass!=null&&!pass.equals("")){//需要过滤pass,也就是说要么是查询审核完的,要么就是没有审核过的
				if(pass.equals("1")){	//审核过的
					whe += " and ea.pass = 1 ";
				}else if(pass.equals("2")){		
					whe += " and ea.pass = 2 ";		
				}
			}else {		
				whe += " and ea.pass !=0 ";		
			}
		}else if(hasPass!=null&&hasPass.equals("0")&&!hasPass.equals("")){	
			whe += " and ea.pass =0 ";	
		}
		
		if(status!=null){			whe += " and ea.status=" + Integer.valueOf(status) + " ";		}
		if(endDay==null){		Date curDate = new Date(); curDate.setHours(23);curDate.setMinutes(59);curDate.setSeconds(59);	endDay =curDate;		}
		if(beginDay != null) {			whe += " and ea.appealday >=:beginDate ";		}
		
		String sql = sel + fro + addFro +whe+orderby;
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		if(depId!=null && !depId.equals("")){	query.setParameter("depid",depId);	}
		if(empId != null && !empId.equals("")){		query.setParameter("empid",empId);		}
		if(empName != null&& !empName.equals("")){ query.setParameter("empName", empName);}
		if(beginDay != null) {	query.setParameter("beginDate",beginDay);}
		query.setParameter("endDay", endDay);
		
		List list = query.list();
		List empAppealInfos = new ArrayList();
		for(int i = 0,len = list.size() ; i<len; i++){
			Object[] obj = (Object[]) list.get(i);
			EmpappealInfo empAppealInfo = new EmpappealInfo();
		
			empAppealInfo.setEmpId(obj[0].toString());
			empAppealInfo.setEmpName(obj[1].toString());
			empAppealInfo.setDepId(obj[2].toString());
			empAppealInfo.setDepName(obj[3].toString());
			empAppealInfo.setAppealId(obj[4].toString());
			empAppealInfo.setAppealDay((Date)obj[5]);
			if(obj[6]!=null){
				empAppealInfo.setDes(obj[6].toString());
			}
			empAppealInfo.setStatus((Integer)obj[7]);
			if(obj[8]!=null){
				empAppealInfo.setFirstLeave((Integer)obj[8]);}
			if(obj[9]!=null){
				empAppealInfo.setSecondLeave((Integer)obj[9]);
			}
			if(obj[10]!=null){
				empAppealInfo.setPass((Integer)obj[10]);
			}
			empAppealInfos.add(empAppealInfo);
		}
		pager.setRows(empAppealInfos);
		return pager;
	}

	@Override
	public void updateLevel(String appealId, String firstlevel, String secondlevel, String pass) {
		Session session = getSessionFactory().getCurrentSession();
		String firstStr= "";
		String secondStr="";
		String passStr = "";
		String statuStr = "";
		String updStr = "update t_empappeal set ";
		String wheStr = " where appealId='"+appealId+"' ";
		if(firstlevel!=null&&!firstlevel.equals("")){
			passStr+=" firstlevel = "+firstlevel+" ";
			if(pass.equals("1")){
				passStr+=" ,pass=1 ";
				statuStr += " ,status= "+1;
			}
		}else if(secondlevel!=null&&!secondlevel.equals("")){
			secondStr+=" secondlevel = " + secondlevel+" " ;
			passStr+=" ,pass=" + Integer.parseInt(pass)+ " ";
			statuStr += " ,status= "+1;
		}
		String sql = updStr + firstStr+ secondStr + passStr+ statuStr+ wheStr;
		SQLQuery query = session.createSQLQuery(sql);
		query.executeUpdate();
	}

	@Override
	public int countNewStatus(String empId) {
		String sql = "select count(ea.appealId) from Empappeal ea left join ea.employee e where e.empId = :empId and ea.status = 1 ";
		Session session = getSessionFactory().getCurrentSession();
		Query query = session.createQuery(sql);
		query.setParameter("empId", empId);
		Long count = (Long) query.uniqueResult();
		return count.intValue();
	}

	@Override
	public void updLeaveStatus(String empId) {
		String sql = "update t_empappeal  set status = 0 where empId = :empId  ";
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.setParameter("empId", empId);
		query.executeUpdate();
	}
	
	
	@Override
	public int baseCount(String depId,String empId,String empName, String firstlevel, String secondlevel, String pass,String hasPass, String status,Date beginDay,Date endDay) {
		String sel = "select count(ea.appealid) ";
		String fro = " from t_empappeal ea left join t_emp e on ea.empid = e.empid ";
		String whe = " where ea.appealday <= :endDay ";
		String addFro = " left join t_dept d on d.depid = e.depid  ";
		String orderby = " ";
		
		
		if(depId!=null && !depId.equals("")){			whe += " and d.depid=:depid " ;		}
		if(empId != null && !empId.equals("")){			whe += " and ea.empid= :empid ";		}
		if(empName != null&& !empName.equals("")){		whe += " and e.name like :empName ";	}
		
		if(secondlevel!=null && secondlevel.equals("1")){//第二级已审核,一定是审核过的,如果想找没有审核的就在else里找
			whe += " and ea.secondlevel= 1 ";
		}else if(secondlevel!=null && secondlevel.equals("0")){//第二级未审核
			if(firstlevel!=null && firstlevel.equals("1")){//判断第一级是否已经审过了
				//已经审过了
				whe += " and ea.firstlevel = 1 ";
				whe +=" and ea.secondlevel = 0 ";
			}else if(firstlevel!=null&&firstlevel.equals("0")){//第一级也未审过
				whe += " and ea.firstlevel = 0 ";
				whe +=" and ea.secondlevel = 0 ";
			}
				//第一级未审核
		}else {
			if(firstlevel!=null && firstlevel.equals("1")){//判断第一级是否已经审过了
				//已经审过了
				whe += " and ea.firstlevel = 1 ";
			}else if(firstlevel!=null&&firstlevel.equals("0")){//第一级也未审过
				whe += " and ea.firstlevel = 0 ";
			}
			
		}
		
		
		if(hasPass!=null&&!hasPass.equals("0")&&!hasPass.equals("")){//是否需要过滤pass,为0则不需要过滤,也就是是否审核到真正结果都无所谓,用于单人用户
			if(pass!=null&&!pass.equals("")){//需要过滤pass,也就是说要么是查询审核完的,要么就是没有审核过的
				if(pass.equals("1")){	//审核过的
					whe += " and ea.pass = 1 ";
				}else if(pass.equals("2")){		
					whe += " and ea.pass = 2 ";		
				}
			}else {		
				whe += " and ea.pass !=0 ";		
			}
		}else if(hasPass!=null&&hasPass.equals("0")&&!hasPass.equals("")){	
			whe += " and ea.pass =0 ";	
		}
		
		if(status!=null){			whe += " and ea.status=" + Integer.valueOf(status) + " ";		}
		if(endDay==null){		Date curDate = new Date(); curDate.setHours(23);curDate.setMinutes(59);curDate.setSeconds(59);	endDay =curDate;		}
		if(beginDay != null) {			whe += " and ea.appealday >=:beginDate ";		}
		
		String sql = sel + fro + addFro +whe+orderby;
		Session session = getSessionFactory().getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		if(depId!=null && !depId.equals("")){	query.setParameter("depid",depId);	}
		if(empId != null && !empId.equals("")){		query.setParameter("empid",empId);		}
		if(empName != null&& !empName.equals("")){ query.setParameter("empName", empName);}
		if(beginDay != null) {	query.setParameter("beginDate",beginDay);}
		query.setParameter("endDay", endDay);
		
		BigInteger count= (BigInteger) query.uniqueResult();
		return count.intValue();
	}

}
