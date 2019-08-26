package com.orsb2bgw.supporttool.process.impl;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.orsb2bgw.supporttool.Objects.constants.ServiceMethods;
import com.orsb2bgw.supporttool.Objects.dto.SupportToolRequest;
import com.orsb2bgw.supporttool.Objects.dto.WorkListDTO;
import com.orsb2bgw.supporttool.dao.WorkListDAO;
import com.orsb2bgw.supporttool.process.ISupportProcessor;
import com.orsb2bgw.supporttool.util.B2BLogger;
@Service("workListProcessor")
@Qualifier("workList")
@Transactional
public class WorklistProcessorImpl implements ISupportProcessor {
	
	private static B2BLogger logger=B2BLogger.getLogger(WorklistProcessorImpl.class);

	
	@Autowired
	WorkListDAO dao;

	@Override
	public void process(SupportToolRequest supportToolRequest) {
		
		if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.GET_WORKLIST)){
			List<WorkListDTO> result=getWorkList(supportToolRequest);
			supportToolRequest.setResponse(result);
			
		}else if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.RESUBMIT_DETAILS)){
			int resultCount=resubmitDetails(supportToolRequest);
			//System.out.println(resultCount);
			List<WorkListDTO> result=null;
			try {
				result = dao.getWorklistdetails("ALL",null,supportToolRequest.getCurrentSiteName());
 				
 			} catch (Exception e) {
 				logger.error("Exception", e);
 			}
			Object[] resObj=new Object[2];
			resObj[0]=resultCount;
			resObj[1]=result;
			supportToolRequest.setResponse(resObj);
		}
		
		else if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.REMOVE_DETAILS)){
			int resultCount=removeDetails(supportToolRequest);
			//System.out.println(resultCount);
			List<WorkListDTO> result=null;
			try {
				result = dao.getWorklistdetails("ALL",null,supportToolRequest.getCurrentSiteName());
 				
 			} catch (Exception e) {
 				logger.error("Exception", e);
 			}
			Object[] resObj=new Object[2];
			resObj[0]=resultCount;
			resObj[1]=result;
			supportToolRequest.setResponse(resObj);
		}

		 
		// TODO Auto-generated method stub

	}
	
	private Integer resubmitDetails(SupportToolRequest supportToolRequest){
		
		String[] submittedValues=(String[]) supportToolRequest.getRequest();
		String currSiteName=supportToolRequest.getCurrentSiteName();
		
		try {
			return dao.resubmitDetails(submittedValues,currSiteName);
		} catch (Exception e) {
			logger.error("Exception", e);
			return null;
		}
		
		
	}
	
      private Integer removeDetails(SupportToolRequest supportToolRequest){
		
		String[] submittedValues=(String[]) supportToolRequest.getRequest();
		String currSiteName=supportToolRequest.getCurrentSiteName();
		try {
			return dao.removeDetails(submittedValues,currSiteName);
		} catch (Exception e) {
			logger.error("Exception", e);
			return null;
		}
		
		
	}
	
      private List<WorkListDTO> getWorkList(SupportToolRequest supportToolRequest){
  		
 		 //int cPage=0; 
 		 //int int_size=0;
 		// int last_pg_rec=0;
    	  String currentSiteName=supportToolRequest.getCurrentSiteName();
 		 List<WorkListDTO> records=null;
 		Object[] reqArray=(Object[]) supportToolRequest.getRequest();
 		WorkListDTO worklist=(WorkListDTO) reqArray[0];
 		HttpServletRequest request=(HttpServletRequest) reqArray[1];
 		 String view=request.getParameter("view");
 		// String size=request.getParameter("size");
 		 String req_sender_msgId=request.getParameter("SenderMsgID");;
 		 String req_receiver_msgId=request.getParameter("ReceiverMsgID");

 		 if(view ==null)view ="ALL";   
 		 
 		 if(req_sender_msgId ==null)req_sender_msgId = "";
 		 if(req_receiver_msgId ==null)req_receiver_msgId = "";	



 		if( view!=""  ||  (req_sender_msgId!="" || req_receiver_msgId!="")){

 		worklist.setSender_MsgId(req_sender_msgId.trim());
 		worklist.setReceiver_MsgId(req_receiver_msgId.trim());

 		
 			
 			try {
 				records = dao.getWorklistdetails(view.trim(),worklist,currentSiteName);
 				
 			} catch (Exception e) {
 				logger.error("Exception", e);
 			}
             
 		
 		
 	}
 		return records;

 	}
}
