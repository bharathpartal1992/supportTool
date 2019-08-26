package com.orsb2bgw.supporttool.jms;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Properties;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.NamingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.orsb2bgw.supporttool.util.B2BLogger;
import com.orsb2bgw.supporttool.util.ORSS_Constants;
import com.orsb2bgw.supporttool.util.PropertyReader;
import com.orsb2bgw.supporttool.util.UtilityMethods;

import org.springframework.jms.JmsException;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

@Component
public class JMSMessageDispatcher {
	

	@Autowired
	UtilityMethods utility;
	
	private static B2BLogger logger=B2BLogger.getLogger(JMSMessageDispatcher.class);
	private JmsTemplate jmsTemplate;
	public void setJmsTemplate(JmsTemplate jmsTemplate) {
		this.jmsTemplate = jmsTemplate;
	}
	public  String  convId=null;
	public  String  messageid = null;
	public String getConvId() {
		return convId;
	}
	public void setConvId(String convId) {
		this.convId = convId;
	}
	public String getMessageid() {
		return messageid;
	}
	public void setMessageid(String messageid) {
		this.messageid = messageid;
	}
	private TextMessage textMessage;
	
	
	public int  SendMessage(String direction ,String nims_id,String Qjndiname,String payload,String supplierid,String existingMessageProtocolID) throws NamingException, JMSException, IOException
		{
		String tempDirection = direction;
		String tempNims_id  = nims_id;
		String tempsupplierid=supplierid;
		String 	inboundpropFilePath=ORSS_Constants.INBOUND;
	    String 	outboundpropFilePath=ORSS_Constants.OUTBOUND;
		int result=1;
		
		MessageCreator messageCreator=new MessageCreator()  {
			public Message createMessage(Session session) throws JMSException {
			textMessage =session.createTextMessage();
			if( tempDirection.equals(ORSS_Constants.INBOUND))
			{
				if(tempNims_id.equals(ORSS_Constants.NIMSRoBT))
				{  
					 try {
						setJMSProperties(inboundpropFilePath,tempNims_id,tempsupplierid);
					} catch (IOException e) {
						logger.error("Exception",e);
					}					 
				}
				else if(tempNims_id.equals(ORSS_Constants.NIMSOR))
				{
					try {
						setJMSProperties(inboundpropFilePath,tempNims_id,tempsupplierid);
					} catch (IOException e) {
						logger.error("Exception",e);
					}					
				}

			}
		else if (tempDirection.equals(ORSS_Constants.OUTBOUND))
			{
			       
                    
			      	try {
			      		 messageid = utility.generateMsgId(existingMessageProtocolID);
			      		 convId=utility.generateConversationId(existingMessageProtocolID);
			      		 textMessage.setStringProperty("MSG_ID",messageid);
			      		 textMessage.setStringProperty("CONVERSATION_ID", convId);
						 setJMSProperties(outboundpropFilePath,tempNims_id,tempsupplierid);
					} catch (Exception e) {
						logger.error("Exception",e);
					}					 
			}
			textMessage.setText(payload);
			return textMessage;}
			};
        try{
		jmsTemplate.send(Qjndiname,messageCreator);
        }catch( JmsException e){
        	result=0;
        	logger.error("Exception",e);
        	
        }
		return result;
		}
		private  void  setJMSProperties(String  propertyFileName,String nims_id,String supplierid) throws IOException, JMSException
		{
			 Properties jmsproperties=PropertyReader.getPropertiesInstance(propertyFileName);
				 
				 for (Enumeration e = jmsproperties.propertyNames(); e.hasMoreElements(); )
				{
					   String propName = (String)e.nextElement();
					   String propvalue=jmsproperties.getProperty(propName);
					   if(propertyFileName.equals(ORSS_Constants.INBOUND)){
							if(propName.equals(ORSS_Constants.TO)){
													   propvalue=propvalue+nims_id;								  
												   }
											}
						if(propertyFileName.equals(ORSS_Constants.OUTBOUND)){
							   if(propName.equals(ORSS_Constants.FROM_PARTY)){
								   propvalue=propvalue+nims_id;								  
							   }else if(propName.equals(ORSS_Constants.TO_PARTY)){
								   propvalue=propvalue+supplierid;								   
							   }
						}						  
						textMessage.setStringProperty(propName,propvalue);
				}		
		}


}
