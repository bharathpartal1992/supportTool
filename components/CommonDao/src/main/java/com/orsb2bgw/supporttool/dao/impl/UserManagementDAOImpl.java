package com.orsb2bgw.supporttool.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.orsb2bgw.supporttool.Objects.dto.UserDTO;
import com.orsb2bgw.supporttool.dao.UserManagementDAO;
import com.orsb2bgw.supporttool.util.B2BLogger;

@Repository("userManagementDAO")
public class UserManagementDAOImpl implements UserManagementDAO {

	@Autowired
	DataSource dataSource;
	
	/*@Autowired
	DataSource dataSource1;*/


	 @Autowired
	 private ApplicationContext context;

	 private DataSource getDataSource(){
				DataSource dataSource1=null;
				try{
				if(context.getBean("dataSource1")!=null)
					dataSource1=(DataSource) context.getBean("dataSource1");
				//return dataSource1;
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
				/* System.out.println(ds);
				 System.out.println(jdbcTemplate);*/
			}
			return jdbcTemplate;
		}
	private static B2BLogger logger=B2BLogger.getLogger(UserManagementDAOImpl.class);
	
	@Override
	@Transactional
	public int registerUser(UserDTO user) {
		JdbcTemplate jdbcTemplate =getJdbcTemplate(user.getSiteName());
		
		
		
		int success=0;
		String sqlToAddNewUser = "insert into orss_support_tool_users (user_name,pass_word,role) values (?,?,?)";
		String queryToGetExistingUser ="SELECT USER_NAME FROM ORSS_SUPPORT_TOOL_USERS WHERE UPPER(USER_NAME)='"+user.getUsername().toUpperCase().trim()+"'";
		List<Map<String, Object>> existingUser=jdbcTemplate.queryForList(queryToGetExistingUser);
		if (existingUser!=null && !existingUser.isEmpty()){
		
			return 400;
		
		}else{
		try
		{
		 success=jdbcTemplate
				.update(sqlToAddNewUser,
						new Object[] { user.getUsername(),
										user.getPassword(), user.getUserRole() });
		 
			logger.info("User has been registered successfully.");
		}
		catch(Exception e)
		{
			logger.error("Exception",e);
		}
		return success;
		}

	
	}

	@Override
	@Transactional
	public List<UserDTO> getAllUsers(UserDTO user) {
		//JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		JdbcTemplate jdbcTemplate =getJdbcTemplate(user.getSiteName());
		
		
		
		String queryToGetExistingUsers ="SELECT USER_NAME,STATUS FROM ORSS_SUPPORT_TOOL_USERS WHERE ROLE != 'ROLE_ADMIN' order by USER_NAME";
		List<UserDTO> users=null;
		
		try
		{
		users= jdbcTemplate.query(queryToGetExistingUsers,new UserProfileRowMapper());
		
		logger.info("Details of all users fetched successfully.");
	}
	catch(Exception e)
	{
		logger.error("Exception",e);
	}
		return users;
		
	}
	private final class UserProfileRowMapper implements RowMapper<UserDTO>
	{

		public UserDTO mapRow(ResultSet rs, int index) throws SQLException {
			
			return new UserDTO(rs.getString("USER_NAME"),
					rs.getBoolean("STATUS"));
		}
		
	}

	@Override
	@Transactional
	public int updateUserPassword(UserDTO user) {

		JdbcTemplate jdbcTemplate =getJdbcTemplate(user.getSiteName());
		int success=0;
		String queryToUpdateExistingUserPassword="UPDATE ORSS_SUPPORT_TOOL_USERS set PASS_WORD=? where USER_NAME=?";
		String queryToGetExistingUser ="SELECT USER_NAME FROM ORSS_SUPPORT_TOOL_USERS WHERE UPPER(USER_NAME)='"+user.getUsername().toUpperCase().trim()+"'";
		List<Map<String, Object>> existingUser=jdbcTemplate.queryForList(queryToGetExistingUser);
		if (existingUser !=null && !existingUser.isEmpty()){
		
			return -1;
		
		}
		else
		{
			try
			{
			 success=jdbcTemplate.update(queryToUpdateExistingUserPassword,
					new Object[] {user.getPassword(),user.getUsername()});
			
				logger.info("User Password has been updated successfully.");
			}
			catch(Exception e)
			{
				logger.error("Exception",e);
			}
			return success;
			
		}
	}

	@Override
	@Transactional
	public int deleteUser(UserDTO user) {
		
		JdbcTemplate jdbcTemplate =getJdbcTemplate(user.getSiteName());
		
		int success=0;
		String queryToDeleteExistingUser="UPDATE ORSS_SUPPORT_TOOL_USERS set STATUS=0 where USER_NAME=?";
		String queryToGetExistingUser ="SELECT USER_NAME FROM ORSS_SUPPORT_TOOL_USERS WHERE UPPER(USER_NAME)='"+user.getUsername().toUpperCase().trim()+"'";
		List<Map<String, Object>> existingUser=jdbcTemplate.queryForList(queryToGetExistingUser);
		if (existingUser ==null || existingUser.isEmpty()){
		
			return -1;
		
		}
		else
		{
			try
			{
			 success=jdbcTemplate.update(queryToDeleteExistingUser,
					new Object[] {user.getUsername()});
			
				logger.info("User has been disabled successfully.");
			}
			catch(Exception e)
			{
				logger.error("Exception",e);
			}
			return success;
			
		}
		
	}
	
	@Override
	@Transactional
	public int enableUser(UserDTO user) {
		
		JdbcTemplate jdbcTemplate =getJdbcTemplate(user.getSiteName());		
		int success=0;
		String queryToDeleteExistingUser="UPDATE ORSS_SUPPORT_TOOL_USERS set STATUS=1 where USER_NAME=?";
		String queryToGetExistingUser ="SELECT USER_NAME FROM ORSS_SUPPORT_TOOL_USERS WHERE UPPER(USER_NAME)='"+user.getUsername().toUpperCase().trim()+"'";
		List<Map<String, Object>> existingUser=jdbcTemplate.queryForList(queryToGetExistingUser);
		if (existingUser ==null || existingUser.isEmpty()){
		
			return -1;
		
		}
		else
		{
			try
			{
			 success=jdbcTemplate.update(queryToDeleteExistingUser,
					new Object[] {user.getUsername()});
			
			 
				logger.info("User Access has been enabled successfully.");
			}
			catch(Exception e)
			{
				logger.error("Exception",e);
			}
			return success;
			
		}
		
	}
}
