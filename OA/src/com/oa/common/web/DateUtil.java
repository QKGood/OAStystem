package com.oa.common.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import freemarker.core.ParseException;

public class DateUtil {

	
	/** 
     * 将时间字符串转换为Date类型 
     * @param dateStr 
     * @return Date 
     */  
    public static Date toDate(String dateStr) throws ParseException {  
        Date date = null;  
        SimpleDateFormat formater = new SimpleDateFormat();  
        formater.applyPattern("yyyy/MM/dd");  
        try {  
            date = formater.parse(dateStr);  
        } catch (java.text.ParseException e) {  
            e.printStackTrace();  
        }  
        return date;  
    } 
	
	/**
	 * 自动计算天数的方法
	 * @param early
	 * @param late
	 * @return
	 */
	public static int countDay(Date startDay, Date endDay) { 
        java.util.Calendar calst = java.util.Calendar.getInstance();   
        java.util.Calendar caled = java.util.Calendar.getInstance();   
        calst.setTime(startDay);   
         caled.setTime(endDay);   
         //设置时间为0时   
         calst.set(java.util.Calendar.HOUR_OF_DAY, 0);   
         calst.set(java.util.Calendar.MINUTE, 0);   
         calst.set(java.util.Calendar.SECOND, 0);   
         caled.set(java.util.Calendar.HOUR_OF_DAY, 0);   
         caled.set(java.util.Calendar.MINUTE, 0);   
         caled.set(java.util.Calendar.SECOND, 0);   
        //得到两个日期相差的天数   
         int days = ((int) (caled.getTime().getTime() / 1000) - (int) (calst   
                .getTime().getTime() / 1000)) / 3600 / 24;   
         
        return days;   
	}  
}
