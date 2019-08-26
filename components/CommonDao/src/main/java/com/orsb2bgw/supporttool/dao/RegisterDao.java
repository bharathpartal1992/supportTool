package com.orsb2bgw.supporttool.dao;

import java.util.List;
import com.orsb2bgw.supporttool.Objects.dto.UserDTO;


public interface RegisterDao {
	
	public int registerUser(UserDTO user);
	
	public List<UserDTO> getAllUsers();
	
	public int updateUserPassword(UserDTO user);
	
	public int deleteUser(UserDTO user);
}
