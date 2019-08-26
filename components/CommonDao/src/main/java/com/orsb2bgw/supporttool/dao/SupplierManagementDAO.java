package com.orsb2bgw.supporttool.dao;

import java.util.List;

import com.orsb2bgw.supporttool.Objects.dto.SearchDTO;
import com.orsb2bgw.supporttool.Objects.dto.SupplierDTO;
import com.orsb2bgw.supporttool.Objects.dto.WorkListDTO;

public interface SupplierManagementDAO  {
	
	public int registerSupplier(SupplierDTO supplier);
	
	public List<SupplierDTO> getAllSuppliers(SearchDTO searchCriteria);
	
	public int deRegisterSupplier(SupplierDTO supplier);

}
