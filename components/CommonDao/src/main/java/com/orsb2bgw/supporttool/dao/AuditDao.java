package com.orsb2bgw.supporttool.dao;

import javax.sql.DataSource;

public interface AuditDao {
	
	
	
	int insert(Object obj, String key, String sessionId,String siteId) throws Exception;
	
	int update(String key,int resubmitCount,int removeCount) throws Exception;

	String getSiteStatus(String siteName);

}
