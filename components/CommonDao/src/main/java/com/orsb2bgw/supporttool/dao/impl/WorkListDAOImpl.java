package com.orsb2bgw.supporttool.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.orsb2bgw.supporttool.Objects.dto.WorkListDTO;
import com.orsb2bgw.supporttool.jms.JMSMessageDispatcher;
import com.orsb2bgw.supporttool.util.B2BLogger;
import com.orsb2bgw.supporttool.util.BusinessReceipt;
import com.orsb2bgw.supporttool.util.ORSS_Constants;
import com.orsb2bgw.supporttool.util.UtilityMethods;
import com.orsb2bgw.supporttool.dao.WorkListDAO;

@Repository("workListDAO")
public class WorkListDAOImpl implements WorkListDAO {
	
	@Autowired
	JMSMessageDispatcher msgDispatcher;
	
	 @Autowired
	 private ApplicationContext context;
	
	@Autowired
	UtilityMethods utility;
	
	@Autowired
	DataSource dataSource;
	
	
	
	private DataSource getDataSource(){
		DataSource dataSource1=null;
		try{
		if(context.getBean("dataSource1")!=null)
			dataSource1=(DataSource) context.getBean("dataSource1");
		
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
			 /*System.out.println(ds);
			 System.out.println(jdbcTemplate);*/
		}
		return jdbcTemplate;
	}
	
	private String getSiteId(String currSiteName) {
		
		String siteId = null;
		if(currSiteName.contains("Harmondsworth"))
		{
			siteId = "HW";
		}
		if(currSiteName.contains("Reigate"))
		{
			siteId = "RG";
		}
		
		return siteId;
	}
	
	
	
	private static B2BLogger logger=B2BLogger.getLogger(WorkListDAOImpl.class);

	@Override
	public List<WorkListDTO> searchWorkList() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<WorkListDTO> getWorklistdetails(String view,WorkListDTO worklist,String curSiteName ) throws SQLException{
		String Query=null;		
		String subQuery=" ";
		String sender_msgId="";
		String receiver_msgId="";
		if(worklist!=null){
			sender_msgId=worklist.getSender_MsgId();
		    receiver_msgId=worklist.getReceiver_MsgId();
		}
		List<WorkListDTO> records=null;

		if(!sender_msgId.equals(""))
		{
			subQuery=" AND "+ORSS_Constants.SENDER_MSGID+"='"+sender_msgId+"'";
		}
		if(!receiver_msgId.equals(""))
		{
			subQuery=subQuery+" AND "+ORSS_Constants.RECEIVER_MSGID+"='"+receiver_msgId+"'";
		}

		try
		{	

			if(view.equalsIgnoreCase("ALL"))
			{
				if(subQuery.equalsIgnoreCase(" "))
					Query="SELECT "+ORSS_Constants.ESTIMATE_NUMBER+", "+ORSS_Constants.SUPPLIER_ID+", "+ORSS_Constants.MESSAGE_CODE+", "+ORSS_Constants.MESSAGE_TIMESTAMP+", "+ORSS_Constants.DIRECTION+", "+ORSS_Constants.KEYTYPE+", "+ORSS_Constants.KEY+", "+ORSS_Constants.SENDER_MSGID+", "+ORSS_Constants.RECEIVER_MSGID+", "+ORSS_Constants.PROTOCOL_MESSAGEID+" FROM ORSS_MESSAGE_DETAILS WHERE "+ORSS_Constants.STATUS+"='Manual_Resubmission' AND ("+ORSS_Constants.KEYTYPE+"='BusinessMessage' OR "+ORSS_Constants.KEYTYPE+"='BusinessReceipt') ORDER BY "+ORSS_Constants.MESSAGE_TIMESTAMP+" desc ";
				else
					Query="SELECT "+ORSS_Constants.ESTIMATE_NUMBER+", "+ORSS_Constants.SUPPLIER_ID+", "+ORSS_Constants.MESSAGE_CODE+", "+ORSS_Constants.MESSAGE_TIMESTAMP+", "+ORSS_Constants.DIRECTION+", "+ORSS_Constants.KEYTYPE+", "+ORSS_Constants.KEY+", "+ORSS_Constants.SENDER_MSGID+", "+ORSS_Constants.RECEIVER_MSGID+", "+ORSS_Constants.PROTOCOL_MESSAGEID+" FROM ORSS_MESSAGE_DETAILS WHERE "+ORSS_Constants.STATUS+"='Manual_Resubmission' AND ("+ORSS_Constants.KEYTYPE+"='BusinessMessage' OR "+ORSS_Constants.KEYTYPE+"='BusinessReceipt') "+subQuery+" ORDER BY "+ORSS_Constants.MESSAGE_TIMESTAMP+" desc ";
					
			}

			else if(view.equalsIgnoreCase(ORSS_Constants.INBOUND)|| view.equalsIgnoreCase(ORSS_Constants.OUTBOUND) )				
			{
				if(subQuery.equalsIgnoreCase(" "))
					Query="SELECT "+ORSS_Constants.ESTIMATE_NUMBER+", "+ORSS_Constants.SUPPLIER_ID+", "+ORSS_Constants.MESSAGE_CODE+", "+ORSS_Constants.MESSAGE_TIMESTAMP+", "+ORSS_Constants.DIRECTION+", "+ORSS_Constants.KEYTYPE+", "+ORSS_Constants.KEY+", "+ORSS_Constants.SENDER_MSGID+", "+ORSS_Constants.RECEIVER_MSGID+", "+ORSS_Constants.PROTOCOL_MESSAGEID+" FROM ORSS_MESSAGE_DETAILS WHERE "+ORSS_Constants.STATUS+"='Manual_Resubmission' AND ("+ORSS_Constants.KEYTYPE+"='BusinessMessage' OR "+ORSS_Constants.KEYTYPE+"='BusinessReceipt') AND "+ORSS_Constants.DIRECTION+"='"+view+"' ORDER BY "+ORSS_Constants.MESSAGE_TIMESTAMP+" desc ";
				else
					Query="SELECT "+ORSS_Constants.ESTIMATE_NUMBER+", "+ORSS_Constants.SUPPLIER_ID+", "+ORSS_Constants.MESSAGE_CODE+", "+ORSS_Constants.MESSAGE_TIMESTAMP+", "+ORSS_Constants.DIRECTION+", "+ORSS_Constants.KEYTYPE+", "+ORSS_Constants.KEY+", "+ORSS_Constants.SENDER_MSGID+", "+ORSS_Constants.RECEIVER_MSGID+", "+ORSS_Constants.PROTOCOL_MESSAGEID+" FROM ORSS_MESSAGE_DETAILS WHERE "+ORSS_Constants.STATUS+"='Manual_Resubmission' AND ("+ORSS_Constants.KEYTYPE+"='BusinessMessage' OR "+ORSS_Constants.KEYTYPE+"='BusinessReceipt') "+subQuery+" AND "+ORSS_Constants.DIRECTION+"='"+view+"' ORDER BY "+ORSS_Constants.MESSAGE_TIMESTAMP+" desc ";
					

			}

			else
			{				
				if(subQuery.equalsIgnoreCase(" "))
					Query="SELECT "+ORSS_Constants.ESTIMATE_NUMBER+", "+ORSS_Constants.SUPPLIER_ID+", "+ORSS_Constants.MESSAGE_CODE+", "+ORSS_Constants.MESSAGE_TIMESTAMP+", "+ORSS_Constants.DIRECTION+", "+ORSS_Constants.KEYTYPE+", "+ORSS_Constants.KEY+", "+ORSS_Constants.SENDER_MSGID+", "+ORSS_Constants.RECEIVER_MSGID+", "+ORSS_Constants.PROTOCOL_MESSAGEID+" FROM ORSS_MESSAGE_DETAILS WHERE "+ORSS_Constants.STATUS+"='Manual_Resubmission' AND ("+ORSS_Constants.KEYTYPE+"='BusinessMessage' OR "+ORSS_Constants.KEYTYPE+"='BusinessReceipt') ORDER BY "+ORSS_Constants.MESSAGE_TIMESTAMP+" desc ";
				else
					Query="SELECT "+ORSS_Constants.ESTIMATE_NUMBER+", "+ORSS_Constants.SUPPLIER_ID+", "+ORSS_Constants.MESSAGE_CODE+", "+ORSS_Constants.MESSAGE_TIMESTAMP+", "+ORSS_Constants.DIRECTION+", "+ORSS_Constants.KEYTYPE+", "+ORSS_Constants.KEY+", "+ORSS_Constants.SENDER_MSGID+", "+ORSS_Constants.RECEIVER_MSGID+", "+ORSS_Constants.PROTOCOL_MESSAGEID+" FROM ORSS_MESSAGE_DETAILS WHERE "+ORSS_Constants.STATUS+"='Manual_Resubmission' AND ("+ORSS_Constants.KEYTYPE+"='BusinessMessage' OR "+ORSS_Constants.KEYTYPE+"='BusinessReceipt') "+subQuery+"  ORDER BY "+ORSS_Constants.MESSAGE_TIMESTAMP+" desc ";
					
			}
			logger.info("Query to fetch records"+Query);
			System.out.println(Query);

			records=getAllWorkList(Query,curSiteName);
			System.out.println(records.size());

		}
		catch(Exception e)
		{
			logger.error("Exception",e);
			
		}
		return records;		   
	}	
	
   public List<WorkListDTO> getAllWorkList(String query,String curSiteName) {
		
		JdbcTemplate jdbcTemplate = getJdbcTemplate(curSiteName);
		if(jdbcTemplate==null)
			return null;
		
		String queryToGetExistingUsers =query;
		
		return jdbcTemplate.query(queryToGetExistingUsers,new UserProfileRowMapper());
		
		
	}
	private final class UserProfileRowMapper implements RowMapper<WorkListDTO>
	{

		public WorkListDTO mapRow(ResultSet rs, int index) throws SQLException {
			
			return new WorkListDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)
					,rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10));
		}
		
	}

	/**
	 * @param remove 
	 * @return count of the deleted records
	 * @throws SQLException 
	 */
	@Override
	public int removeDetails(String[] remove,String currSiteName) throws Exception{
		Map<String,String> queueMap=UtilityMethods.getQueueJNDIMap();
		JdbcTemplate jdbcTemplate = getJdbcTemplate(currSiteName);
		String siteId = getSiteId(queueMap.get(currSiteName));
		if(jdbcTemplate==null)
			return -5;
		String[] checkedValue=new String[5];
		String key="";
		String keyType="";
		String protocolMesgId="";
		String direction="";
		String businessReceipt="";
		String Qjndiname="";
		int sendtoSupplier=0;
		WorkListDTO worklist=new WorkListDTO();
		BusinessReceipt Receipt=new BusinessReceipt();
		int count=0;
		String update_query="";	
		String delete_query="";
		String select_query="";
		
		String insert_query="";
		logger.debug("Enter removeDetails of WorkListDAOImpl Class");
		
		try{
			//Properties properties=PropertyReader.getPropertiesInstance(ORSS_Constants.SupportToolProp);
			for(int i=0;i<remove.length;i++){
				StringTokenizer  stringTokenzier=new StringTokenizer(remove[i],"*#*") ;
				int j=0;
				
				logger.info("String Tokenizer : "+stringTokenzier);
				while(stringTokenzier.hasMoreElements()){
					checkedValue[j]=stringTokenzier.nextToken();
					j++;
				}
				key=checkedValue[0];
				keyType=checkedValue[1];
				direction=checkedValue[2];
				protocolMesgId=checkedValue[3];
				select_query="SELECT "+ORSS_Constants.NIMS_ID+","+ORSS_Constants.SUPPLIER_ID+","+ORSS_Constants.ESTIMATE_NUMBER+","+ORSS_Constants.SENDER_MSGID+","+ORSS_Constants.SUPPLIER_REF_NUMBER+","+ORSS_Constants.NIMS_SLIP_NUMBER+","+ORSS_Constants.DIRECTION+" FROM ORSS_MESSAGE_DETAILS WHERE "+ORSS_Constants.KEY+"='"+key+"' AND "+ORSS_Constants.KEYTYPE+"='"+keyType+"' AND "+ORSS_Constants.PROTOCOL_MESSAGEID+"='"+protocolMesgId+"' AND "+ORSS_Constants.STATUS+"='Manual_Resubmission'";
				
				List<Map<String, Object>> listofResult=jdbcTemplate.queryForList(select_query);
				

				logger.info(select_query);
				logger.info("Select for Delete Query has succefully executed");
				
				GregorianCalendar aplnCurrentDateTime = new GregorianCalendar();
                String aplnStoreCurrentDateTimeGMT = UtilityMethods.convertDateToGMT(aplnCurrentDateTime.getTime());       

				
				if(listofResult!=null && !listofResult.isEmpty()){
					worklist.setNims_Id((String) listofResult.get(0).get(ORSS_Constants.NIMS_ID));
					worklist.setSupplier_Id((String) listofResult.get(0).get(ORSS_Constants.SUPPLIER_ID));
					worklist.setEstimate_Number((String) listofResult.get(0).get(ORSS_Constants.ESTIMATE_NUMBER));
					worklist.setSender_MsgId((String) listofResult.get(0).get(ORSS_Constants.SENDER_MSGID));
					worklist.setSupplier_Ref_Number((String) listofResult.get(0).get(ORSS_Constants.SUPPLIER_REF_NUMBER));
					worklist.setNims_Slip_Number((String) listofResult.get(0).get(ORSS_Constants.NIMS_SLIP_NUMBER));	
					worklist.setDirection((String) listofResult.get(0).get(ORSS_Constants.DIRECTION));

				}

				if(direction.equals(ORSS_Constants.OUTBOUND)){

					update_query="UPDATE ORSS_MESSAGE_DETAILS SET "+ORSS_Constants.STATUS+"='Manual_Deletion' ,"+ORSS_Constants.MODIFIEDTIMESTAMPGMT+"=TO_DATE(?,'YYYY/MM/DD HH24:MI:SS') WHERE "+ORSS_Constants.KEY+"='"+key+"' AND "+ORSS_Constants.KEYTYPE+"='"+keyType+"' AND "+ORSS_Constants.PROTOCOL_MESSAGEID+"='"+protocolMesgId+"'AND "+ORSS_Constants.STATUS+"='Manual_Resubmission'";
					delete_query="DELETE FROM ORSS_RECEIPT_CORRELATION WHERE "+ORSS_Constants.KEY+"='"+key+"' AND "+ORSS_Constants.KEYTYPE+"='"+keyType+"' AND "+ORSS_Constants.PROTOCOL_MESSAGEID+"='"+protocolMesgId+"'";
					int updateSuccess=jdbcTemplate.update(update_query,new Object[] { aplnStoreCurrentDateTimeGMT });
					if(updateSuccess==1)
						count++;			
					jdbcTemplate.update(delete_query);
					logger.debug("Remove Action has been started");
					logger.info("The message has been deleted manually for  "+worklist.getSender_MsgId()+" and the  direction is "+worklist.getDirection());
					logger.debug("Remove Action has been completed");
				}

				if(direction.equals(ORSS_Constants.INBOUND)){

					businessReceipt=Receipt.genarate_BusinessReceipt(worklist,key);
					
					if(currSiteName.equalsIgnoreCase("site2"))
					{
						Qjndiname=(String) queueMap.get(siteId+"_BPS_TO_B2B");
					}
					else if(currSiteName.equalsIgnoreCase("site1"))
					{
						Qjndiname=(String) queueMap.get(siteId+"_BPS_TO_B2B");
					}
					
					logger.info("the JNDI Name where Buisness Recipts to be posted" +Qjndiname);
					
					sendtoSupplier=msgDispatcher.SendMessage("Outbound",worklist.getNims_Id(), Qjndiname, businessReceipt,worklist.getSupplier_Id(),protocolMesgId);
					if(sendtoSupplier==1){
						java.sql.Timestamp  Receipt_Timestamp = new java.sql.Timestamp(new java.util.Date().getTime());

						logger.debug("Remove Action has been started");
						logger.info("The message has been deleted manually for  "+worklist.getSender_MsgId()+" and the  direction is "+worklist.getDirection());
						logger.info("Business Receipt has been sent to the supplier "+worklist.getSupplier_Id());				
						
						//update_query="UPDATE ORSS_MESSAGE_DETAILS SET "+ORSS_Constants.STATUS+"='Manual_Deletion' WHERE "+ORSS_Constants.KEY+"='"+key+"' AND "+ORSS_Constants.KEYTYPE+"='"+keyType+"' AND "+ORSS_Constants.PROTOCOL_MESSAGEID+"='"+protocolMesgId+"'AND "+ORSS_Constants.STATUS+"='Manual_Resubmission'";
						//update_query="UPDATE ORSS_MESSAGE_DETAILS SET "+ORSS_Constants.STATUS+"='Manual_Deletion', "+ORSS_Constants.MODIFIEDTIMESTAMPGMT+"=? WHERE "+ORSS_Constants.KEY+"='"+key+"' AND "+ORSS_Constants.KEYTYPE+"='"+keyType+"' AND "+ORSS_Constants.PROTOCOL_MESSAGEID+"='"+protocolMesgId+"'AND "+ORSS_Constants.STATUS+"='Manual_Resubmission'";

                        String Update="UPDATE ORSS_MESSAGE_DETAILS SET "+ORSS_Constants.STATUS+"='Manual_Deletion', "+ORSS_Constants.MODIFIEDTIMESTAMPGMT+"=TO_DATE(?,'YYYY/MM/DD HH24:MI:SS'), "+ ORSS_Constants.RECEIPT_TIMESTAMP+"=? WHERE "+ORSS_Constants.KEY+"=? AND "+ORSS_Constants.KEYTYPE+"=? AND "+ORSS_Constants.PROTOCOL_MESSAGEID+"=?";
						int result=jdbcTemplate.update(Update,new Object[] { aplnStoreCurrentDateTimeGMT,Receipt_Timestamp, key, keyType, protocolMesgId });
						delete_query="DELETE FROM ORSS_RECEIPT_CORRELATION WHERE "+ORSS_Constants.KEY+"='"+key+"' AND "+ORSS_Constants.KEYTYPE+"='"+keyType+"' AND "+ORSS_Constants.PROTOCOL_MESSAGEID+"='"+protocolMesgId+"'";
						//jdbcTemplate.update(update_query,new Object[]{aplnStoreCurrentDateTimeGMT});
						if(result>0)
						jdbcTemplate.update(delete_query);			 	
						

						String protocol_msgID=utility.generateMsgId(protocolMesgId);
						String conversationId=utility.generateConversationId(protocolMesgId);
						java.sql.Timestamp  current_Timestamp = new java.sql.Timestamp(new java.util.Date().getTime());

						insert_query="INSERT INTO ORSS_MESSAGE_DETAILS ("+ORSS_Constants.KEY+","+ORSS_Constants.KEYTYPE+","+ORSS_Constants.PROTOCOL_MESSAGEID+","+ORSS_Constants.CONVERSATION_ID+","+ORSS_Constants.NIMS_ID+","+ORSS_Constants.SUPPLIER_ID+","+
						ORSS_Constants.DIRECTION+","+ORSS_Constants.MESSAGE_TIMESTAMP+","+ORSS_Constants.RECEIPT_TIMESTAMP+","+ORSS_Constants.PAYLOAD+","+ORSS_Constants.SENDER_MSGID+","+ORSS_Constants.RECEIVER_MSGID+","+ORSS_Constants.STATUS+","+ORSS_Constants.MODIFIEDTIMESTAMPGMT+") " +
						" VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,TO_DATE(?,'YYYY/MM/DD HH24:MI:SS'))";				
						
						jdbcTemplate.update(insert_query,new Object[] { key, ORSS_Constants.BUSINESS_RECEIPT, protocol_msgID, conversationId, worklist.getNims_Id(), worklist.getSupplier_Id(),
								ORSS_Constants.INBOUND, current_Timestamp, current_Timestamp, businessReceipt, worklist.getEstimate_Number(), worklist.getSender_MsgId(), ORSS_Constants.BR_Status, aplnStoreCurrentDateTimeGMT  });
						count++;
						logger.debug("Remove Action has been completed");
					}
				}
			}
		}catch(Exception e){
			logger.error("Exception",e);
			
		}
		logger.debug("Exit removeDetails of WorkListDAO Class");
		return count;
	}
	

	


	


	@Override
	public int resubmitDetails(String[] resubmit,String currSiteName) throws Exception{
		

		logger.info("Entered Resubmitting Function");
		Map<String,String> queueMap=UtilityMethods.getQueueJNDIMap();
		JdbcTemplate jdbcTemplate = getJdbcTemplate(currSiteName);
		String siteId = getSiteId(queueMap.get(currSiteName));
		if(jdbcTemplate==null)
			return -5;
		String[] checkedValue=new String[5];
		String key="";
		String keyType="";
		String protocolMesgId="";
		int count=0;
		int sendresult=0;
			
		String select_query="";
		String Update="";
		String direction="";
		String payload="";
		String nims_Id="";
		String supplierid="";
		String sendermsgID="";
		String Qjndiname = "";
		String RESUBMISSION_INTERVAL="";
		String UpdateOB="";
		
		//Properties properties=PropertyReader.getPropertiesInstance(ORSS_Constants.SupportToolProp);
		logger.debug("Enter resubmitDetails of WorkListDAOImpl Class");
		try{

			for(int i=0;i<resubmit.length;i++){
				StringTokenizer  stringTokenzier=new StringTokenizer(resubmit[i],"*#*") ;
				int j=0;
				while(stringTokenzier.hasMoreElements()){
					checkedValue[j]=stringTokenzier.nextToken();
					j++;
				}
				key=checkedValue[0];
				keyType=checkedValue[1];
				protocolMesgId=checkedValue[3];
				logger.info("The Protocol Message ID "+protocolMesgId);
				select_query="SELECT "+ORSS_Constants.DIRECTION+","+ORSS_Constants.PAYLOAD+","+ORSS_Constants.NIMS_ID+","+ORSS_Constants.SUPPLIER_ID+","+ORSS_Constants.SENDER_MSGID+" FROM ORSS_MESSAGE_DETAILS WHERE "+ORSS_Constants.KEY+"='"+key+"' AND "+ORSS_Constants.KEYTYPE+"='"+keyType+"' And "+ORSS_Constants.PROTOCOL_MESSAGEID+"='"+protocolMesgId+"' And "+ORSS_Constants.STATUS+"='Manual_Resubmission'";

				List<Map<String, Object>> listofResult=jdbcTemplate.queryForList(select_query);
				logger.info("Select Query Executed");
				//resultSet=stmt.executeQuery(select_query);
				if(listofResult!=null && !listofResult.isEmpty()){
					direction=(String) listofResult.get(0).get(ORSS_Constants.DIRECTION);
					payload=(String)listofResult.get(0).get(ORSS_Constants.PAYLOAD);
					nims_Id=(String) listofResult.get(0).get(ORSS_Constants.NIMS_ID);
					supplierid=(String) listofResult.get(0).get(ORSS_Constants.SUPPLIER_ID);
					sendermsgID=(String) listofResult.get(0).get(ORSS_Constants.SENDER_MSGID);

					logger.info(" Selected what message to be posted");
					if(direction.equals(ORSS_Constants.INBOUND))
					{
						if(currSiteName.equalsIgnoreCase("site2"))
						{
							String tempId="_".concat(nims_Id);
							Qjndiname=(String) queueMap.get(siteId+tempId);
						}
						else if(currSiteName.equalsIgnoreCase("site1"))
						{
							Qjndiname=(String) queueMap.get(siteId+"_"+nims_Id);
						}
					}
					else		
					{
						if(currSiteName.equalsIgnoreCase("site2"))
						{
							Qjndiname=(String) queueMap.get(siteId+"_BPS_TO_B2B");
						}
						else if(currSiteName.equalsIgnoreCase("site1"))
						{
							Qjndiname=(String) queueMap.get(siteId+"_BPS_TO_B2B");
						}
						

					}
					logger.info("Queue Name that Needs to be posted" +Qjndiname);
					sendresult=msgDispatcher.SendMessage(direction, nims_Id, Qjndiname, payload,supplierid,protocolMesgId);

					//System.out.println("sendresult="+sendresult);
					if(sendresult==1){
						String msgID=msgDispatcher.getMessageid();
						String conID=msgDispatcher.getConvId();
						logger.info("Resubmit Action has been started");
						java.sql.Timestamp  Resubmitted_Timestamp = new java.sql.Timestamp(new java.util.Date().getTime());
						
					    GregorianCalendar aplnCurrentDateTime = new GregorianCalendar();
		                String aplnStoreCurrentDateTimeGMT = UtilityMethods.convertDateToGMT(aplnCurrentDateTime.getTime());       

						Update="UPDATE ORSS_MESSAGE_DETAILS SET "+ORSS_Constants.STATUS+"='In_Transit',"+ORSS_Constants.RESUBMITTED_DATETIME+"=? ,"+ORSS_Constants.MODIFIEDTIMESTAMPGMT+"=TO_DATE(?,'YYYY/MM/DD HH24:MI:SS') WHERE "+ORSS_Constants.KEY+"=? AND "+ORSS_Constants.KEYTYPE+"=? AND "+ORSS_Constants.PROTOCOL_MESSAGEID+"=?";
						UpdateOB="UPDATE ORSS_MESSAGE_DETAILS SET "+ORSS_Constants.STATUS+"='In_Transit',"+ORSS_Constants.RESUBMITTED_DATETIME+"=? ,"+ORSS_Constants.MODIFIEDTIMESTAMPGMT+"=TO_DATE(?,'YYYY/MM/DD HH24:MI:SS') ,PROTOCOL_MESSAGEID=? , CONVERSATION_ID=? WHERE "+ORSS_Constants.KEY+"=? AND "+ORSS_Constants.KEYTYPE+"=? AND "+ORSS_Constants.PROTOCOL_MESSAGEID+"=?";
						if(direction.equals("Inbound"))
						jdbcTemplate.update(Update,new Object[] {Resubmitted_Timestamp, aplnStoreCurrentDateTimeGMT, key, keyType, protocolMesgId });
						else
							jdbcTemplate.update(UpdateOB,new Object[] {Resubmitted_Timestamp, aplnStoreCurrentDateTimeGMT,msgID,conID, key, keyType, protocolMesgId });

							RESUBMISSION_INTERVAL=(String) queueMap.get("RESUBMISSION_INTERVAL");
						logger.info("TAKING RESUBMITTED INTERVAL" +RESUBMISSION_INTERVAL);
						Date LET=utility.getLET(RESUBMISSION_INTERVAL,Resubmitted_Timestamp);
						java.sql.Timestamp  LET_Timestamp = new java.sql.Timestamp(LET.getTime());
						String getResubCountQuery="select RESUBMISSION_COUNT from ORSS_RECEIPT_CORRELATION where "+ORSS_Constants.KEY+"=? AND "+ORSS_Constants.KEYTYPE+"=? AND "+ORSS_Constants.PROTOCOL_MESSAGEID+"=?";
						int resubmitCount=0;
						try{
						    resubmitCount=jdbcTemplate.queryForObject(
								getResubCountQuery, new Object[] { key,keyType,protocolMesgId }, Integer.class);
						}catch(DataAccessException e){
							logger.error("Exception", e);
							
						}
						++resubmitCount;
						Update="UPDATE ORSS_RECEIPT_CORRELATION SET "+ORSS_Constants.STATUS+"='In_Transit',"+ORSS_Constants.RESUBMISSION_COUNT+"="+resubmitCount+","+ORSS_Constants.LET+"=? WHERE "+ORSS_Constants.KEY+"=? AND "+ORSS_Constants.KEYTYPE+"=? AND "+ORSS_Constants.PROTOCOL_MESSAGEID+"=?";
						UpdateOB="UPDATE ORSS_RECEIPT_CORRELATION SET "+ORSS_Constants.STATUS+"='In_Transit',"+ORSS_Constants.RESUBMISSION_COUNT+"="+resubmitCount+","+ORSS_Constants.LET+"=? ,PROTOCOL_MESSAGEID=? WHERE "+ORSS_Constants.KEY+"=? AND "+ORSS_Constants.KEYTYPE+"=? AND "+ORSS_Constants.PROTOCOL_MESSAGEID+"=?";
						if(direction.equals("Inbound"))
						jdbcTemplate.update(Update,new Object[] {LET_Timestamp, key, keyType, protocolMesgId });
						else
							jdbcTemplate.update(UpdateOB,new Object[] {LET_Timestamp, msgID, key, keyType, protocolMesgId });

						//System.out.println("result="+result);
						count++;
						logger.info("The message has been resubmitted manually for  "+sendermsgID+" and the  direction is "+direction);
						logger.debug("Resubmit Action has been completed");
					}
				}
				
			}
		}catch(Exception e){
			logger.error("Exception",e);
			
		}
		
		return count;
	}

	

	


	
	
}