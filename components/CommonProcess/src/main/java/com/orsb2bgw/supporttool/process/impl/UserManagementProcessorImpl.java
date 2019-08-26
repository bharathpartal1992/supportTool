package com.orsb2bgw.supporttool.process.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.orsb2bgw.supporttool.Objects.constants.ServiceMethods;
import com.orsb2bgw.supporttool.Objects.dto.SearchDTO;
import com.orsb2bgw.supporttool.Objects.dto.SupplierDTO;
import com.orsb2bgw.supporttool.Objects.dto.SupportToolRequest;
import com.orsb2bgw.supporttool.Objects.dto.UserDTO;
import com.orsb2bgw.supporttool.dao.AuditDao;
import com.orsb2bgw.supporttool.dao.SupplierManagementDAO;
import com.orsb2bgw.supporttool.dao.UserManagementDAO;
import com.orsb2bgw.supporttool.process.ISupportProcessor;
import com.orsb2bgw.supporttool.util.HashCode;
@Service("userManagement")
public class UserManagementProcessorImpl implements ISupportProcessor {


	@Autowired
	UserManagementDAO userManagementDAO;
	
	@Autowired
	SupplierManagementDAO supplierManagementDAO;
	
	@Autowired
	HashCode passwordEncoder;
	
	@Autowired
	AuditDao auditDao;
	
	//PasswordEncode passwordEncoder;

	@Override
	public void process(SupportToolRequest supportToolRequest) {
		
		if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.USER_REGISTRATION))
		{
			
			int result=setUser((UserDTO)supportToolRequest.getRequest());
			
			
			supportToolRequest.setResponse(result);
		}
		if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.GET_SITE_STATUS))
		{
			
			String result=auditDao.getSiteStatus((String)supportToolRequest.getRequest());			
			supportToolRequest.setResponse(result);
		}
		
		if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.SUPPLIER_REGISTRATION))
		{
			supportToolRequest.setResponse(setSupplier((SupplierDTO)supportToolRequest.getRequest()));
		}
		
		if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.GET_SUPPLIERS))
		{
			supportToolRequest.setResponse(getAllSuppliers((SearchDTO)supportToolRequest.getRequest()));
		}
		
		if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.SUPPLIER_DEREGISTRATION))
		{
			supportToolRequest.setResponse(deleteSupplier((SupplierDTO)supportToolRequest.getRequest()));
		}
		
		if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.FETCH_USERS))
		{
			supportToolRequest.setResponse(getUsers((UserDTO)supportToolRequest.getRequest()));
		}
		
		if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.USER_PWD_UPDATION))
		{
			int result=updateUserPassword((UserDTO)supportToolRequest.getRequest());
			supportToolRequest.setResponse(result);
		}
		if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.ENABLE_USER_ACCESS))
		{
			int result=enableUserAccess((UserDTO)supportToolRequest.getRequest());
			supportToolRequest.setResponse(result);
		}
		if(supportToolRequest.getServiceMethod().equalsIgnoreCase(ServiceMethods.DISABLE_USER_ACCESS))
		{
			int result=disableUserAccess((UserDTO)supportToolRequest.getRequest());
			supportToolRequest.setResponse(result);
		}
	}
	private int disableUserAccess(UserDTO user) {
		return userManagementDAO.deleteUser(user);
	}
	private int enableUserAccess(UserDTO user) {
		
		return userManagementDAO.enableUser(user);
	}
	private int updateUserPassword(UserDTO user) {
		String hashPassword = passwordEncoder.getHashPassword(user.getPassword());
		user.setPassword(hashPassword);
		
		int result=userManagementDAO.updateUserPassword(user);
		return result;
		
	}
	private List<UserDTO> getUsers(UserDTO user) {
		
		return userManagementDAO.getAllUsers(user);
	}
	private int setUser(UserDTO user) {
		
		String hashPassword = passwordEncoder.getHashPassword(user.getPassword());
		user.setPassword(hashPassword);
		int result=userManagementDAO.registerUser(user);
		return result;
	}
	
	private int deleteSupplier(SupplierDTO supplier)
	{
		int result=supplierManagementDAO.deRegisterSupplier(supplier);
		return result;
	}
	
	private int setSupplier(SupplierDTO supplier)
	{
		
		int result=supplierManagementDAO.registerSupplier(supplier);
		return result;
	}
	
	private List<SupplierDTO> getAllSuppliers(SearchDTO searchCriteria)
	{
		return supplierManagementDAO.getAllSuppliers(searchCriteria);
		
	}

}
