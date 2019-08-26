package com.orsb2bgw.supporttool.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.orsb2bgw.supporttool.Objects.dto.SearchDTO;
import com.orsb2bgw.supporttool.dao.ORSSMessageCodeDAO;
import com.orsb2bgw.supporttool.util.B2BLogger;

@Repository("orssMessageCodeDAO")
public class ORSSMessageCodeDAOImpl implements ORSSMessageCodeDAO{

	@Autowired
	DataSource dataSource;
	
	/*@Autowired
	DataSource dataSource1;*/
	
	 @Autowired
	 private ApplicationContext context;

	 private DataSource getDataSource(){
				DataSource dataSource1=null;
				try{
				if(context.getBean("dataSource1")!=null)
					dataSource1=(DataSource) context.getBean("dataSource1");
				//return dataSource1;
				}catch(Exception e){
					logger.error("Error",e);
					
					
				}
				return dataSource1;
				
			}

	private JdbcTemplate getJdbcTemplate(String siteName){
			JdbcTemplate jdbcTemplate=null;
			if(siteName.equalsIgnoreCase("site1"))
			{
				 jdbcTemplate = new JdbcTemplate(dataSource);
			}
			if(siteName.equalsIgnoreCase("site2"))
			{
				DataSource ds=getDataSource();
				if(ds!=null)
				 jdbcTemplate = new JdbcTemplate(ds);
				else
					jdbcTemplate=null;
				 //System.out.println(ds);
				 //System.out.println(jdbcTemplate);
			}
			return jdbcTemplate;
		}
	
	
	private static B2BLogger logger=B2BLogger.getLogger(ORSSMessageCodeDAOImpl.class);


	@Override
	public List<String> getMessageCodes(SearchDTO searchCriteria) {

		List<String> uniqueMessageCodes=null;
		
		JdbcTemplate jdbcTemplate=getJdbcTemplate(searchCriteria.getSiteName());
		
		
		String messageCodes="select MESSAGE_CODE from ORSS_MESSAGE_CODE order by MESSAGE_CODE";
		try
		{
			uniqueMessageCodes= jdbcTemplate.query(messageCodes,new MessageCodesRowMapper());
			logger.info("Message codes successfully fetched from DB.");
		}
		catch(Exception e)
		{
			logger.error("Exception",e);
		}
		return uniqueMessageCodes;
}
	
	
	private final class MessageCodesRowMapper implements RowMapper<String>
	{

		public String mapRow(ResultSet rs, int index) throws SQLException {
			
			return new String(rs.getString("MESSAGE_CODE"));
		}
		
	}
	
	

}
