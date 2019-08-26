package com.orsb2bgw.supporttool.dao.impl;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import com.orsb2bgw.supporttool.dao.AuditDao;
import com.orsb2bgw.supporttool.util.B2BLogger;
import com.orsb2bgw.supporttool.util.UtilityMethods;

@Repository("auditDao")
public class AuditDaoImpl implements AuditDao{
	
	private static String errMessage="Exception";
	
	@Autowired
	UtilityMethods utility;
	
	@Autowired
	DataSource dataSource;
	
	

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Autowired
	 private ApplicationContext context;
	 
	 private static B2BLogger logger=B2BLogger.getLogger(AuditDaoImpl.class);



	public DataSource getDataSource(){
			DataSource dataSource1=null;
			try{
			if(context.getBean("dataSource1")!=null)
				dataSource1=(DataSource) context.getBean("dataSource1");
			//return dataSource1;
			}catch(Exception e){
				logger.error(errMessage,e);
				
				
			}
			return dataSource1;
			
		}

	

	@Override
	public int insert(Object obj, String key, String sessionId,String siteId) throws Exception {
		  //UserDTO user=(UserDTO) obj;
		  String Username = (String) obj;
		  boolean status=false;
		  int success=0;
		  try{
			//Username=user.getUsername();
			String username=Username;			
			JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		    Timestamp currentTimeStamp=new Timestamp(new Date().getTime());		 	
            String query="INSERT INTO AUDIT_LOGS(USER_NAME,ID, SIGN_OUT, SIGN_IN, SESSION_ID, SITE_ID) values(?,?,?,?,?,?)";            
            success=jdbcTemplate
    				.update(query,
    						new Object[] { username,
    								key, null , currentTimeStamp , sessionId ,siteId });
            if(success>0)
            	status=true;

		  }   
		catch(DataAccessException e){
			logger.error(errMessage, e);
		}
		  catch(Exception e){
			logger.error(errMessage, e);
		}
		finally{
			
		}
		 return success;
	}

	

	
	@Override
	@Transactional
	public String getSiteStatus(String siteName) {
	 
		String result=null;
		if(!siteName.equals("site1")){
		Map<String,String> lMap=UtilityMethods.getSiteStatusMap();
		if(((String)lMap.get(siteName)).equals("Outofservice")){
			return "Outofservice";
		}else{
		DataSource ds= getDataSource();
		if(ds!=null)
			result="Inservice";
			else
			result="Site can not be selected due to technical error. Please check the logs for more details.";	
	
		}
		/*if(siteStatus!=null && !siteStatus.equals("")){
			if(ds!=null)
			result=siteStatus.trim();
			else
				result="Site can not be selected due to technical error. Please check the logs for more details.";	
		}*/
		}else{
			result="Inservice";
		}
		
		return result;
	}

	@Override
	public int update(String key, int resubmitCount, int removeCount) throws Exception {

	
		  boolean status=false;
		  int success=0;
		  try{
			  JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		      Timestamp currentTimeStamp=new Timestamp(new Date().getTime());
			  String sql ="UPDATE AUDIT_LOGS SET SIGN_OUT=? ,RESUBMIT_COUNT=?,MESSAGE_DELETED_COUNT=?  where ID=?";
			  success=jdbcTemplate
	    				.update(sql,
	    						new Object[] { currentTimeStamp,resubmitCount,removeCount,
	    								key });
	            if(success>0)
	            	status=true;
			
			
		  }
		catch(Exception e){
			logger.error(errMessage, e);
		}
		finally{
			
		}
		 return success;
	
	}
}