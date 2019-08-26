package com.orsb2bgw.supporttool.dao;

import java.util.List;

import com.orsb2bgw.supporttool.Objects.dto.UserDTO;

public interface UserManagementDAO  {

	public int registerUser(UserDTO user);
	
	public List<UserDTO> getAllUsers(UserDTO user);
	
	public int updateUserPassword(UserDTO user);
	
	public int deleteUser(UserDTO user);
	
	public int enableUser(UserDTO user);
	
}
