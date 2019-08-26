package com.orsb2bgw.supporttool.dao.impl;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.orsb2bgw.supporttool.Objects.dto.ORSSMessageDetailsDTO;
import com.orsb2bgw.supporttool.Objects.dto.ORSSMessageStatusDTO;
import com.orsb2bgw.supporttool.Objects.dto.SearchDTO;
import com.orsb2bgw.supporttool.dao.SupportToolListDAO;
import com.orsb2bgw.supporttool.util.B2BLogger;
import com.orsb2bgw.supporttool.util.UtilityMethods;




@Repository("supportToolListDAO")
public class SupportToolListDAOImpl implements SupportToolListDAO {

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
					logger.error("Exception",e);
					
					
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
	
	
	private static B2BLogger logger=B2BLogger.getLogger(SupportToolListDAOImpl.class);
	
	private static String generateSQL(SearchDTO searchCriteria){
        StringBuilder sqlToSearchORSSMessageDetails=new StringBuilder("select KEY,ESTIMATE_NUMBER,CONTRACT_NUMBER,SUPPLIER_ID,MESSAGE_CODE,NIMS_SLIP_NUMBER,SUPPLIER_REF_NUMBER,MESSAGE_TIMESTAMP,STATUS,SENDER_MESSAGEID,RECEIVER_MESSAGEID from ORSS_MESSAGE_DETAILS where");
		
		sqlToSearchORSSMessageDetails.append("\t"+"STATUS"+"\t"+" NOT IN ('Manual_Deletion')"+"AND"+"\t");

		
		if(null!=searchCriteria.getBusinessStatus() && !searchCriteria.getBusinessStatus().isEmpty() && !searchCriteria.getBusinessStatus().trim().isEmpty())
		{
			sqlToSearchORSSMessageDetails.append("\t"+"UPPER(STATUS)='"+searchCriteria.getBusinessStatus()+"'\t"+"AND"+"\t");
		}
		if(null!=searchCriteria.getContractNumber() && !searchCriteria.getContractNumber().isEmpty() && !searchCriteria.getContractNumber().trim().isEmpty())
		{
			sqlToSearchORSSMessageDetails.append("\t"+"CONTRACT_NUMBER='"+searchCriteria.getContractNumber()+"'\t"+"AND"+"\t");
		}
		if(null!=searchCriteria.getEstimateNumber() && !searchCriteria.getEstimateNumber().isEmpty() && !searchCriteria.getEstimateNumber().trim().isEmpty())
		{
			sqlToSearchORSSMessageDetails.append("\t"+"ESTIMATE_NUMBER='"+searchCriteria.getEstimateNumber()+"'\t"+"AND"+"\t");
		}
		if(null!=searchCriteria.getMessageCode() && !searchCriteria.getMessageCode().isEmpty() && !searchCriteria.getMessageCode().trim().isEmpty())
		{
			sqlToSearchORSSMessageDetails.append("\t"+"MESSAGE_CODE='"+searchCriteria.getMessageCode()+"'\t"+"AND"+"\t");
		}
		if(null!=searchCriteria.getReceiverMessageId() && !searchCriteria.getReceiverMessageId().isEmpty() && !searchCriteria.getReceiverMessageId().trim().isEmpty())
		{
			sqlToSearchORSSMessageDetails.append("\t"+"RECEIVER_MESSAGEID='"+searchCriteria.getReceiverMessageId()+"'\t"+"AND"+"\t");
		}
		if(null!=searchCriteria.getSenderMessageId() && !searchCriteria.getSenderMessageId().isEmpty() && !searchCriteria.getSenderMessageId().trim().isEmpty())
		{
			sqlToSearchORSSMessageDetails.append("\t"+"SENDER_MESSAGEID='"+searchCriteria.getSenderMessageId()+"'\t"+"AND"+"\t");
		}
		if(null!=searchCriteria.getSupplierId() && !searchCriteria.getSupplierId().isEmpty() && !searchCriteria.getSupplierId().trim().isEmpty())
		{
		
			sqlToSearchORSSMessageDetails.append("\t"+"SUPPLIER_ID='"+searchCriteria.getSupplierId()+"'\t"+"AND"+"\t");
			
		}
		if(null!=searchCriteria.getFromDate() && null!=searchCriteria.getToDate())
		{
			SimpleDateFormat dateFormat=new SimpleDateFormat("dd-MM-yyyy");
			
			
			sqlToSearchORSSMessageDetails.append("\t"+"trunc(MESSAGE_TIMESTAMP) BETWEEN TO_DATE('"+dateFormat.format(searchCriteria.getFromDate())+"','DD-MM-YYYY') AND TO_DATE('"+dateFormat.format(searchCriteria.getToDate())+"','DD-MM-YYYY')");
		}
		
		if(null==searchCriteria.getFromDate() && null==searchCriteria.getToDate())
		{
			
			 int index= sqlToSearchORSSMessageDetails.lastIndexOf("AND");
			 //System.out.println(sqlToSearchORSSMessageDetails.substring(0, index));
			 sqlToSearchORSSMessageDetails= new StringBuilder(sqlToSearchORSSMessageDetails.substring(0, index));
			
		}
		return sqlToSearchORSSMessageDetails.toString();
	}
	
	@Override
	@Transactional
	public int getRecordsCount(SearchDTO criteris){
		JdbcTemplate jdbcTemplate=getJdbcTemplate(criteris.getSiteName());
		String constToAppend="select count(*) ";
		String generatedSQL=generateSQL(criteris);
		String modifiedSql=generatedSQL.substring(generatedSQL.indexOf("from"));
		String checkCountSQL=constToAppend+modifiedSql;
		//System.out.println("{{{"+checkCountSQL+"}}}");
		int countOfRows = jdbcTemplate.queryForObject(checkCountSQL, Integer.class);
		//System.out.println("row count="+countOfRows);
		
		int setValue=-1;
		try {
			setValue = UtilityMethods.getLimitCount();
		} catch (IOException e) {
			logger.error("Exception", e);
			setValue=countOfRows+1;
		}
		int result=5;
		if(countOfRows>=setValue)
			result=-1;
		else
			result=0;
		
		return result;
	}

	@Override
	@Transactional
	public List<ORSSMessageDetailsDTO> searchSupportToolList(SearchDTO searchCriteria) {
		
		
		JdbcTemplate jdbcTemplate=getJdbcTemplate(searchCriteria.getSiteName());
		List<ORSSMessageDetailsDTO> messages=null;
		try
		{
			
			
	    String sql=generateSQL(searchCriteria);
	    
		messages= jdbcTemplate.query(sql,new ORSSMessageDetailsProfileRowMapper());
		logger.info("ORSS Messages fetched successfully based on search criteria.");
		}
		catch(Exception e)
		{
			logger.error("Exception",e);
		}
		
		return messages;
		
	}
	
	private final class ORSSMessageDetailsProfileRowMapper implements RowMapper<ORSSMessageDetailsDTO>
	{

		public ORSSMessageDetailsDTO mapRow(ResultSet rs, int index) throws SQLException {
			
			return new ORSSMessageDetailsDTO(rs.getString("KEY"),
					rs.getString("ESTIMATE_NUMBER"),
					rs.getString("CONTRACT_NUMBER"),
					rs.getString("SUPPLIER_ID"),
					rs.getString("MESSAGE_CODE"),
					rs.getString("NIMS_SLIP_NUMBER"),
					rs.getString("SUPPLIER_REF_NUMBER"),
					rs.getString("MESSAGE_TIMESTAMP"),
					rs.getString("STATUS"),
					rs.getString("SENDER_MESSAGEID"),
					rs.getString("RECEIVER_MESSAGEID"));
		}
		
	}

	

	@Override
	@Transactional
	public List<String> getMessageCodes() {
		
		
		List<String> uniqueMessageCodes=null;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String messageCodes="select unique(MESSAGE_CODE) from ORSS_MESSAGE_DETAILS where MESSAGE_CODE IS not null";
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

	@Override
	@Transactional
	public ORSSMessageDetailsDTO getMessagePayload(ORSSMessageDetailsDTO record) {
		
		JdbcTemplate jdbcTemplate =getJdbcTemplate(record.getSiteName());
		ORSSMessageDetailsDTO orssMessageDetailsDTO=null;
		
		
	
		String sqlToFetchMessagePayload=null;
		
		if(record.getMessageCode().equals("BR"))
		{
			
			sqlToFetchMessagePayload = "SELECT PAYLOAD From  ORSS_MESSAGE_DETAILS Where SENDER_MESSAGEID='"+record.getSenderMessageId()+"' AND RECEIVER_MESSAGEID='"+record.getReceiverMessageId()+"'";
		}
		else
		{
			sqlToFetchMessagePayload = "SELECT PAYLOAD From  ORSS_MESSAGE_DETAILS Where SENDER_MESSAGEID='"+record.getSenderMessageId()+"' AND RECEIVER_MESSAGEID='"+record.getReceiverMessageId()+"' AND ESTIMATE_NUMBER='"+record.getEstimateNumber()+"' AND CONTRACT_NUMBER='"+record.getContractNumber()+"'";
		}
		
		try
		{
		
			orssMessageDetailsDTO=  (ORSSMessageDetailsDTO) jdbcTemplate.queryForObject(sqlToFetchMessagePayload,new MessageProfileRowMapper());
	
		logger.info("Payload for message successfully fetched from DB.");
	}
	catch(Exception e)
	{
		logger.error("Exception",e);
	}
		
		return orssMessageDetailsDTO;
		}
	
	
	private final class MessageProfileRowMapper implements RowMapper<ORSSMessageDetailsDTO>
	{

		public ORSSMessageDetailsDTO mapRow(ResultSet rs, int index) throws SQLException {
			
			return new ORSSMessageDetailsDTO(rs.getClob("PAYLOAD"));
		}
		
	}

	@Override
	@Transactional
	public List<ORSSMessageDetailsDTO> getSupportToolMessage(SearchDTO searchCriteria) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public ORSSMessageDetailsDTO getStatus(ORSSMessageDetailsDTO record) {
		
		JdbcTemplate jdbcTemplate =getJdbcTemplate(record.getSiteName());
		ORSSMessageDetailsDTO orssMessageDetailsDTO=null;
		
		
		
		String sqlToFetchMessagePayload=null;
		
		if(record.getMessageCode().equals("BR"))
		{
			 sqlToFetchMessagePayload = "SELECT MESSAGE_TIMESTAMP,RECEIPT_TIMESTAMP,DIRECTION,EXCEPTIONMESSAGE,STATUS,to_char(SYSTIMESTAMP,'yyyy-MM-dd hh:mm:ss.ff') AS CURTIMESTAMP From  ORSS_MESSAGE_DETAILS Where SENDER_MESSAGEID='"+record.getSenderMessageId()+"' AND RECEIVER_MESSAGEID='"+record.getReceiverMessageId()+"'";

		}
		else
		{
		     sqlToFetchMessagePayload = "SELECT MESSAGE_TIMESTAMP,RECEIPT_TIMESTAMP,DIRECTION,EXCEPTIONMESSAGE,STATUS,to_char(SYSTIMESTAMP,'yyyy-MM-dd hh:mm:ss.ff') AS CURTIMESTAMP From  ORSS_MESSAGE_DETAILS Where SENDER_MESSAGEID='"+record.getSenderMessageId()+"' AND RECEIVER_MESSAGEID='"+record.getReceiverMessageId()+"' AND ESTIMATE_NUMBER='"+record.getEstimateNumber()+"' AND CONTRACT_NUMBER='"+record.getContractNumber()+"'";
		}
		
		try
		{
		orssMessageDetailsDTO=  (ORSSMessageDetailsDTO) jdbcTemplate.queryForObject(sqlToFetchMessagePayload,new StatusProfileRowMapper());
		logger.info("Status for message successfully fetched from DB.");
		}
		catch(Exception e)
		{
			logger.error("Exception",e);
		}
			
			return orssMessageDetailsDTO;
		
	}
	
	private final class StatusProfileRowMapper implements RowMapper<ORSSMessageDetailsDTO>
	{

		public ORSSMessageDetailsDTO mapRow(ResultSet rs, int index) throws SQLException {
			
			return new ORSSMessageDetailsDTO(rs.getString("MESSAGE_TIMESTAMP"),
					rs.getString("RECEIPT_TIMESTAMP"),
					rs.getString("DIRECTION"),
					rs.getString("EXCEPTIONMESSAGE"),
					rs.getString("STATUS"),
					rs.getTimestamp("CURTIMESTAMP"));
		}
		
	}

	
	@Override
	public int getPendingResubmissionCount(SearchDTO searchCriteria) {
		
		int count=0;
		
		JdbcTemplate jdbcTemplate=getJdbcTemplate(searchCriteria.getSiteName());
		
		
		Date date=new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

		String query="SELECT Count(*) from ORSS_MESSAGE_DETAILS where STATUS='Manual_Resubmission' and TRUNC(MESSAGE_TIMESTAMP) = TO_DATE('"+dateFormat.format(date)+"','dd/mm/yyyy')";
		
		try
		{
			count=jdbcTemplate.queryForObject(
					query, new Object[] {}, Integer.class);
			
		logger.info("Count for Message pending for Manual Resubmission successfully fetched from DB.");
		}
		catch(Exception e)
		{
			logger.error("Exception",e);
		}
		return count;
	}

	@Override
	public int getResubmittedMessageCount(SearchDTO searchCriteria) {

		int count=0;
		
		JdbcTemplate jdbcTemplate=getJdbcTemplate(searchCriteria.getSiteName());
		
		
		Date date=new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	
		String query="SELECT Count(*) from ORSS_MESSAGE_DETAILS where  TRUNC(RESUBMITTED_DATETIME) = TO_DATE('"+dateFormat.format(date)+"','dd/mm/yyyy')";
		try
		{
		 count=jdbcTemplate.queryForObject(
					query, new Object[] {}, Integer.class);
		logger.info("Count for Message which  are Manually Resubmitted successfully fetched from DB.");
		}
		catch(Exception e)
		{
			logger.error("Exception",e);
		}
		return count;
	}

	@Override
	public List<ORSSMessageStatusDTO> getWeeklyMessageStatus(SearchDTO searchCriteria) {
		
		JdbcTemplate jdbcTemplate=getJdbcTemplate(searchCriteria.getSiteName());
		List<ORSSMessageStatusDTO> orssMessageStatusDTO=null;
		
		
		StringBuilder sqlToFetchStatusForWeek=new StringBuilder("SELECT DISTINCT(to_char(MESSAGE_TIMESTAMP,'yyyy-mm-dd')),sum(case when STATUS = 'Success' and RESUBMITTED_DATETIME IS NULL then 1 else 0 end),sum(case when STATUS = 'Failure' then 1 else 0 end),sum(case when STATUS = 'Success' and RESUBMITTED_DATETIME IS NOT NULL then 1 else 0 end)   FROM ORSS_MESSAGE_DETAILS WHERE  MESSAGE_TIMESTAMP > sysdate-7 group by to_char(MESSAGE_TIMESTAMP,'yyyy-mm-dd')");
		try
		{
			orssMessageStatusDTO= jdbcTemplate.query(sqlToFetchStatusForWeek.toString(),new ORSSMessageStatusDetailsProfileRowMapper());
			logger.info("Status Report for Messages fetched for past 7 days.");
		}
		catch(Exception e)
		{
			logger.error("Exception",e);
		}
		
		return orssMessageStatusDTO;
	}
	
	private final class ORSSMessageStatusDetailsProfileRowMapper implements RowMapper<ORSSMessageStatusDTO>
	{

		public ORSSMessageStatusDTO mapRow(ResultSet rs, int index) throws SQLException {
			
			return new ORSSMessageStatusDTO(rs.getDate(1),
					rs.getInt(2),
					rs.getInt(3),
					rs.getInt(4)
					);
		}
		
	}

	
	


	
	
}
