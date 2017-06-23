package com.oa.dao;

import java.util.Map;

import com.oa.bean.GoodsType;

/**
 * @author XMF
 */

public interface GoodsTypeDAO extends BaseDAO<GoodsType> {
	
	public Map<String,String> queryIdAndName();
	
	// 根据类型id查询类型name
	public String queryIdByName(String name);

}
