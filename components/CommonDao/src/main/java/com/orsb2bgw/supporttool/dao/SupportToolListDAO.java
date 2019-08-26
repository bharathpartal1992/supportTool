package com.orsb2bgw.supporttool.dao;

import java.sql.Clob;
import java.sql.Timestamp;
import java.util.List;

import com.orsb2bgw.supporttool.Objects.dto.ORSSMessageDetailsDTO;
import com.orsb2bgw.supporttool.Objects.dto.ORSSMessageStatusDTO;
import com.orsb2bgw.supporttool.Objects.dto.SearchDTO;
import com.orsb2bgw.supporttool.Objects.dto.WorkListDTO;

public interface SupportToolListDAO  {
       public List<ORSSMessageDetailsDTO> searchSupportToolList(SearchDTO searchCriteria);

	public List<ORSSMessageDetailsDTO> getSupportToolMessage(SearchDTO searchCriteria);
	
	public List<String> getMessageCodes();
	
	public ORSSMessageDetailsDTO getMessagePayload(ORSSMessageDetailsDTO record);
	
	public ORSSMessageDetailsDTO getStatus(ORSSMessageDetailsDTO record);

	public int getPendingResubmissionCount(SearchDTO searchCriteria);
	
	public int getResubmittedMessageCount(SearchDTO searchCriteria);
	
	public List<ORSSMessageStatusDTO> getWeeklyMessageStatus(SearchDTO searchCriteria);
	
	public int getRecordsCount(SearchDTO criteris);
	
	
}
