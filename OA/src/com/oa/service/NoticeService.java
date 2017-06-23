package com.oa.service;

import java.util.List;

import com.oa.bean.Notice;
import com.oa.common.bean.Pager4EasyUI;

public interface NoticeService extends BaseService<Notice> {
	public Pager4EasyUI<Notice> queryBySearch(Pager4EasyUI<Notice> pager,String noticeName);
	
	/**
	 * 查询最新的3条公告
	 * @return
	 */
	public List<Notice> queryNewNotice();
}
