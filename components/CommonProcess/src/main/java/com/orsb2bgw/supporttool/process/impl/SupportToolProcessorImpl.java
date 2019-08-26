package com.orsb2bgw.supporttool.process.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.orsb2bgw.supporttool.Objects.constants.ServiceMethods;
import com.orsb2bgw.supporttool.Objects.dto.SearchDTO;
import com.orsb2bgw.supporttool.Objects.dto.ORSSMessageDetailsDTO;
import com.orsb2bgw.supporttool.Objects.dto.ORSSMessageStatusDTO;
import com.orsb2bgw.supporttool.Objects.dto.SupportToolRequest;
import com.orsb2bgw.supporttool.dao.ORSSMessageCodeDAO;
import com.orsb2bgw.supporttool.dao.SupportToolListDAO;
import com.orsb2bgw.supporttool.process.ISupportProcessor;
@Service("supportToolList")
@Transactional
public class SupportToolProcessorImpl implements ISupportProcessor {

	@Autowired
	SupportToolListDAO supportToolListDAO;
	
	@Autowired
	ORSSMessageCodeDAO orssMessageCodeDAO;
	
	@Override
	public void process(SupportToolRequest supportToolRequest) {
		
		if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.SUPPORT_TOOL_SEARCH))
		{
			supportToolRequest.setResponse(getSupportToolSearchResults((SearchDTO)supportToolRequest.getRequest()));
			supportToolRequest.setRecordCount(getSupportToolSearchResultsCount((SearchDTO)supportToolRequest.getRequest()));

			
		}
		
		if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.SUPPORT_TOOL_FETCH_MESSAGE))
		{
			supportToolRequest.setResponse(getMessage((SearchDTO)supportToolRequest.getRequest()));
		}
		
		if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.MESSAGE_CODES))
		{
			supportToolRequest.setResponse(getMessageCodes((SearchDTO)supportToolRequest.getRequest()));
		}
		
		if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.SUPPORT_TOOL_MESSAGE_SEARCH))
		{
			supportToolRequest.setResponse(getMessagePayload((ORSSMessageDetailsDTO)supportToolRequest.getRequest()));
		}
		if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.GET_MESSAGE_STATUS))
		{
			supportToolRequest.setResponse(getMessageStatus((ORSSMessageDetailsDTO)supportToolRequest.getRequest()));
		}
		if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.GET_PENDINGRESUBMISSIONCOUNT))
		{
			supportToolRequest.setResponse(getPendingResubmissionCount((SearchDTO)supportToolRequest.getRequest()));
		}
		if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.GET_MESSAGERESUBMISSIONCOUNT))
		{
			supportToolRequest.setResponse(getMessageResubmissionCount((SearchDTO)supportToolRequest.getRequest()));
		}
		if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.GET_WEEKLY_STATUS))
		{
			supportToolRequest.setResponse(getWeeklyStatus((SearchDTO)supportToolRequest.getRequest()));
		}

	}
private List<ORSSMessageStatusDTO> getWeeklyStatus(SearchDTO searchCriteria) {
		
		return supportToolListDAO.getWeeklyMessageStatus(searchCriteria);
	}
	
private int getMessageResubmissionCount(SearchDTO searchCriteria) {
		
		return supportToolListDAO.getResubmittedMessageCount(searchCriteria);
	}

	private int getPendingResubmissionCount(SearchDTO searchCriteria) {
		
		return supportToolListDAO.getPendingResubmissionCount(searchCriteria);
	}

	private ORSSMessageDetailsDTO getMessageStatus(ORSSMessageDetailsDTO record) {
		// TODO Auto-generated method stub
		return supportToolListDAO.getStatus(record);
	}

	private  ORSSMessageDetailsDTO getMessagePayload(ORSSMessageDetailsDTO record) {
		// TODO Auto-generated method stub
		return supportToolListDAO.getMessagePayload(record);
	}

	private List<String> getMessageCodes(SearchDTO searchCriteria) {
		
		
		return orssMessageCodeDAO.getMessageCodes(searchCriteria);
		
	}

	private List<ORSSMessageDetailsDTO> getMessage(SearchDTO searchCriteria) {
		
		return supportToolListDAO.getSupportToolMessage(searchCriteria);
	}

	private List<ORSSMessageDetailsDTO> getSupportToolSearchResults(SearchDTO searchCriteria) {
		
		
		return supportToolListDAO.searchSupportToolList(searchCriteria);
		
		
	}
	
    private int getSupportToolSearchResultsCount(SearchDTO searchCriteria) {
		
		
		return supportToolListDAO.getRecordsCount(searchCriteria);
		
		
	}

}
