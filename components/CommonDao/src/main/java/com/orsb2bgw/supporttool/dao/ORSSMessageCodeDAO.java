package com.orsb2bgw.supporttool.dao;

import java.util.List;

import com.orsb2bgw.supporttool.Objects.dto.SearchDTO;
import com.orsb2bgw.supporttool.Objects.dto.WorkListDTO;

public interface ORSSMessageCodeDAO {
	
	public List<String> getMessageCodes(SearchDTO searchCriteria);

}
